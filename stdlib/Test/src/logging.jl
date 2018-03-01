# This file is a part of Julia. License is MIT: https://julialang.org/license

using Logging
import Logging: Info,
    shouldlog, handle_message, min_enabled_level, catch_exceptions
import Base: ismatch

#-------------------------------------------------------------------------------
# Log records
struct LogRecord
    level
    message
    _module
    group
    id
    file
    line
    kwargs
end
LogRecord(args...; kwargs...) = LogRecord(args..., kwargs)

struct Ignored ; end

#-------------------------------------------------------------------------------
# Logger with extra test-related state
mutable struct TestLogger <: AbstractLogger
    logs::Vector{LogRecord}
    min_level::LogLevel
    catch_exceptions::Bool
    shouldlog_args
end

TestLogger(; min_level=Info, catch_exceptions=false) = TestLogger(LogRecord[], min_level, catch_exceptions, nothing)
min_enabled_level(logger::TestLogger) = logger.min_level

function shouldlog(logger::TestLogger, level, _module, group, id)
    logger.shouldlog_args = (level, _module, group, id)
    true
end

function handle_message(logger::TestLogger, level, msg, _module,
                        group, id, file, line; kwargs...)
    push!(logger.logs, LogRecord(level, msg, _module, group, id, file, line, kwargs))
end

# Catch exceptions for the test logger only if specified
catch_exceptions(logger::TestLogger) = logger.catch_exceptions

function collect_test_logs(f; kwargs...)
    logger = TestLogger(; kwargs...)
    value = with_logger(f, logger)
    logger.logs, value
end


#-------------------------------------------------------------------------------
# Log testing tools

# Failure result type for log testing
mutable struct LogTestFailure <: Result
    orig_expr
    source::Union{Nothing,LineNumberNode}
    patterns
    logs
end
function Base.show(io::IO, t::LogTestFailure)
    printstyled(io, "Log Test Failed"; bold=true, color=Base.error_color())
    print(io, " at ")
    printstyled(io, t.source.file, ":", t.source.line, "\n"; bold=true, color=:default)
    println(io, "  Expression: ", t.orig_expr)
    println(io, "  Log Pattern: ", join(t.patterns, " "))
    println(io, "  Captured Logs: ")
    for l in t.logs
        println(io, "    ", l)
    end
end

# Patch support for LogTestFailure into Base.Test test set types
# TODO: Would be better if `Test` itself allowed us to handle this more neatly.
function record(::FallbackTestSet, t::LogTestFailure)
    println(t)
    throw(FallbackTestSetException("There was an error during testing"))
end

function record(ts::DefaultTestSet, t::LogTestFailure)
    if myid() == 1
        printstyled(ts.description, ": ", color=:white)
        print(t)
        Base.show_backtrace(stdout, scrub_backtrace(backtrace()))
        println()
    end
    # Hack: convert to `Fail` so that test summarization works correctly
    push!(ts.results, Fail(:test, t.orig_expr, t.logs, nothing, t.source))
    t
end

"""
    @test_logs [log_patterns...] [keywords] expression

Collect a list of log records generated by `expression` using
`collect_test_logs`, check that they match the sequence `log_patterns`, and
return the value of `expression`.  The `keywords` provide some simple filtering
of log records: the `min_level` keyword controls the minimum log level which
will be collected for the test, the `match_mode` keyword defines how matching
will be performed (the default `:all` checks that all logs and patterns match
pairwise; use `:any` to check that the pattern matches at least once somewhere
in the sequence.)

The most useful log pattern is a simple tuple of the form `(level,message)`.
A different number of tuple elements may be used to match other log metadata,
corresponding to the arguments to passed to `AbstractLogger` via the
`handle_message` function: `(level,message,module,group,id,file,line)`.
Elements which are present will be matched pairwise with the log record fields
using `==` by default, with the special cases that `Symbol`s may be used for
the standard log levels, and `Regex`s in the pattern will match string or
Symbol fields using `ismatch`.

# Examples

Consider a function which logs a warning, and several debug messages:

    function foo(n)
        @info "Doing foo with n=\$n"
        for i=1:n
            @debug "Iteration \$i"
        end
        42
    end

We can test the info message using

    @test_logs (:info,"Doing foo with n=2") foo(2)

If we also wanted to test the debug messages, these need to be enabled with the
`min_level` keyword:

    @test_logs (:info,"Doing foo with n=2") (:debug,"Iteration 1") (:debug,"Iteration 2") min_level=Debug foo(2)

The macro may be chained with `@test` to also test the returned value:

    @test (@test_logs (:info,"Doing foo with n=2") foo(2)) == 42

"""
macro test_logs(exs...)
    length(exs) >= 1 || throw(ArgumentError("""`@test_logs` needs at least one arguments.
                               Usage: `@test_logs [msgs...] expr_to_run`"""))
    patterns = Any[]
    kwargs = Any[]
    for e in exs[1:end-1]
        if e isa Expr && e.head == :(=)
            push!(kwargs, esc(Expr(:kw, e.args...)))
        else
            push!(patterns, esc(e))
        end
    end
    expression = exs[end]
    orig_expr = QuoteNode(expression)
    sourceloc = QuoteNode(__source__)
    Base.remove_linenums!(quote
        let testres=nothing, value=nothing
            try
                didmatch,logs,value = match_logs($(patterns...); $(kwargs...)) do
                    $(esc(expression))
                end
                if didmatch
                    testres = Pass(:test, nothing, nothing, value)
                else
                    testres = LogTestFailure($orig_expr, $sourceloc,
                                             $(QuoteNode(exs[1:end-1])), logs)
                end
            catch e
                testres = Error(:test_error, $orig_expr, e, catch_backtrace(), $sourceloc)
            end
            Test.record(Test.get_testset(), testres)
            value
        end
    end)
end

function match_logs(f, patterns...; match_mode::Symbol=:all, kwargs...)
    logs,value = collect_test_logs(f; kwargs...)
    if match_mode == :all
        didmatch = length(logs) == length(patterns) &&
            all(ismatch(p,l) for (p,l) in zip(patterns, logs))
    elseif match_mode == :any
        didmatch = all(any(ismatch(p,l) for l in logs) for p in patterns)
    end
    didmatch,logs,value
end

# TODO: Use a version of parse_level from stdlib/Logging, when it exists.
function parse_level(level::Symbol)
    if      level == :belowminlevel  return  Logging.BelowMinLevel
    elseif  level == :debug          return  Logging.Debug
    elseif  level == :info           return  Logging.Info
    elseif  level == :warn           return  Logging.Warn
    elseif  level == :error          return  Logging.Error
    elseif  level == :abovemaxlevel  return  Logging.AboveMaxLevel
    else
        throw(ArgumentError("Unknown log level $level"))
    end
end

logfield_ismatch(a, b) = a == b
logfield_ismatch(r::Regex, b) = ismatch(r, b)
logfield_ismatch(r::Regex, b::Symbol) = ismatch(r, String(b))
logfield_ismatch(a::Symbol, b::LogLevel) = parse_level(a) == b
logfield_ismatch(a::Ignored, b) = true

function ismatch(pattern::Tuple, r::LogRecord)
    stdfields = (r.level, r.message, r._module, r.group, r.id, r.file, r.line)
    all(logfield_ismatch(p,f) for (p,f) in zip(pattern, stdfields[1:length(pattern)]))
end

"""
    @test_deprecated [pattern] expression

When `--depwarn=yes`, test that `expression` emits a deprecation warning and
return the value of `expression`.  The log message string will be matched
against `pattern` which defaults to `r"deprecated"i`.

When `--depwarn=no`, simply return the result of executing `expression`.  When
`--depwarn=error`, check that an ErrorException is thrown.

# Examples

```
# Deprecated in julia 0.7
@test_deprecated num2hex(1)

# The returned value can be tested by chaining with @test:
@test (@test_deprecated num2hex(1)) == "0000000000000001"
```
"""
macro test_deprecated(exs...)
    1 <= length(exs) <= 2 || throw(ArgumentError("""`@test_deprecated` expects one or two arguments.
                               Usage: `@test_deprecated [pattern] expr_to_run`"""))
    pattern = length(exs) == 1 ? r"deprecated"i : esc(exs[1])
    expression = esc(exs[end])
    res = quote
        dw = Base.JLOptions().depwarn
        if dw == 2
            # TODO: Remove --depwarn=error if possible and replace with a more
            # flexible mechanism so we don't have to do this.
            @test_throws ErrorException $expression
        elseif dw == 1
            @test_logs (:warn, $pattern, Ignored(), :depwarn) match_mode=:any $expression
        else
            $expression
        end
    end
    # Propagate source code location of @test_logs to @test macro
    # FIXME: Use rewrite_sourceloc!() for this - see #22623
    res.args[4].args[2].args[2].args[2] = __source__
    res.args[4].args[3].args[2].args[2].args[2] = __source__
    res
end

