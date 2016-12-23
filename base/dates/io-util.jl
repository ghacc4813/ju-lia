### Parsing utilities

macro chk1(expr,label=:error)
    quote
        x = $(esc(expr))
        if isnull(x[1])
            @goto $label
        else
            get(x[1]),x[2]
        end
    end
end


@generated function _tryparse{T, N}(fmt::DateFormat{T, NTuple{N}}, str::AbstractString)
    quote
        R = Nullable{NTuple{7,Int}}
        t = fmt.tokens
        l = fmt.locale
        len = endof(str)

        state = start(str)
        err_idx = 1
        Base.@nexprs $N i->val_i = 0
        Base.@nexprs $N i->(begin
            state > len && @goto done
            (val_i, state) = @chk1 tryparsenext(t[i], str, state, len, l)
            err_idx += 1
        end)
        state <= len && @goto error

        @label done
        parts = Base.@ntuple $N val
        return R(reorder_args(parts, fmt.field_order, fmt.field_defaults, err_idx)::NTuple{7,Int})

        @label error
        return R((err_idx,state,0,0,0,0,0), false)
    end
end

function tryfailparse{T}(dt, df::DateFormat{T})
    maybedt = _tryparse(df, dt)
    if isnull(maybedt)
        err_data = maybedt.value # Unsafe! but _tryparse loads error data here
        err_idx = err_data[1]
        state = err_data[2]

        if err_idx > length(df.tokens)
            throw(ArgumentError("Found extra characters at the end of date time string"))
        else
            throw(ArgumentError("Unable to parse date time. Expected token $(df.tokens[err_idx]) at char $(state)"))
        end
    else
        _create_timeobj(maybedt.value, T)
    end
end

_create_timeobj(tup, T::Type{DateTime}) = T(tup...)
_create_timeobj(tup, T::Type{Date}) = T(tup[1:3]...)

function Base.tryparse{T}(df::DateFormat{T}, dt::AbstractString)
    R = Nullable{T}
    tup = _tryparse(df, dt)
    if isnull(tup)
        R()
    else
        R(_create_timeobj(tup.value, T))
    end
end

function Base.tryparse(df::DateFormat{Date}, dt::AbstractString)
    R = Nullable{Date}
    tup = _tryparse(df, dt)
    if isnull(tup)
        R()
    else
        R(Date(tup.value[1:3]...))
    end
end

function reorder_args{Nv, Ni}(val::NTuple{Nv}, idx::NTuple{Ni}, default::NTuple{Ni}, valid_till)
    ntuple(Val{Ni}) do i
        if idx[i] == 0 || idx[i] > valid_till
            default[i]
        else
            val[idx[i]]
        end
    end
end

@inline function tryparsenext_base10_digit(str,i, len)
    R = Nullable{Int}
    i > len && @goto error
    c,ii = next(str,i)
    '0' <= c <= '9' || @goto error
    return R(c-'0'), ii

    @label error
    return R(), i
end

@inline function tryparsenext_base10(str,i,len, maxdig)
    R = Nullable{Int}
    r,i = @chk1 tryparsenext_base10_digit(str,i, len)
    for j = 2:maxdig
        d,i = @chk1 tryparsenext_base10_digit(str,i,len) done
        r = r*10 + d
    end
    @label done
    return R(r), i

    @label error
    return R(), i
end

@inline function tryparsenext_base10_frac(str,i,len,maxdig)
    R = Nullable{Int}
    r,i = @chk1 tryparsenext_base10_digit(str,i,len)
    for j = 2:maxdig
        nd,i = tryparsenext_base10_digit(str,i,len)
        if isnull(nd)
            for k = j:maxdig
                r *= 10
            end
            break
        end
        d = get(nd)
        r = 10*r + d
    end
    return R(r), i

    @label error
    return R(), i
end

@inline function tryparsenext_char(str,i,len,cc::Char)::Tuple{Nullable{Char},Int}
    R = Nullable{Char}
    i > len && @goto error
    c,ii = next(str,i)
    c == cc || @goto error
    return R(c), ii

    @label error
    return R(), i
end

# fast version for English
@inline function tryparsenext_word(str, i, len, locale::DateLocale{:english}, maxchars=typemax(Int))
    for j=1:maxchars
        i > len && break
        c, ii = next(str, i)
        !((c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z')) && break
        i=ii
    end
    return Nullable{Int}(0), i
end

@inline function tryparsenext_word(str, i, len, locale, maxchars=typemax(Int))
    for j=1:maxchars
        i > len && break
        c, ii = next(str, i)
        !isalpha(c) && break
        i=ii
    end
    return Nullable{Int}(0), i
end

function minwidth(num, n)
    s = string(abs(num))
    s = length(s) < n ?  lpad(s, n, 0) : s
    num < 0 ? string('-', s) : s
end

function rfixwidth(num, n)
    s = string(num)
    length(s) > n ? s[end-(n-1):end] : lpad(s, n, 0)
end

