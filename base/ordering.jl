# This file is a part of Julia. License is MIT: https://julialang.org/license

module Order


import ..@__MODULE__, ..parentmodule
const Base = parentmodule(@__MODULE__)
import .Base:
    AbstractVector, @propagate_inbounds, isless, identity, getindex, reverse,
    +, -, !, &, <, |

## notions of element ordering ##

export # not exported by Base
    Ordering, Forward, Reverse,
    By, Lt, Perm,
    ReverseOrdering, ForwardOrdering,
    DirectOrdering,
    lt, ord, ordtype, maybe_skip_by

"""
    Base.Order.Ordering

Abstract type which represents a total order on some set of elements.

Use [`Base.Order.lt`](@ref) to compare two elements according to the ordering.
"""
abstract type Ordering end

struct ForwardOrdering <: Ordering end

"""
    ReverseOrdering(fwd::Ordering=Forward)

A wrapper which reverses an ordering.

For a given `Ordering` `o`, the following holds for all  `a`, `b`:

    lt(ReverseOrdering(o), a, b) == lt(o, b, a)
"""
struct ReverseOrdering{Fwd<:Ordering} <: Ordering
    fwd::Fwd
end

ReverseOrdering(rev::ReverseOrdering) = rev.fwd
ReverseOrdering(fwd::Fwd) where {Fwd} = ReverseOrdering{Fwd}(fwd)
ReverseOrdering() = ReverseOrdering(ForwardOrdering())

"""
    reverse(o::Base.Ordering)

reverses ordering specified by `o`.

"""
reverse(o::Ordering) = ReverseOrdering(o)

const DirectOrdering = Union{ForwardOrdering,ReverseOrdering{ForwardOrdering}}

"""
    Base.Order.Forward

Default ordering according to [`isless`](@ref).
"""
const Forward = ForwardOrdering()

"""
    Base.Order.Reverse

Reverse ordering according to [`isless`](@ref).
"""
const Reverse = ReverseOrdering()

struct MaybeSkipBy{T}
    id::T
end

"""
    Base.maybe_skip_by(a)

Generates an object such that if the `require_by` flag is set
in `ord` or the By class is used, then `by` is applied to `a`.
But if the `require_by` flag is cleared  the `MaybeBy` class is
used, then `by` is applied to `a`.  This exists to support the
apply_by_to_key=false option in the searchsorted family of
functions.
"""
maybe_skip_by(a) = MaybeSkipBy(a)

maybe_apply(by, a) = by(a)
maybe_apply(::Any, a::MaybeSkipBy) = a.id
always_apply(by, a) = by(a)
always_apply(by, a::MaybeSkipBy) = by(a.id)
_id(a) = a
_id(a::MaybeSkipBy) = a.id


"""
    By(by, order::Ordering=Forward)

`Ordering` which applies `order` to elements after they have been transformed
by the function `by`.
"""
struct By{T, O} <: Ordering
    by::T
    order::O
end

struct MaybeBy{T, O} <: Ordering
    by::T
    order::O
end


# backwards compatibility with VERSION < v"1.5-"
By(by) = By(by, Forward)

"""
    Lt(lt)

`Ordering` which calls `lt(a, b)` to compare elements. `lt` should
obey the same rules as implementations of [`isless`](@ref).
"""
struct Lt{T} <: Ordering
    lt::T
end

"""
    Perm(order::Ordering, data::AbstractVector)

`Ordering` on the indices of `data` where `i` is less than `j` if `data[i]` is
less than `data[j]` according to `order`. In the case that `data[i]` and
`data[j]` are equal, `i` and `j` are compared by numeric value.
"""
struct Perm{O<:Ordering,V<:AbstractVector} <: Ordering
    order::O
    data::V
end

ReverseOrdering(by::By) = By(by.by, ReverseOrdering(by.order))
ReverseOrdering(by::MaybeBy) = MaybeBy(by.by, ReverseOrdering(by.order))
ReverseOrdering(perm::Perm) = Perm(ReverseOrdering(perm.order), perm.data)

"""
    lt(o::Ordering, a, b)

Test whether `a` is less than `b` according to the ordering `o`.
"""
lt(o::ForwardOrdering,       a, b) = isless(_id(a),_id(b))
lt(o::ReverseOrdering,       a, b) = lt(o.fwd,_id(b),_id(a))
lt(o::By,                    a, b) =
    lt(o.order, always_apply(o.by,a), always_apply(o.by,b))
lt(o::MaybeBy,               a, b) =
    lt(o.order, maybe_apply(o.by,a), maybe_apply(o.by,b))
lt(o::Lt,                    a, b) = o.lt(_id(a),_id(b))

@propagate_inbounds function lt(p::Perm, a::Integer, b::Integer)
    da = p.data[a]
    db = p.data[b]
    lt(p.order, da, db) | (!lt(p.order, db, da) & (a < b))
end

# If the 4th argument to _ord is Val{false}, then the `by` function
# is skipped for any element a of the form maybe_skip_by(a)

_ord(lt::typeof(isless), by::typeof(identity), order::Ordering, ::Val{true}) = 
    order
_ord(lt::typeof(isless), by::typeof(identity), order::Ordering, ::Val{false}) =
    order
_ord(lt::typeof(isless), by,                   order::Ordering, ::Val{true}) =
    By(by, order)
_ord(lt::typeof(isless), by,                   order::Ordering, ::Val{false}) =
    MaybeBy(by, order)

function _ord(lt, by, order::Ordering, ::Val{false})
    if order === Forward
        return Lt((x, y) -> lt(maybe_apply(by,x), maybe_apply(by,y)))
    elseif order === Reverse
        return Lt((x, y) -> lt(maybe_apply(by,y), maybe_apply(by,x)))
    else
        error("Passing both lt= and order= arguments is ambiguous; please pass order=Forward or order=Reverse (or leave default)")
    end
end

function _ord(lt, by, order::Ordering, ::Val{true})
    if order === Forward
        return Lt((x, y) -> lt(always_apply(by,x), always_apply(by,y)))
    elseif order === Reverse
        return Lt((x, y) -> lt(always_apply(by,y), always_apply(by,x)))
    else
        error("Passing both lt= and order= arguments is ambiguous; please pass order=Forward or order=Reverse (or leave default)")
    end
end


 

"""
    ord(lt, by, rev::Union{Bool, Nothing}, 
        order::Ordering=Forward, require_by=true)

Construct an [`Ordering`](@ref) object from the same arguments used by
[`sort!`](@ref).
Elements are first transformed by the function `by` (which may be
[`identity`](@ref)) and are then compared according to either the function `lt`
or an existing ordering `order`. `lt` should be [`isless`](@ref) or a function
which obeys similar rules. Finally, the resulting order is reversed if
`rev=true`.

Passing an `lt` other than `isless` along with an `order` other than
[`Base.Order.Forward`](@ref) or [`Base.Order.Reverse`](@ref) is not permitted,
otherwise all options are independent and can be used together in all possible
combinations.

If `require_by` is true, then function `maybe_skip_by(a)` 
is the same as `identity(a)` and therefore
`by` is  applied in all cases.
If `require_by` is false then the `by` function is
not applied to element of the form `maybe_skip_by(a)`; instead `a` itself
is returned.   This option exists to support the `apply_by_to_key` option
in the searchsorted family of functions.

"""
ord(lt, by, rev::Nothing, order::Ordering=Forward, require_by=true) =
    _ord(lt, by, order, Val(require_by))

function ord(lt, by, rev::Bool, order::Ordering=Forward, require_by=true)
    o = _ord(lt, by, order, Val(require_by))
    return rev ? ReverseOrdering(o) : o
end


# This function is not in use anywhere in Base but we observed
# use in sorting-related packages (#34719). It's probably best to move
# this functionality to those packages in the future; let's remind/force
# ourselves to deprecate this in v2.0.
# The following clause means `if VERSION < v"2.0-"` but it also works during
# bootstrap. For the same reason, we need to write `Int32` instead of `Cint`.
if ccall(:jl_ver_major, Int32, ()) < 2
    ordtype(o::ReverseOrdering, vs::AbstractArray) = ordtype(o.fwd, vs)
    ordtype(o::Perm,            vs::AbstractArray) = ordtype(o.order, o.data)
    # TODO: here, we really want the return type of o.by, without calling it
    ordtype(o::By,              vs::AbstractArray) = try typeof(o.by(vs[1])) catch; Any end
    ordtype(o::Ordering,        vs::AbstractArray) = eltype(vs)
end

end
