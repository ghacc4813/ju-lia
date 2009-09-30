function print(x:any)
    # default print function, call builtin
    _print(x)
    return ()
end

function ref(t:Tuple, i:int32)
    return tupleref(t, unbox(i))
end

function ref(b:buffer, i:int32)
    return box(typeof(b).parameters[1], bufferref(b, unbox(i)))
end

function set(b:buffer, i:int32, x)
    bufferset(b, unbox(i), x)
    return x
end

function length(t:Tuple)
    return box(typename(int32), tuplelen(t))
end

function length(b:buffer)
    return b.length
end

function `+`(x:int32, y:int32)
    return box(typename(int32), add_int32(unbox(x), unbox(y)))
end

function `+`(x:double, y:double)
    return box(typename(double), add_double(unbox(x), unbox(y)))
end

function `-`(x:int32, y:int32)
    return box(typename(int32), sub_int32(unbox(x), unbox(y)))
end

function `-`(x:int32)
    return box(typename(int32), neg_int32(unbox(x)))
end

function `*`(x:int32, y:int32)
    return box(typename(int32), mul_int32(unbox(x), unbox(y)))
end

function `/`(x:int32, y:int32)
    return box(typename(int32), div_int32(unbox(x), unbox(y)))
end

function `<=`(x:int32, y:int32)
    return lt_int32(unbox(x),unbox(y)) || eq_int32(unbox(x),unbox(y))
end

function `<`(x:int32, y:int32)
    return lt_int32(unbox(x),unbox(y))
end

function `==`(x:int32, y:int32)
    return eq_int32(unbox(x),unbox(y))
end
