module Allocs

using Base.StackTraces: StackTrace, StackFrame, lookup
using Base: InterpreterIP

# --- Raw results structs, originally defined in C ---

# The C jl_bt_element_t object contains either an IP pointer (size_t) or a void*.
const BTElement = Csize_t;

# matches jl_raw_backtrace_t on the C side
struct RawBacktrace
    data::Ptr{BTElement} # in C: *jl_bt_element_t
    size::Csize_t
end

# matches jl_raw_alloc_t on the C side
struct RawAlloc
    type::Ptr{Type}
    backtrace::RawBacktrace
    size::Csize_t
end

# matches jl_profile_allocs_raw_results_t on the C side
struct RawResults
    allocs::Ptr{RawAlloc}
    num_allocs::Csize_t
end

"""
    Profile.Allocs.@profile [sample_rate=0.0001] expr

Profile allocations that happen during `expr`, returning
both the result and and AllocResults struct.

A sample rate of 1.0 will record everything; 0.0 will record nothing.

```julia
julia> Profile.Allocs.@profile sample_rate=0.01 peakflops()
1.03733270279065e11

julia> results = Profile.Allocs.fetch()

julia> last(sort(results.allocs, by=x->x.size))
Profile.Allocs.Alloc(Vector{Any}, Base.StackTraces.StackFrame[_new_array_ at array.c:127, ...], 5576)
```
"""
macro profile(opts, ex)
    _prof_expr(ex, opts)
end
macro profile(ex)
    _prof_expr(ex, :(sample_rate=0.0001))
end

# globals used for tracking how many allocs we're missing
# vs the alloc counters used by @time
const _g_gc_num_before = Ref{Base.GC_Num}()
const _g_sample_rate = Ref{Real}()
const _g_expected_sampled_allocs = Ref{Float64}(0)

function _prof_expr(expr, opts)
    quote
        $start(; $(esc(opts)))
        local res = $(esc(expr))
        $stop()
        res
    end
end

"""
    Profile.Allocs.start(sample_rate::Real)

Begin recording allocations with the given sample rate
A sample rate of 1.0 will record everything; 0.0 will record nothing.
"""
function start(; sample_rate::Real)
    ccall(:jl_start_alloc_profile, Cvoid, (Cdouble,), Float64(sample_rate))

    _g_sample_rate[] = sample_rate
    _g_gc_num_before[] = Base.gc_num()
end

"""
    Profile.Allocs.stop()

Stop recording allocations.
"""
function stop()
    ccall(:jl_stop_alloc_profile, Cvoid, ())

    # increment a counter of how many allocs we would expect
    # the memory profiler to see, based on how many allocs
    # actually happened.
    gc_num_after = Base.gc_num()
    gc_diff = Base.GC_Diff(gc_num_after, _g_gc_num_before[])
    alloc_count = Base.gc_alloc_count(gc_diff)
    expected_samples = alloc_count * _g_sample_rate[]
    _g_expected_sampled_allocs[] += expected_samples
end

"""
    Profile.Allocs.clear()

Clear all previously profiled allocation information from memory.
"""
function clear()
    ccall(:jl_free_alloc_profile, Cvoid, ())

    _g_expected_sampled_allocs[] = 0
    return nothing
end

"""
    Profile.Allocs.fetch()

Retrieve the recorded allocations, and decode them into Julia
objects which can be analyzed.
"""
function fetch()
    raw_results = ccall(:jl_fetch_alloc_profile, RawResults, ())
    decoded_results = decode(raw_results)

    # avoid divide-by-0 errors
    if _g_expected_sampled_allocs[] > 0
        missed_allocs = max(0, _g_expected_sampled_allocs[] - length(decoded_results.allocs))
        missed_percentage = max(0, round(Int, missed_allocs / _g_expected_sampled_allocs[] * 100))
        if missed_percentage > 0
            @warn("The allocation profiler is not fully implemented, and missed approximately" *
            " $(missed_percentage)% (estimated $(round(Int, missed_allocs)) / $(round(Int,
            _g_expected_sampled_allocs[]))) " *
                    "of sampled allocs in the last run. " *
                    "For more info see https://github.com/JuliaLang/julia/issues/43688")
        else
            @warn("The allocation profiler is not fully implemented, and may have missed" *
            " some of the allocs. " *
                    "For more info see https://github.com/JuliaLang/julia/issues/43688")
        end
    end
    return decoded_results
end

# decoded results

const BacktraceCache = Dict{BTElement,Vector{StackFrame}}

# only constructed lazily
struct Alloc
    type::Any
    stacktrace::StackTrace
    size::Int
end

struct AllocResults
    stack_frames::BacktraceCache
    alloc_stack_trace::Vector{Vector{BTElement}} # TODO: keep as Vector{BTElement}
    alloc_type::Vector{Ptr{Type}}
    alloc_size::Vector{Int}
end

# Without this, the Alloc's stacktrace prints for lines and lines and lines...
function Base.show(io::IO, ::AllocResults)
    print(io, "AllocResults")
end

# copied from julia_internal.h
const JL_BUFF_TAG = UInt(0x4eadc000)

struct CorruptType end
struct BufferType end

function load_type(ptr::Ptr{Type})
    if UInt(ptr) < UInt(4096)
        return CorruptType
    elseif UInt(ptr) == JL_BUFF_TAG
        return BufferType
    end
    return unsafe_pointer_to_objref(ptr)
end

# function decode_alloc(cache::BacktraceCache, raw_alloc::RawAlloc)::Alloc
#     Alloc(
#         load_type(raw_alloc.type),
#         stacktrace_memoized(cache, raw_alloc.backtrace),
#         UInt(raw_alloc.size)
#     )
# end

function decode(raw_results::RawResults)::AllocResults
    cache = BacktraceCache()
    alloc_type = Vector{Ptr{Type}}()
    alloc_size = Vector{Int}()
    alloc_stack_trace = Vector{Vector{BTElement}}()

    # TODO: sizehint all of these? idk
    sizehint!(alloc_type, raw_results.num_allocs)
    sizehint!(alloc_size, raw_results.num_allocs)
    sizehint!(alloc_stack_trace, raw_results.num_allocs)

    for i in 1:raw_results.num_allocs
        raw_alloc = unsafe_load(raw_results.allocs, i)
        push!(alloc_type, raw_alloc.type) # defer the unsafe_load?
        push!(alloc_size, raw_alloc.size)
        bt_array = BTElement[
            unsafe_load(raw_alloc.backtrace.data, i) for i in 1:raw_alloc.backtrace.size
        ]
        push!(alloc_stack_trace, bt_array)
    end

    return AllocResults(
        cache,
        alloc_stack_trace,
        alloc_type,
        alloc_size,
    )
end

function get_frames(cache::BacktraceCache, element::BTElement)
    return get!(cache, element) do
        return lookup(element)
    end
end

function stacktrace_memoized(
    cache::BacktraceCache,
    raw_trace::RawBacktrace
)::StackTrace
    stacktrace = StackTrace()
    sizehint!(stacktrace, raw_trace.size * 3 ÷ 2)

    for i in 1:raw_trace.size
        for frame in get_frames(cache, unsafe_load(raw_trace.data, i))
            push!(stacktrace, frame)
        end
    end

    return stacktrace
end

# Precompile once for the package cache.
@assert precompile(start, ())
@assert precompile(stop, ())
@assert precompile(fetch, ())

end
