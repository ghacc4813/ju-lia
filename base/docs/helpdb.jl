doc"""
    !(x)

Boolean not

"""
!

doc"""
    \$(x, y)

Bitwise exclusive or

"""
$

doc"""
    &(x, y)

Bitwise and

"""
&

doc"""
    +(x, y...)

Addition operator. "x+y+z+..." calls this function with all
arguments, i.e. "+(x, y, z, ...)".

"""
+

doc"""
    -(x)

Unary minus operator.

    -(x, y)

Subtraction operator.

"""
-

doc"""
    @__FILE__() -> AbstractString

"@__FILE__" expands to a string with the absolute path and file
name of the script being run. Returns "nothing" if run from a
REPL or an empty string if evaluated by "julia -e <expr>".

"""
@__FILE__

doc"""
    @allocated()

A macro to evaluate an expression, discarding the resulting value,
instead returning the total number of bytes allocated during
evaluation of the expression. Note: the expression is evaluated
inside a local function, instead of the current context, in order
to eliminate the effects of compilation, however, there still may
be some allocations due to JIT compilation.  This also makes the
results inconsistent with the "@time" macros, which do not try to
adjust for the effects of compilation.

"""
@allocated

doc"""
    @async()

Schedule an expression to run on the local machine, also adding it
to the set of items that the nearest enclosing "@sync" waits for.

"""
@async

doc"""
    @code_llvm()

Evaluates the arguments to the function call, determines their
types, and calls "code_llvm()" on the resulting expression

"""
@code_llvm

doc"""
    @code_lowered()

Evaluates the arguments to the function call, determines their
types, and calls "code_lowered()" on the resulting expression

"""
@code_lowered

doc"""
    @code_native()

Evaluates the arguments to the function call, determines their
types, and calls "code_native()" on the resulting expression

"""
@code_native

doc"""
    @code_typed()

Evaluates the arguments to the function call, determines their
types, and calls "code_typed()" on the resulting expression

"""
@code_typed

doc"""
    @code_warntype()

Evaluates the arguments to the function call, determines their
types, and calls "code_warntype()" on the resulting expression

"""
@code_warntype

doc"""
    @edit()

Evaluates the arguments to the function call, determines their
types, and calls the "edit" function on the resulting expression

"""
@edit

doc"""
    @elapsed()

A macro to evaluate an expression, discarding the resulting value,
instead returning the number of seconds it took to execute as a
floating-point number.

"""
@elapsed

doc"""
    @eval()

Evaluate an expression and return the value.

"""
@eval

doc"""
    @evalpoly(z, c...)

Evaluate the polynomial \sum_k c[k] z^{k-1} for the coefficients
"c[1]", "c[2]", ...; that is, the coefficients are given in
ascending order by power of "z".  This macro expands to efficient
inline code that uses either Horner's method or, for complex "z",
a more efficient Goertzel-like algorithm.

"""
@evalpoly

doc"""
    @fetch()

Equivalent to "fetch(@spawn expr)".

"""
@fetch

doc"""
    @fetchfrom()

Equivalent to "fetch(@spawnat p expr)".

"""
@fetchfrom

doc"""
    @gensym()

Generates a gensym symbol for a variable. For example, "@gensym x
y" is transformed into "x = gensym("x"); y = gensym("y")".

"""
@gensym

doc"""
    @less()

Evaluates the arguments to the function call, determines their
types, and calls the "less" function on the resulting expression

"""
@less

doc"""
    @linux()

Given "@linux? a : b", do "a" on Linux and "b" elsewhere. See
documentation for Handling Platform Variations in the Calling C and
Fortran Code section of the manual.

"""
@linux

doc"""
    @osx()

Given "@osx? a : b", do "a" on OS X and "b" elsewhere. See
documentation for Handling Platform Variations in the Calling C and
Fortran Code section of the manual.

"""
@osx

doc"""
    @parallel()

A parallel for loop of the form

    @parallel [reducer] for var = range
        body
    end

The specified range is partitioned and locally executed across all
workers. In case an optional reducer function is specified,
@parallel performs local reductions on each worker with a final
reduction on the calling process.

Note that without a reducer function, @parallel executes
asynchronously, i.e. it spawns independent tasks on all available
workers and returns immediately without waiting for completion. To
wait for completion, prefix the call with "@sync", like

    @sync @parallel for var = range
        body
    end

"""
@parallel

doc"""
    @printf([io::IOStream], "%Fmt", args...)

Print arg(s) using C "printf()" style format specification
string. Optionally, an IOStream may be passed as the first argument
to redirect output.

"""
@printf

doc"""
    @profile()

"@profile <expression>" runs your expression while taking
periodic backtraces.  These are appended to an internal buffer of
backtraces.

"""
@profile

doc"""
    @schedule()

Wrap an expression in a Task and add it to the scheduler's queue.

"""
@schedule

doc"""
    @show()

Show an expression and result, returning the result

"""
@show

doc"""
    @spawn()

Execute an expression on an automatically-chosen process, returning
a "RemoteRef" to the result.

"""
@spawn

doc"""
    @spawnat()

Accepts two arguments, "p" and an expression, and runs the
expression asynchronously on process "p", returning a
"RemoteRef" to the result.

"""
@spawnat

doc"""
    @sprintf("%Fmt", args...)

Return "@printf" formatted output as string.

"""
@sprintf

doc"""
    @sync()

Wait until all dynamically-enclosed uses of "@async", "@spawn",
"@spawnat" and "@parallel" are complete.

"""
@sync

doc"""
    @task()

Wrap an expression in a Task without executing it, and return the
Task. This only creates a task, and does not run it.

"""
@task

doc"""
    @time()

A macro to execute an expression, printing the time it took to
execute, the number of allocations, and the total number of bytes
its execution caused to be allocated, before returning the value of
the expression.

"""
@time

doc"""
    @timed()

A macro to execute an expression, and return the value of the
expression, elapsed time, total bytes allocated, garbage collection
time, and an object with various memory allocation counters.

"""
@timed

doc"""
    @timev()

This is a verbose version of the "@time" macro, it first prints
the same information as "@time", then any non-zero memory
allocation counters, and then returns the value of the expression.

"""
@timev

doc"""
    @unix()

Given "@unix? a : b", do "a" on Unix systems (including Linux
and OS X) and "b" elsewhere. See documentation for Handling
Platform Variations in the Calling C and Fortran Code section of
the manual.

"""
@unix

doc"""
    @which()

Applied to a function call, it evaluates the arguments to the
specified function call, and returns the "Method" object for the
method that would be called for those arguments.  Applied to a
variable, it returns the module in which the variable was bound. It
calls out to the "which" function.

"""
@which

doc"""
    @windows()

Given "@windows? a : b", do "a" on Windows and "b" elsewhere.
See documentation for Handling Platform Variations in the Calling C
and Fortran Code section of the manual.

"""
@windows

doc"""
    ANY

Equivalent to "Any" for dispatch purposes, but signals the
compiler to skip code generation specialization for that field

"""
ANY

doc"""
    ARGS

An array of the command line arguments passed to Julia, as strings.

"""
ARGS

doc"""
    A_ldiv_Bc(a, b)

Matrix operator A \ B^H

"""
A_ldiv_Bc

doc"""
    A_ldiv_Bt(a, b)

Matrix operator A \ B^T

"""
A_ldiv_Bt

doc"""
    A_mul_B!(Y, A, B) -> Y

Calculates the matrix-matrix or matrix-vector product *A B* and
stores the result in *Y*, overwriting the existing value of *Y*.

    julia> A=[1.0 2.0; 3.0 4.0]; B=[1.0 1.0; 1.0 1.0]; A_mul_B!(B, A, B);

    julia> B
    2x2 Array{Float64,2}:
     3.0  3.0
     7.0  7.0

"""
A_mul_B!

doc"""
    A_mul_Bc(...)

Matrix operator A B^H

"""
A_mul_Bc

doc"""
    A_mul_Bt(...)

Matrix operator A B^T

"""
A_mul_Bt

doc"""
    A_rdiv_Bc(...)

Matrix operator A / B^H

"""
A_rdiv_Bc

doc"""
    A_rdiv_Bt(a, b)

Matrix operator A / B^T

"""
A_rdiv_Bt

doc"""
    Ac_ldiv_B(...)

Matrix operator A^H \ B

"""
Ac_ldiv_B

doc"""
    Ac_ldiv_Bc(...)

Matrix operator A^H \ B^H

"""
Ac_ldiv_Bc

doc"""
    Ac_mul_B(...)

Matrix operator A^H B

"""
Ac_mul_B

doc"""
    Ac_mul_Bc(...)

Matrix operator A^H B^H

"""
Ac_mul_Bc

doc"""
    Ac_rdiv_B(a, b)

Matrix operator A^H / B

"""
Ac_rdiv_B

doc"""
    Ac_rdiv_Bc(a, b)

Matrix operator A^H / B^H

"""
Ac_rdiv_Bc

doc"""
    ArgumentError(msg)

The parameters to a function call do not match a valid signature.

"""
ArgumentError

doc"""
    Array(dims)

"Array{T}(dims)" constructs an uninitialized dense array with
element type "T". "dims" may be a tuple or a series of integer
arguments. The syntax "Array(T, dims)" is also available, but
deprecated.

"""
Array

doc"""
    AssertionError([msg])

The asserted condition did not evalutate to "true".

"""
AssertionError

doc"""
    At_ldiv_B(...)

Matrix operator A^T \ B

"""
At_ldiv_B

doc"""
    At_ldiv_Bt(...)

Matrix operator A^T \ B^T

"""
At_ldiv_Bt

doc"""
    At_mul_B(...)

Matrix operator A^T B

"""
At_mul_B

doc"""
    At_mul_Bt(...)

Matrix operator A^T B^T

"""
At_mul_Bt

doc"""
    At_rdiv_B(a, b)

Matrix operator A^T / B

"""
At_rdiv_B

doc"""
    At_rdiv_Bt(a, b)

Matrix operator A^T / B^T

"""
At_rdiv_Bt

doc"""
    Base.linearindexing(A)

"linearindexing" defines how an AbstractArray most efficiently
accesses its elements.  If "Base.linearindexing(A)" returns
"Base.LinearFast()", this means that linear indexing with only
one index is an efficient operation.  If it instead returns
"Base.LinearSlow()" (by default), this means that the array
intrinsically accesses its elements with indices specified for
every dimension.  Since converting a linear index to multiple
indexing subscripts is typically very expensive, this provides a
traits-based mechanism to enable efficient generic code for all
array types.

An abstract array subtype "MyArray" that wishes to opt into fast
linear indexing behaviors should define "linearindexing" in the
type-domain:

    Base.linearindexing{T<:MyArray}(::Type{T}) = Base.LinearFast()

    Base.process_messages(instrm::AsyncStream, outstrm::AsyncStream)

Called by cluster managers using custom transports. It should be
called when the custom transport implementation receives the first
message from a remote worker. The custom transport must manage a
logical connection to the remote worker and provide two AsyncStream
objects, one for incoming messages and the other for messages
addressed to the remote worker.

"""
Base

doc"""
    !=(x, y)
≠(x, y)

Not-equals comparison operator. Always gives the opposite answer as
"==". New types should generally not implement this, and rely on
the fallback definition "!=(x,y) = !(x==y)" instead.

"""
Base.(:(!=))

doc"""
    !==(x, y)
≢(x, y)

Equivalent to "!is(x, y)"

"""
Base.(:(!==))

doc"""
    *(A, B)

Matrix multiplication

    *(x, y...)

Multiplication operator. "x*y*z*..." calls this function with all
arguments, i.e. "*(x, y, z, ...)".

    *(s, t)

Concatenate strings. The "*" operator is an alias to this
function.

    julia> "Hello " * "world"
    "Hello world"

"""
Base.(:(*))

doc"""
    .!=(x, y)
.≠(x, y)

Element-wise not-equals comparison operator.

"""
Base.(:(.!=))

doc"""
    .*(x, y)

Element-wise multiplication operator.

"""
Base.(:(.*))

doc"""
    .+(x, y)

Element-wise addition operator.

"""
Base.(:(.+))

doc"""
    .-(x, y)

Element-wise subtraction operator.

"""
Base.(:(.-))

doc"""
    ./(x, y)

Element-wise right division operator.

"""
Base.(:(./))

doc"""
    .<(x, y)

Element-wise less-than comparison operator.

"""
Base.(:(.<))

doc"""
    .<=(x, y)
.≤(x, y)

Element-wise less-than-or-equals comparison operator.

"""
Base.(:(.<=))

doc"""
    .==(x, y)

Element-wise equality comparison operator.

"""
Base.(:(.==))

doc"""
    .>(x, y)

Element-wise greater-than comparison operator.

"""
Base.(:(.>))

doc"""
    .>=(x, y)
.≥(x, y)

Element-wise greater-than-or-equals comparison operator.

"""
Base.(:(.>=))

doc"""
    .\(x, y)

Element-wise left division operator.

"""
Base.(:(.\))

doc"""
    .^(x, y)

Element-wise exponentiation operator.

"""
Base.(:(.^))

doc"""
    /(x, y)

Right division operator: multiplication of "x" by the inverse of
"y" on the right. Gives floating-point results for integer
arguments.

"""
Base.(:(/))

doc"""
    //(num, den)

Divide two integers or rational numbers, giving a "Rational"
result.

"""
Base.(:(//))

doc"""
    :(start[, step], stop)

Range operator. "a:b" constructs a range from "a" to "b" with
a step size of 1, and "a:s:b" is similar but uses a step size of
"s". These syntaxes call the function "colon". The colon is
also used in indexing to select whole dimensions.

"""
Base.(:(:))

doc"""
    <(x, y)

Less-than comparison operator. New numeric types should implement
this function for two arguments of the new type. Because of the
behavior of floating-point NaN values, "<" implements a partial
order. Types with a canonical partial order should implement "<",
and types with a canonical total order should implement "isless".

"""
Base.(:(<))

doc"""
    <:(T1, T2)

Subtype operator, equivalent to "issubtype(T1,T2)".

"""
Base.(:(<:))

doc"""
    <<(x, n)

Left bit shift operator.

"""
Base.(:(<<))

doc"""
    <=(x, y)
≤(x, y)

Less-than-or-equals comparison operator.

"""
Base.(:(<=))

doc"""
    ==(x, y)

Generic equality operator, giving a single "Bool" result. Falls
back to "===". Should be implemented for all types with a notion
of equality, based on the abstract value that an instance
represents. For example, all numeric types are compared by numeric
value, ignoring type. Strings are compared as sequences of
characters, ignoring encoding.

Follows IEEE semantics for floating-point numbers.

Collections should generally implement "==" by calling "=="
recursively on all contents.

New numeric types should implement this function for two arguments
of the new type, and handle comparison to other types via promotion
rules where possible.

"""
Base.(:(==))

doc"""
    ===(x, y)
≡(x, y)

See the "is()" operator

"""
Base.(:(===))

doc"""
    >(x, y)

Greater-than comparison operator. Generally, new types should
implement "<" instead of this function, and rely on the fallback
definition ">(x,y) = y<x".

"""
Base.(:(>))

doc"""
    >=(x, y)
≥(x, y)

Greater-than-or-equals comparison operator.

"""
Base.(:(>=))

doc"""
    >>(x, n)

Right bit shift operator, preserving the sign of "x".

"""
Base.(:(>>))

doc"""
    >>>(x, n)

Unsigned right bit shift operator.

"""
Base.(:(>>>))

doc"""
    \(A, B)

Matrix division using a polyalgorithm. For input matrices "A" and
"B", the result "X" is such that "A*X == B" when "A" is
square.  The solver that is used depends upon the structure of
"A".  A direct solver is used for upper- or lower triangular
"A".  For Hermitian "A" (equivalent to symmetric "A" for non-
complex "A") the "BunchKaufman" factorization is used.
Otherwise an LU factorization is used. For rectangular "A" the
result is the minimum-norm least squares solution computed by a
pivoted QR factorization of "A" and a rank estimate of A based on
the R factor.

When "A" is sparse, a similar polyalgorithm is used. For
indefinite matrices, the LDLt factorization does not use pivoting
during the numerical factorization and therefore the procedure can
fail even for invertible matrices.

    \(x, y)

Left division operator: multiplication of "y" by the inverse of
"x" on the left. Gives floating-point results for integer
arguments.

"""
Base.(:(\))

doc"""
    ^(x, y)

Exponentiation operator.

    ^(s, n)

Repeat "n" times the string "s". The "^" operator is an alias
to this function.

    julia> "Test "^3
    "Test Test Test "

"""
Base.(:(^))

doc"""
    |(x, y)

Bitwise or

"""
Base.(:(|))

doc"""
    |>(x, f)

Applies a function to the preceding argument. This allows for easy
function chaining.

    julia> [1:5;] |> x->x.^2 |> sum |> inv
    0.01818181818181818

"""
Base.(:(|>))

doc"""
    PriorityQueue(K, V[, ord])

Construct a new "PriorityQueue", with keys of type "K" and
values/priorites of type "V". If an order is not given, the
priority queue is min-ordered using the default comparison for
"V".

"""
Base.Collections.PriorityQueue

doc"""
    dequeue!(pq)

Remove and return the lowest priority key from a priority queue.

"""
Base.Collections.dequeue!

doc"""
    enqueue!(pq, k, v)

Insert the a key "k" into a priority queue "pq" with priority
"v".

"""
Base.Collections.enqueue!

doc"""
    heapify(v[, ord])

Return a new vector in binary heap order, optionally using the
given ordering.

"""
Base.Collections.heapify

doc"""
    heapify!(v[, ord])

In-place "heapify()".

"""
Base.Collections.heapify!

doc"""
    heappop!(v[, ord])

Given a binary heap-ordered array, remove and return the lowest
ordered element. For efficiency, this function does not check that
the array is indeed heap-ordered.

"""
Base.Collections.heappop!

doc"""
    heappush!(v, x[, ord])

Given a binary heap-ordered array, push a new element "x",
preserving the heap property. For efficiency, this function does
not check that the array is indeed heap-ordered.

"""
Base.Collections.heappush!

doc"""
    isheap(v[, ord])

Return true iff an array is heap-ordered according to the given
order.

"""
Base.Collections.isheap

doc"""
    peek(pq)

Return the lowest priority key from a priority queue without
removing that key from the queue.

"""
Base.Collections.peek

doc"""
    plan_r2r(A, kind[, dims[, flags[, timelimit]]])

Pre-plan an optimized r2r transform, similar to "Base.plan_fft()"
except that the transforms (and the first three arguments)
correspond to "r2r()" and "r2r!()", respectively.

"""
Base.FFTW.plan_r2r

doc"""
    plan_r2r!(A, kind[, dims[, flags[, timelimit]]])

Similar to "Base.plan_fft()", but corresponds to "r2r!()".

"""
Base.FFTW.plan_r2r!

doc"""
    r2r(A, kind[, dims])

Performs a multidimensional real-input/real-output (r2r) transform
of type "kind" of the array "A", as defined in the FFTW manual.
"kind" specifies either a discrete cosine transform of various
types ("FFTW.REDFT00", "FFTW.REDFT01", "FFTW.REDFT10", or
"FFTW.REDFT11"), a discrete sine transform of various types
("FFTW.RODFT00", "FFTW.RODFT01", "FFTW.RODFT10", or
"FFTW.RODFT11"), a real-input DFT with halfcomplex-format output
("FFTW.R2HC" and its inverse "FFTW.HC2R"), or a discrete
Hartley transform ("FFTW.DHT").  The "kind" argument may be an
array or tuple in order to specify different transform types along
the different dimensions of "A"; "kind[end]" is used for any
unspecified dimensions.  See the FFTW manual for precise
definitions of these transform types, at http://www.fftw.org/doc.

The optional "dims" argument specifies an iterable subset of
dimensions (e.g. an integer, range, tuple, or array) to transform
along. "kind[i]" is then the transform type for "dims[i]", with
"kind[end]" being used for "i > length(kind)".

See also "plan_r2r()" to pre-plan optimized r2r transforms.

"""
Base.FFTW.r2r

doc"""
    r2r!(A, kind[, dims])

Same as "r2r()", but operates in-place on "A", which must be an
array of real or complex floating-point numbers.

"""
Base.FFTW.r2r!

doc"""
    I

An object of type "UniformScaling", representing an identity
matrix of any size.

"""
Base.LinAlg.BLAS.I

doc"""
    asum(n, X, incx)

sum of the absolute values of the first "n" elements of array
"X" with stride "incx".

"""
Base.LinAlg.BLAS.asum

doc"""
    axpy!(a, X, Y)

Overwrite "Y" with "a*X + Y".  Returns "Y".

"""
Base.LinAlg.BLAS.axpy!

doc"""
    blas_set_num_threads(n)

Set the number of threads the BLAS library should use.

"""
Base.LinAlg.BLAS.blas_set_num_threads

doc"""
    blascopy!(n, X, incx, Y, incy)

Copy "n" elements of array "X" with stride "incx" to array
"Y" with stride "incy".  Returns "Y".

"""
Base.LinAlg.BLAS.blascopy!

doc"""
    dot(n, X, incx, Y, incy)

Dot product of two vectors consisting of "n" elements of array
"X" with stride "incx" and "n" elements of array "Y" with
stride "incy".

"""
Base.LinAlg.BLAS.dot

doc"""
    dotc(n, X, incx, U, incy)

Dot function for two complex vectors conjugating the first vector.

"""
Base.LinAlg.BLAS.dotc

doc"""
    dotu(n, X, incx, Y, incy)

Dot function for two complex vectors.

"""
Base.LinAlg.BLAS.dotu

doc"""
    gbmv(trans, m, kl, ku, alpha, A, x, beta, y)

Returns "alpha*A*x" or "alpha*A'*x" according to "trans" ('N'
or 'T'). The matrix "A" is a general band matrix of dimension
"m" by "size(A,2)" with "kl" sub-diagonals and "ku" super-
diagonals.

"""
Base.LinAlg.BLAS.gbmv

doc"""
    gbmv!(trans, m, kl, ku, alpha, A, x, beta, y)

Update vector "y" as "alpha*A*x + beta*y" or "alpha*A'*x +
beta*y" according to "trans" ('N' or 'T').  The matrix "A" is
a general band matrix of dimension "m" by "size(A,2)" with
"kl" sub-diagonals and "ku" super-diagonals. Returns the
updated "y".

"""
Base.LinAlg.BLAS.gbmv!

doc"""
    gemm(tA, tB, alpha, A, B)

Returns "alpha*A*B" or the other three variants according to
"tA" (transpose "A") and "tB".

    gemm(tA, tB, A, B)

Returns "A*B" or the other three variants according to "tA"
(transpose "A") and "tB".

"""
Base.LinAlg.BLAS.gemm

doc"""
    gemm!(tA, tB, alpha, A, B, beta, C)

Update "C" as "alpha*A*B + beta*C" or the other three variants
according to "tA" (transpose "A") and "tB".  Returns the
updated "C".

"""
Base.LinAlg.BLAS.gemm!

doc"""
    gemv(tA, alpha, A, x)

Returns "alpha*A*x" or "alpha*A'x" according to "tA"
(transpose "A").

    gemv(tA, A, x)

Returns "A*x" or "A'x" according to "tA" (transpose "A").

"""
Base.LinAlg.BLAS.gemv

doc"""
    gemv!(tA, alpha, A, x, beta, y)

Update the vector "y" as "alpha*A*x + beta*y" or "alpha*A'x +
beta*y" according to "tA" (transpose "A"). Returns the updated
"y".

"""
Base.LinAlg.BLAS.gemv!

doc"""
    ger!(alpha, x, y, A)

Rank-1 update of the matrix "A" with vectors "x" and "y" as
"alpha*x*y' + A".

"""
Base.LinAlg.BLAS.ger!

doc"""
    her!(uplo, alpha, x, A)

Methods for complex arrays only.  Rank-1 update of the Hermitian
matrix "A" with vector "x" as "alpha*x*x' + A".  When
"uplo" is 'U' the upper triangle of "A" is updated ('L' for
lower triangle). Returns "A".

"""
Base.LinAlg.BLAS.her!

doc"""
    herk(uplo, trans, alpha, A)

Methods for complex arrays only.  Returns either the upper triangle
or the lower triangle, according to "uplo" ('U' or 'L'), of
"alpha*A*A'" or "alpha*A'*A", according to "trans" ('N' or
'T').

"""
Base.LinAlg.BLAS.herk

doc"""
    herk!(uplo, trans, alpha, A, beta, C)

Methods for complex arrays only.  Rank-k update of the Hermitian
matrix "C" as "alpha*A*A' + beta*C" or "alpha*A'*A + beta*C"
according to whether "trans" is 'N' or 'T'.  When "uplo" is 'U'
the upper triangle of "C" is updated ('L' for lower triangle).
Returns "C".

"""
Base.LinAlg.BLAS.herk!

doc"""
    nrm2(n, X, incx)

2-norm of a vector consisting of "n" elements of array "X" with
stride "incx".

"""
Base.LinAlg.BLAS.nrm2

doc"""
    sbmv(uplo, k, alpha, A, x)

Returns "alpha*A*x" where "A" is a symmetric band matrix of
order "size(A,2)" with "k" super-diagonals stored in the
argument "A".

    sbmv(uplo, k, A, x)

Returns "A*x" where "A" is a symmetric band matrix of order
"size(A,2)" with "k" super-diagonals stored in the argument
"A".

"""
Base.LinAlg.BLAS.sbmv

doc"""
    sbmv!(uplo, k, alpha, A, x, beta, y)

Update vector "y" as "alpha*A*x + beta*y" where "A" is a a
symmetric band matrix of order "size(A,2)" with "k" super-
diagonals stored in the argument "A".  The storage layout for
"A" is described the reference BLAS module, level-2 BLAS at
http://www.netlib.org/lapack/explore-html/.

Returns the updated "y".

"""
Base.LinAlg.BLAS.sbmv!

doc"""
    scal(n, a, X, incx)

Returns "a*X".

"""
Base.LinAlg.BLAS.scal

doc"""
    scal!(n, a, X, incx)

Overwrite "X" with "a*X".  Returns "X".

"""
Base.LinAlg.BLAS.scal!

doc"""
    symm(side, ul, alpha, A, B)

Returns "alpha*A*B" or "alpha*B*A" according to "side". "A"
is assumed to be symmetric.  Only the "ul" triangle of "A" is
used.

    symm(side, ul, A, B)

Returns "A*B" or "B*A" according to "side".  "A" is assumed
to be symmetric.  Only the "ul" triangle of "A" is used.

    symm(tA, tB, alpha, A, B)

Returns "alpha*A*B" or the other three variants according to
"tA" (transpose "A") and "tB".

"""
Base.LinAlg.BLAS.symm

doc"""
    symm!(side, ul, alpha, A, B, beta, C)

Update "C" as "alpha*A*B + beta*C" or "alpha*B*A + beta*C"
according to "side". "A" is assumed to be symmetric.  Only the
"ul" triangle of "A" is used.  Returns the updated "C".

"""
Base.LinAlg.BLAS.symm!

doc"""
    symv(ul, alpha, A, x)

Returns "alpha*A*x". "A" is assumed to be symmetric.  Only the
"ul" triangle of "A" is used.

    symv(ul, A, x)

Returns "A*x".  "A" is assumed to be symmetric.  Only the
"ul" triangle of "A" is used.

"""
Base.LinAlg.BLAS.symv

doc"""
    symv!(ul, alpha, A, x, beta, y)

Update the vector "y" as "alpha*A*x + beta*y". "A" is assumed
to be symmetric.  Only the "ul" triangle of "A" is used.
Returns the updated "y".

"""
Base.LinAlg.BLAS.symv!

doc"""
    syr!(uplo, alpha, x, A)

Rank-1 update of the symmetric matrix "A" with vector "x" as
"alpha*x*x.' + A".  When "uplo" is 'U' the upper triangle of
"A" is updated ('L' for lower triangle). Returns "A".

"""
Base.LinAlg.BLAS.syr!

doc"""
    syrk(uplo, trans, alpha, A)

Returns either the upper triangle or the lower triangle, according
to "uplo" ('U' or 'L'), of "alpha*A*A.'" or "alpha*A.'*A",
according to "trans" ('N' or 'T').

"""
Base.LinAlg.BLAS.syrk

doc"""
    syrk!(uplo, trans, alpha, A, beta, C)

Rank-k update of the symmetric matrix "C" as "alpha*A*A.' +
beta*C" or "alpha*A.'*A + beta*C" according to whether "trans"
is 'N' or 'T'.  When "uplo" is 'U' the upper triangle of "C" is
updated ('L' for lower triangle).  Returns "C".

"""
Base.LinAlg.BLAS.syrk!

doc"""
    trmm(side, ul, tA, dA, alpha, A, B)

Returns "alpha*A*B" or one of the other three variants determined
by "side" (A on left or right) and "tA" (transpose A). Only the
"ul" triangle of "A" is used.  "dA" indicates if "A" is
unit-triangular (the diagonal is assumed to be all ones).

"""
Base.LinAlg.BLAS.trmm

doc"""
    trmm!(side, ul, tA, dA, alpha, A, B)

Update "B" as "alpha*A*B" or one of the other three variants
determined by "side" (A on left or right) and "tA" (transpose
A). Only the "ul" triangle of "A" is used.  "dA" indicates if
"A" is unit-triangular (the diagonal is assumed to be all ones).
Returns the updated "B".

"""
Base.LinAlg.BLAS.trmm!

doc"""
    trmv(side, ul, tA, dA, alpha, A, b)

Returns "alpha*A*b" or one of the other three variants determined
by "side" (A on left or right) and "tA" (transpose A). Only the
"ul" triangle of "A" is used.  "dA" indicates if "A" is
unit-triangular (the diagonal is assumed to be all ones).

"""
Base.LinAlg.BLAS.trmv

doc"""
    trmv!(side, ul, tA, dA, alpha, A, b)

Update "b" as "alpha*A*b" or one of the other three variants
determined by "side" (A on left or right) and "tA" (transpose
A). Only the "ul" triangle of "A" is used.  "dA" indicates if
"A" is unit-triangular (the diagonal is assumed to be all ones).
Returns the updated "b".

"""
Base.LinAlg.BLAS.trmv!

doc"""
    trsm(side, ul, tA, dA, alpha, A, B)

Returns the solution to "A*X = alpha*B" or one of the other three
variants determined by "side" (A on left or right of "X") and
"tA" (transpose A). Only the "ul" triangle of "A" is used.
"dA" indicates if "A" is unit-triangular (the diagonal is
assumed to be all ones).

"""
Base.LinAlg.BLAS.trsm

doc"""
    trsm!(side, ul, tA, dA, alpha, A, B)

Overwrite "B" with the solution to "A*X = alpha*B" or one of
the other three variants determined by "side" (A on left or right
of "X") and "tA" (transpose A). Only the "ul" triangle of
"A" is used.  "dA" indicates if "A" is unit-triangular (the
diagonal is assumed to be all ones).  Returns the updated "B".

"""
Base.LinAlg.BLAS.trsm!

doc"""
    trsv(ul, tA, dA, A, b)

Returns the solution to "A*x = b" or one of the other two
variants determined by "tA" (transpose A) and "ul" (triangle of
"A" is used.) "dA" indicates if "A" is unit-triangular (the
diagonal is assumed to be all ones).

"""
Base.LinAlg.BLAS.trsv

doc"""
    trsv!(ul, tA, dA, A, b)

Overwrite "b" with the solution to "A*x = b" or one of the
other two variants determined by "tA" (transpose A) and "ul"
(triangle of "A" used).  "dA" indicates if "A" is unit-
triangular (the diagonal is assumed to be all ones).  Returns the
updated "b".

"""
Base.LinAlg.BLAS.trsv!

doc"""
    callers(funcname[, data, lidict][, filename=<filename>][, linerange=<start:stop>]) -> Vector{Tuple{count, linfo}}

Given a previous profiling run, determine who called a particular
function. Supplying the filename (and optionally, range of line
numbers over which the function is defined) allows you to
disambiguate an overloaded method. The returned value is a vector
containing a count of the number of calls and line information
about the caller.  One can optionally supply backtrace data
obtained from "retrieve()"; otherwise, the current internal
profile buffer is used.

"""
Base.Profile.callers

doc"""
    clear()

Clear any existing backtraces from the internal buffer.

"""
Base.Profile.clear

doc"""
    clear_malloc_data()

Clears any stored memory allocation data when running julia with "
--track-allocation".  Execute the command(s) you want to test (to
force JIT-compilation), then call "clear_malloc_data()". Then
execute your command(s) again, quit Julia, and examine the
resulting "*.mem" files.

"""
Base.Profile.clear_malloc_data

doc"""
    fetch() -> data

Returns a reference to the internal buffer of backtraces. Note that
subsequent operations, like "clear()", can affect "data" unless
you first make a copy. Note that the values in "data" have
meaning only on this machine in the current session, because it
depends on the exact memory addresses used in JIT-compiling. This
function is primarily for internal use; "retrieve()" may be a
better choice for most users.

"""
Base.Profile.fetch

doc"""
    init(; n::Integer, delay::Float64)

Configure the "delay" between backtraces (measured in seconds),
and the number "n" of instruction pointers that may be stored.
Each instruction pointer corresponds to a single line of code;
backtraces generally consist of a long list of instruction
pointers. Default settings can be obtained by calling this function
with no arguments, and each can be set independently using keywords
or in the order "(n, delay)".

"""
Base.Profile.init

doc"""
    print([io::IO = STDOUT], [data::Vector]; format = :tree, C = false, combine = true, cols = tty_cols())

Prints profiling results to "io" (by default, "STDOUT"). If you
do not supply a "data" vector, the internal buffer of accumulated
backtraces will be used.  "format" can be ":tree" or ":flat".
If "C==true", backtraces from C and Fortran code are shown.
"combine==true" merges instruction pointers that correspond to
the same line of code.  "cols" controls the width of the display.

    print([io::IO = STDOUT], data::Vector, lidict::Dict; format = :tree, combine = true, cols = tty_cols())

Prints profiling results to "io". This variant is used to examine
results exported by a previous call to "retrieve()". Supply the
vector "data" of backtraces and a dictionary "lidict" of line
information.

"""
Base.Profile.print

doc"""
    retrieve() -> data, lidict

"Exports" profiling results in a portable format, returning the
set of all backtraces ("data") and a dictionary that maps the
(session-specific) instruction pointers in "data" to "LineInfo"
values that store the file name, function name, and line number.
This function allows you to save profiling results for future
analysis.

"""
Base.Profile.retrieve

doc"""
    @test(ex)

Test the expression "ex" and calls the current handler to handle
the result.

"""
Base.Test.@test

doc"""
    @test_approx_eq(a, b)

Test two floating point numbers "a" and "b" for equality taking
in account small numerical errors.

"""
Base.Test.@test_approx_eq

doc"""
    @test_approx_eq_eps(a, b, tol)

Test two floating point numbers "a" and "b" for equality taking
in account a margin of tolerance given by "tol".

"""
Base.Test.@test_approx_eq_eps

doc"""
    @test_throws(extype, ex)

Test that the expression "ex" throws an exception of type
"extype" and calls the current handler to handle the result.

"""
Base.Test.@test_throws

doc"""
    with_handler(f, handler)

Run the function "f" using the "handler" as the handler.

"""
Base.Test.with_handler

doc"""
    ccall((symbol, library) or function_pointer, ReturnType, (ArgumentType1, ...), ArgumentValue1, ...)

Call function in C-exported shared library, specified by
"(function name, library)" tuple, where each component is an
AbstractString or :Symbol.

Note that the argument type tuple must be a literal tuple, and not
a tuple-valued variable or expression. Alternatively, ccall may
also be used to call a function pointer, such as one returned by
dlsym.

Each "ArgumentValue" to the "ccall" will be converted to the
corresponding "ArgumentType", by automatic insertion of calls to
"unsafe_convert(ArgumentType, cconvert(ArgumentType,
ArgumentValue))". (see also the documentation for each of these
functions for further details). In most cases, this simply results
in a call to "convert(ArgumentType, ArgumentValue)"

"""
Base.ccall

doc"""
    in(item, collection) -> Bool
∈(item, collection) -> Bool
∋(collection, item) -> Bool
∉(item, collection) -> Bool
∌(collection, item) -> Bool

Determine whether an item is in the given collection, in the sense
that it is "==" to one of the values generated by iterating over
the collection. Some collections need a slightly different
definition; for example "Set"s check whether the item
"isequal()" to one of the elements. "Dict"s look for
"(key,value)" pairs, and the key is compared using "isequal()".
To test for the presence of a key in a dictionary, use "haskey()"
or "k in keys(dict)".

"""
Base.in

doc"""
    Base64DecodePipe(istream)

Returns a new read-only I/O stream, which decodes base64-encoded
data read from "istream".

"""
Base64DecodePipe

doc"""
    Base64EncodePipe(ostream)

Returns a new write-only I/O stream, which converts any bytes
written to it into base64-encoded ASCII bytes written to
"ostream".  Calling "close" on the "Base64Pipe" stream is
necessary to complete the encoding (but does not close
"ostream").

"""
Base64EncodePipe

doc"""
    Bidiagonal(dv, ev, isupper)

Constructs an upper ("isupper=true") or lower ("isupper=false")
bidiagonal matrix using the given diagonal ("dv") and off-
diagonal ("ev") vectors.  The result is of type "Bidiagonal"
and provides efficient specialized linear solvers, but may be
converted into a regular matrix with "full()".

"""
Bidiagonal

doc"""
    BigFloat(x)

Create an arbitrary precision floating point number. "x" may be
an "Integer", a "Float64" or a "BigInt". The usual
mathematical operators are defined for this type, and results are
promoted to a "BigFloat".

Note that because decimal literals are converted to floating point
numbers when parsed, "BigFloat(2.1)" may not yield what you
expect. You may instead prefer to initialize constants from strings
via "parse()", or using the "big" string literal.

    julia> big"2.1"
    2.099999999999999999999999999999999999999999999999999999999999999999999999999986e+00 with 256 bits of precision

"""
BigFloat

doc"""
    BigInt(x)

Create an arbitrary precision integer. "x" may be an "Int" (or
anything that can be converted to an "Int").  The usual
mathematical operators are defined for this type, and results are
promoted to a "BigInt".

Instances can be constructed from strings via "parse()", or using
the "big" string literal.

"""
BigInt

doc"""
    BoundsError([a][, i])

An indexing operation into an array, "a", tried to access an out-
of-bounds element, "i".

"""
BoundsError

doc"""
    C_NULL

The C null pointer constant, sometimes used when calling external
code.

"""
C_NULL

doc"""
    Cchar

Equivalent to the native "char" c-type

"""
Cchar

doc"""
    Cdouble

Equivalent to the native "double" c-type (Float64)

"""
Cdouble

doc"""
    Cfloat

Equivalent to the native "float" c-type (Float32)

"""
Cfloat

doc"""
    Cint

Equivalent to the native "signed int" c-type (Int32)

"""
Cint

doc"""
    Cintmax_t

Equivalent to the native "intmax_t" c-type (Int64)

"""
Cintmax_t

doc"""
    Clong

Equivalent to the native "signed long" c-type

"""
Clong

doc"""
    Clonglong

Equivalent to the native "signed long long" c-type (Int64)

"""
Clonglong

doc"""
    Coff_t

Equivalent to the native "off_t" c-type

"""
Coff_t

doc"""
    Condition()

Create an edge-triggered event source that tasks can wait for.
Tasks that call "wait" on a "Condition" are suspended and
queued. Tasks are woken up when "notify" is later called on the
"Condition". Edge triggering means that only tasks waiting at the
time "notify" is called can be woken up. For level-triggered
notifications, you must keep extra state to keep track of whether a
notification has happened. The "RemoteRef" type does this, and so
can be used for level-triggered events.

"""
Condition

doc"""
    Cptrdiff_t

Equivalent to the native "ptrdiff_t" c-type (Int)

"""
Cptrdiff_t

doc"""
    Cshort

Equivalent to the native "signed short" c-type (Int16)

"""
Cshort

doc"""
    Csize_t

Equivalent to the native "size_t" c-type (UInt)

"""
Csize_t

doc"""
    Cssize_t

Equivalent to the native "ssize_t" c-type

"""
Cssize_t

doc"""
    Cuchar

Equivalent to the native "unsigned char" c-type (UInt8)

"""
Cuchar

doc"""
    Cuint

Equivalent to the native "unsigned int" c-type (UInt32)

"""
Cuint

doc"""
    Cuintmax_t

Equivalent to the native "uintmax_t" c-type (UInt64)

"""
Cuintmax_t

doc"""
    Culong

Equivalent to the native "unsigned long" c-type

"""
Culong

doc"""
    Culonglong

Equivalent to the native "unsigned long long" c-type (UInt64)

"""
Culonglong

doc"""
    Cushort

Equivalent to the native "unsigned short" c-type (UInt16)

"""
Cushort

doc"""
    Cwchar_t

Equivalent to the native "wchar_t" c-type (Int32)

"""
Cwchar_t

doc"""
    Date

"Date" wraps a "UTInstant{Day}" and interprets it according to
the proleptic Gregorian calendar.

    Date(y[, m, d]) -> Date

Construct a "Date" type by parts. Arguments must be convertible
to "Int64".

    Date(period::Period...) -> Date

Constuct a Date type by "Period" type parts. Arguments may be in
any order. Date parts not provided will default to the value of
"Dates.default(period)".

    Date(f::Function, y[, m]; step=Day(1), negate=false, limit=10000) -> Date

Create a Date through the adjuster API. The starting point will be
constructed from the provided "y, m" arguments, and will be
adjusted until "f::Function" returns true. The step size in
adjusting can be provided manually through the "step" keyword. If
"negate=true", then the adjusting will stop when "f::Function"
returns false instead of true. "limit" provides a limit to the
max number of iterations the adjustment API will pursue before
throwing an error (given that "f::Function" is never satisfied).

    Date(dt::DateTime) -> Date

Converts a "DateTime" type to a "Date". The hour, minute,
second, and millisecond parts of the "DateTime" are truncated, so
only the year, month and day parts are used in construction.

    Date(dt::AbstractString, format::AbstractString; locale="english") -> Date

Construct a Date type by parsing a "dt" date string following the
pattern given in the "format" string. Follows the same
conventions as "DateTime" above.

    Date(dt::AbstractString, df::DateFormat) -> Date

Parse a date from a date string "dt" using a "DateFormat"
object "df".

"""
Dates.Date

doc"""
    DateTime

"DateTime" wraps a "UTInstant{Millisecond}" and interprets it
according to the proleptic Gregorian calendar.

    DateTime(y[, m, d, h, mi, s, ms]) -> DateTime

Construct a DateTime type by parts. Arguments must be convertible
to "Int64".

    DateTime(periods::Period...) -> DateTime

Constuct a DateTime type by "Period" type parts. Arguments may be
in any order. DateTime parts not provided will default to the value
of "Dates.default(period)".

    DateTime(f::Function, y[, m, d, h, mi, s]; step=Day(1), negate=false, limit=10000) -> DateTime

Create a DateTime through the adjuster API. The starting point will
be constructed from the provided "y, m, d..." arguments, and will
be adjusted until "f::Function" returns true. The step size in
adjusting can be provided manually through the "step" keyword. If
"negate=true", then the adjusting will stop when "f::Function"
returns false instead of true. "limit" provides a limit to the
max number of iterations the adjustment API will pursue before
throwing an error (in the case that "f::Function" is never
satisfied).

    DateTime(dt::Date) -> DateTime

Converts a "Date" type to a "DateTime". The hour, minute,
second, and millisecond parts of the new "DateTime" are assumed
to be zero.

    DateTime(dt::AbstractString, format::AbstractString; locale="english") -> DateTime

Construct a DateTime type by parsing the "dt" date string
following the pattern given in the "format" string. The following
codes can be used for constructing format strings:

    +-----------------+-----------+-----------------------------------------------------------------+
    | Code            | Matches   | Comment                                                         |
    +-----------------+-----------+-----------------------------------------------------------------+
    | \"y\"           | 1996, 96  | Returns year of 1996, 0096                                      |
    +-----------------+-----------+-----------------------------------------------------------------+
    | \"m\"           | 1, 01     | Matches 1 or 2-digit months                                     |
    +-----------------+-----------+-----------------------------------------------------------------+
    | \"u\"           | Jan       | Matches abbreviated months according to the \"locale\" keyword  |
    +-----------------+-----------+-----------------------------------------------------------------+
    | \"U\"           | January   | Matches full month names according to the \"locale\" keyword    |
    +-----------------+-----------+-----------------------------------------------------------------+
    | \"d\"           | 1, 01     | Matches 1 or 2-digit days                                       |
    +-----------------+-----------+-----------------------------------------------------------------+
    | \"H\"           | 00        | Matches hours                                                   |
    +-----------------+-----------+-----------------------------------------------------------------+
    | \"M\"           | 00        | Matches minutes                                                 |
    +-----------------+-----------+-----------------------------------------------------------------+
    | \"S\"           | 00        | Matches seconds                                                 |
    +-----------------+-----------+-----------------------------------------------------------------+
    | \"s\"           | .500      | Matches milliseconds                                            |
    +-----------------+-----------+-----------------------------------------------------------------+
    | \"e\"           | Mon, Tues | Matches abbreviated days of the week                            |
    +-----------------+-----------+-----------------------------------------------------------------+
    | \"E\"           | Monday    | Matches full name days of the week                              |
    +-----------------+-----------+-----------------------------------------------------------------+
    | \"yyyymmdd\"    | 19960101  | Matches fixed-width year, month, and day                        |
    +-----------------+-----------+-----------------------------------------------------------------+

All characters not listed above are treated as delimiters between
date and time slots. So a "dt" string of
"1996-01-15T00:00:00.0" would have a "format" string like
"y-m-dTH:M:S.s".

    DateTime(dt::AbstractString, df::DateFormat) -> DateTime

Similar form as above for parsing a "DateTime", but passes a
"DateFormat" object instead of a raw formatting string. It is
more efficient if similarly formatted date strings will be parsed
repeatedly to first create a "DateFormat" object then use this
method for parsing.

"""
Dates.DateTime

doc"""
    Dates.DateFormat(format::AbstractString) -> DateFormat

Construct a date formatting object that can be passed repeatedly
for parsing similarly formatted date strings. "format" is a
format string in the form described above (e.g. ""yyyy-mm-
dd"").

"""
Dates.Dates

doc"""
    Day

"""
Dates.Day

doc"""
    Hour

"""
Dates.Hour

doc"""
    Instant

"Instant" types represent integer-based, machine representations
of time as continuous timelines starting from an epoch.

"""
Dates.Instant

doc"""
    Millisecond

"Period" types represent discrete, human representations of time.

"""
Dates.Millisecond

doc"""
    Minute

"""
Dates.Minute

doc"""
    Month

"""
Dates.Month

doc"""
    Period

"""
Dates.Period

doc"""
    Second

"""
Dates.Second

doc"""
    TimeType

"TimeType" types wrap "Instant" machine instances to provide
human representations of the machine instant.

"""
Dates.TimeType

doc"""
    Week

"""
Dates.Week

doc"""
    Year

    Year(dt::TimeType) -> Year
Month(dt::TimeType) -> Month
Week(dt::TimeType) -> Week
Day(dt::TimeType) -> Day
Hour(dt::TimeType) -> Hour
Minute(dt::TimeType) -> Minute
Second(dt::TimeType) -> Second
Millisecond(dt::TimeType) -> Millisecond

Return the field part of a Date or DateTime as a "Period" type.

    Year(v)
Month(v)
Week(v)
Day(v)
Hour(v)
Minute(v)
Second(v)
Millisecond(v)

Construct a "Period" type with the given "v" value. Input must
be losslessly convertible to an "Int64".

"""
Dates.Year

doc"""
    datetime2julian(dt::DateTime) -> Float64

Takes the given DateTime and returns the number of Julian calendar
days since the julian epoch as a "Float64".

"""
Dates.datetime2julian

doc"""
    datetime2rata(dt::TimeType) -> Int64

Returns the number of Rata Die days since epoch from the given Date
or DateTime.

"""
Dates.datetime2rata

doc"""
    datetime2unix(dt::DateTime) -> Float64

Takes the given DateTime and returns the number of seconds since
the unix epoch as a "Float64".

"""
Dates.datetime2unix

doc"""
    dayabbr(dt::TimeType; locale="english") -> AbstractString

Return the abbreviated name corresponding to the day of the week of
the Date or DateTime in the given "locale".

"""
Dates.dayabbr

doc"""
    dayname(dt::TimeType; locale="english") -> AbstractString

Return the full day name corresponding to the day of the week of
the Date or DateTime in the given "locale".

"""
Dates.dayname

doc"""
    dayofquarter(dt::TimeType) -> Int

Returns the day of the current quarter of "dt". Range of value is
1:92.

"""
Dates.dayofquarter

doc"""
    dayofweek(dt::TimeType) -> Int64

Returns the day of the week as an "Int64" with "1 = Monday, 2 =
Tuesday, etc.".

"""
Dates.dayofweek

doc"""
    dayofweekofmonth(dt::TimeType) -> Int

For the day of week of "dt", returns which number it is in
"dt"'s month. So if the day of the week of "dt" is Monday, then
"1 = First Monday of the month, 2 = Second Monday of the month,
etc." In the range 1:5.

"""
Dates.dayofweekofmonth

doc"""
    dayofyear(dt::TimeType) -> Int

Returns the day of the year for "dt" with January 1st being day
1.

"""
Dates.dayofyear

doc"""
    daysinmonth(dt::TimeType) -> Int

Returns the number of days in the month of "dt". Value will be
28, 29, 30, or 31.

"""
Dates.daysinmonth

doc"""
    daysinyear(dt::TimeType) -> Int

Returns 366 if the year of "dt" is a leap year, otherwise returns
365.

"""
Dates.daysinyear

doc"""
    daysofweekinmonth(dt::TimeType) -> Int

For the day of week of "dt", returns the total number of that day
of the week in "dt"'s month. Returns 4 or 5. Useful in temporal
expressions for specifying the last day of a week in a month by
including "dayofweekofmonth(dt) == daysofweekinmonth(dt)" in the
adjuster function.

"""
Dates.daysofweekinmonth

doc"""
    default(p::Period) -> Period

Returns a sensible "default" value for the input Period by
returning "one(p)" for Year, Month, and Day, and "zero(p)" for
Hour, Minute, Second, and Millisecond.

"""
Dates.default

doc"""
    eps(::DateTime) -> Millisecond
eps(::Date) -> Day

Returns "Millisecond(1)" for "DateTime" values and "Day(1)"
for "Date" values.

"""
Dates.eps

doc"""
    firstdayofmonth(dt::TimeType) -> TimeType

Adjusts "dt" to the first day of its month.

"""
Dates.firstdayofmonth

doc"""
    firstdayofquarter(dt::TimeType) -> TimeType

Adjusts "dt" to the first day of its quarter.

"""
Dates.firstdayofquarter

doc"""
    firstdayofweek(dt::TimeType) -> TimeType

Adjusts "dt" to the Monday of its week.

"""
Dates.firstdayofweek

doc"""
    firstdayofyear(dt::TimeType) -> TimeType

Adjusts "dt" to the first day of its year.

"""
Dates.firstdayofyear

doc"""
    isleapyear(dt::TimeType) -> Bool

Returns true if the year of "dt" is a leap year.

"""
Dates.isleapyear

doc"""
    julian2datetime(julian_days) -> DateTime

Takes the number of Julian calendar days since epoch
"-4713-11-24T12:00:00" and returns the corresponding DateTime.

"""
Dates.julian2datetime

doc"""
    lastdayofmonth(dt::TimeType) -> TimeType

Adjusts "dt" to the last day of its month.

"""
Dates.lastdayofmonth

doc"""
    lastdayofquarter(dt::TimeType) -> TimeType

Adjusts "dt" to the last day of its quarter.

"""
Dates.lastdayofquarter

doc"""
    lastdayofweek(dt::TimeType) -> TimeType

Adjusts "dt" to the Sunday of its week.

"""
Dates.lastdayofweek

doc"""
    lastdayofyear(dt::TimeType) -> TimeType

Adjusts "dt" to the last day of its year.

"""
Dates.lastdayofyear

doc"""
    monthabbr(dt::TimeType; locale="english") -> AbstractString

Return the abbreviated month name of the Date or DateTime in the
given "locale".

"""
Dates.monthabbr

doc"""
    monthday(dt::TimeType) -> (Int64, Int64)

Simultaneously return the month and day parts of a Date or
DateTime.

"""
Dates.monthday

doc"""
    monthname(dt::TimeType; locale="english") -> AbstractString

Return the full name of the month of the Date or DateTime in the
given "locale".

"""
Dates.monthname

doc"""
    now() -> DateTime

Returns a DateTime corresponding to the user's system time
including the system timezone locale.

    now(::Type{UTC}) -> DateTime

Returns a DateTime corresponding to the user's system time as
UTC/GMT.

"""
Dates.now

doc"""
    quarterofyear(dt::TimeType) -> Int

Returns the quarter that "dt" resides in. Range of value is 1:4.

"""
Dates.quarterofyear

doc"""
    rata2datetime(days) -> DateTime

Takes the number of Rata Die days since epoch
"0000-12-31T00:00:00" and returns the corresponding DateTime.

"""
Dates.rata2datetime

doc"""
    today() -> Date

Returns the date portion of "now()".

"""
Dates.today

doc"""
    tofirst(dt::TimeType, dow::Int;of=Month) -> TimeType

Adjusts "dt" to the first "dow" of its month. Alternatively,
"of=Year" will adjust to the first "dow" of the year.

"""
Dates.tofirst

doc"""
    tolast(dt::TimeType, dow::Int;of=Month) -> TimeType

Adjusts "dt" to the last "dow" of its month. Alternatively,
"of=Year" will adjust to the last "dow" of the year.

"""
Dates.tolast

doc"""
    tonext(dt::TimeType, dow::Int;same::Bool=false) -> TimeType

Adjusts "dt" to the next day of week corresponding to "dow"
with "1 = Monday, 2 = Tuesday, etc". Setting "same=true" allows
the current "dt" to be considered as the next "dow", allowing
for no adjustment to occur.

    tonext(func::Function, dt::TimeType;step=Day(1), negate=false, limit=10000, same=false) -> TimeType

Adjusts "dt" by iterating at most "limit" iterations by
"step" increments until "func" returns true. "func" must take
a single "TimeType" argument and return a "Bool". "same"
allows "dt" to be considered in satisfying "func". "negate"
will make the adjustment process terminate when "func" returns
false instead of true.

"""
Dates.tonext

doc"""
    toprev(dt::TimeType, dow::Int;same::Bool=false) -> TimeType

Adjusts "dt" to the previous day of week corresponding to "dow"
with "1 = Monday, 2 = Tuesday, etc". Setting "same=true" allows
the current "dt" to be considered as the previous "dow",
allowing for no adjustment to occur.

    toprev(func::Function, dt::TimeType;step=Day(-1), negate=false, limit=10000, same=false) -> TimeType

Adjusts "dt" by iterating at most "limit" iterations by
"step" increments until "func" returns true. "func" must take
a single "TimeType" argument and return a "Bool". "same"
allows "dt" to be considered in satisfying "func". "negate"
will make the adjustment process terminate when "func" returns
false instead of true.

"""
Dates.toprev

doc"""
    trunc(dt::TimeType, ::Type{Period}) -> TimeType

Truncates the value of "dt" according to the provided "Period"
type. E.g. if "dt" is "1996-01-01T12:30:00", then
"trunc(dt,Day) == 1996-01-01T00:00:00".

"""
Dates.trunc

doc"""
    unix2datetime(x) -> DateTime

Takes the number of seconds since unix epoch
"1970-01-01T00:00:00" and converts to the corresponding DateTime.

"""
Dates.unix2datetime

doc"""
    year(dt::TimeType) -> Int64
month(dt::TimeType) -> Int64
week(dt::TimeType) -> Int64
day(dt::TimeType) -> Int64
hour(dt::TimeType) -> Int64
minute(dt::TimeType) -> Int64
second(dt::TimeType) -> Int64
millisecond(dt::TimeType) -> Int64

Return the field part of a Date or DateTime as an "Int64".

"""
Dates.year

doc"""
    yearmonth(dt::TimeType) -> (Int64, Int64)

Simultaneously return the year and month parts of a Date or
DateTime.

"""
Dates.yearmonth

doc"""
    yearmonthday(dt::TimeType) -> (Int64, Int64, Int64)

Simultaneously return the year, month, and day parts of a Date or
DateTime.

"""
Dates.yearmonthday

doc"""
    DevNull

Used in a stream redirect to discard all data written to it.
Essentially equivalent to /dev/null on Unix or NUL on Windows.
Usage: "run(`cat test.txt` |> DevNull)"

"""
DevNull

doc"""
    Dict([itr])

"Dict{K,V}()" constructs a hash table with keys of type "K" and
values of type "V".

Given a single iterable argument, constructs a "Dict" whose key-
value pairs are taken from 2-tuples "(key,value)" generated by
the argument.

    julia> Dict([("A", 1), ("B", 2)])
    Dict{ASCIIString,Int64} with 2 entries:
      "B" => 2
      "A" => 1

Alternatively, a sequence of pair arguments may be passed.

    julia> Dict("A"=>1, "B"=>2)
    Dict{ASCIIString,Int64} with 2 entries:
      "B" => 2
      "A" => 1

"""
Dict

doc"""
    DimensionMismatch([msg])

The objects called do not have matching dimensionality.

"""
DimensionMismatch

doc"""
    DivideError()

Integer division was attempted with a denominator value of 0.

"""
DivideError

doc"""
    DomainError()

The arguments to a function or constructor are outside the valid
domain.

"""
DomainError

doc"""
    ENDIAN_BOM

The 32-bit byte-order-mark indicates the native byte order of the
host machine. Little-endian machines will contain the value
0x04030201. Big-endian machines will contain the value 0x01020304.

"""
ENDIAN_BOM

doc"""
    ENV

Reference to the singleton "EnvHash", providing a dictionary
interface to system environment variables.

"""
ENV

doc"""
    EOFError()

No more data was available to read from a file or stream.

"""
EOFError

doc"""
    EnvHash() -> EnvHash

A singleton of this type provides a hash table interface to
environment variables.

"""
EnvHash

doc"""
    ErrorException(msg)

Generic error type. The error message, in the *.msg* field, may
provide more specific details.

"""
ErrorException

doc"""
    Float32(x[, mode::RoundingMode])

Create a Float32 from "x". If "x" is not exactly representable
then "mode" determines how "x" is rounded.

    julia> Float32(1/3, RoundDown)
    0.3333333f0

    julia> Float32(1/3, RoundUp)
    0.33333334f0

See "get_rounding" for available rounding modes.

"""
Float32

doc"""
    Float64(x[, mode::RoundingMode])

Create a Float64 from "x". If "x" is not exactly representable
then "mode" determines how "x" is rounded.

    julia> Float64(pi, RoundDown)
    3.141592653589793

    julia> Float64(pi, RoundUp)
    3.1415926535897936

See "get_rounding" for available rounding modes.

"""
Float64

doc"""
    IOBuffer() -> IOBuffer

Create an in-memory I/O stream.

    IOBuffer(size::Int)

Create a fixed size IOBuffer. The buffer will not grow dynamically.

    IOBuffer(string)

Create a read-only IOBuffer on the data underlying the given string

    IOBuffer([data][, readable, writable[, maxsize]])

Create an IOBuffer, which may optionally operate on a pre-existing
array. If the readable/writable arguments are given, they restrict
whether or not the buffer may be read from or written to
respectively. By default the buffer is readable but not writable.
The last argument optionally specifies a size beyond which the
buffer may not be grown.

"""
IOBuffer

doc"""
    IPv4(host::Integer) -> IPv4

Returns IPv4 object from ip address formatted as Integer

"""
IPv4

doc"""
    IPv6(host::Integer) -> IPv6

Returns IPv6 object from ip address formatted as Integer

"""
IPv6

doc"""
    InexactError()

Type conversion cannot be done exactly.

"""
InexactError

doc"""
    Inf

Positive infinity of type Float64

"""
Inf

doc"""
    Inf16

Positive infinity of type Float16

"""
Inf16

doc"""
    Inf32

Positive infinity of type Float32

"""
Inf32

doc"""
    IntSet([itr])

Construct a sorted set of the integers generated by the given
iterable object, or an empty set. Implemented as a bit string, and
therefore designed for dense integer sets. Only non-negative
integers can be stored. If the set will be sparse (for example
holding a single very large integer), use "Set" instead.

"""
IntSet

doc"""
    InterruptException()

The process was stopped by a terminal interrupt (CTRL+C).

"""
InterruptException

doc"""
    KeyError(key)

An indexing operation into an "Associative" ("Dict") or "Set"
like object tried to access or delete a non-existent element.

"""
KeyError

doc"""
    LOAD_PATH

An array of paths (as strings) where the "require" function looks
for code.

"""
LOAD_PATH

doc"""
    MS_ASYNC

Enum constant for "msync()". See your platform man page for
details. (not meaningful on Windows).

"""
Libc.MS_ASYNC

doc"""
    MS_INVALIDATE

Enum constant for "msync()". See your platform man page for
details. (not meaningful on Windows).

"""
Libc.MS_INVALIDATE

doc"""
    MS_SYNC

Enum constant for "msync()". See your platform man page for
details. (not meaningful on Windows).

"""
Libc.MS_SYNC

doc"""
    TmStruct([seconds])

Convert a number of seconds since the epoch to broken-down format,
with fields "sec", "min", "hour", "mday", "month",
"year", "wday", "yday", and "isdst".

"""
Libc.TmStruct

doc"""
    calloc(num::Integer, size::Integer) -> Ptr{Void}

Call "calloc" from the C standard library.

"""
Libc.calloc

doc"""
    errno([code])

Get the value of the C library's "errno". If an argument is
specified, it is used to set the value of "errno".

The value of "errno" is only valid immediately after a "ccall"
to a C library routine that sets it. Specifically, you cannot call
"errno" at the next prompt in a REPL, because lots of code is
executed between prompts.

"""
Libc.errno

doc"""
    flush_cstdio()

Flushes the C "stdout" and "stderr" streams (which may have
been written to by external C code).

"""
Libc.flush_cstdio

doc"""
    free(addr::Ptr)

Call "free" from the C standard library. Only use this on memory
obtained from "malloc", not on pointers retrieved from other C
libraries. "Ptr" objects obtained from C libraries should be
freed by the free functions defined in that library, to avoid
assertion failures if multiple "libc" libraries exist on the
system.

"""
Libc.free

doc"""
    malloc(size::Integer) -> Ptr{Void}

Call "malloc" from the C standard library.

"""
Libc.malloc

doc"""
    mmap(len, prot, flags, fd, offset)

Low-level interface to the "mmap" system call. See the man page.

"""
Libc.mmap

doc"""
    msync(ptr, len[, flags])

Forces synchronization of the "mmap()"ped memory region from
"ptr" to "ptr+len". Flags defaults to "MS_SYNC", but can be a
combination of "MS_ASYNC", "MS_SYNC", or "MS_INVALIDATE". See
your platform man page for specifics. The flags argument is not
valid on Windows.

You may not need to call "msync", because synchronization is
performed at intervals automatically by the operating system.
However, you can call this directly if, for example, you are
concerned about losing the result of a long-running calculation.

"""
Libc.msync

doc"""
    munmap(pointer, len)

Low-level interface for unmapping memory (see the man page). With
"mmap_array()" you do not need to call this directly; the memory
is unmapped for you when the array goes out of scope.

"""
Libc.munmap

doc"""
    realloc(addr::Ptr, size::Integer) -> Ptr{Void}

Call "realloc" from the C standard library.

See warning in the documentation for "free" regarding only using
this on memory originally obtained from "malloc".

"""
Libc.realloc

doc"""
    strerror(n)

Convert a system call error code to a descriptive string

"""
Libc.strerror

doc"""
    strftime([format], time)

Convert time, given as a number of seconds since the epoch or a
"TmStruct", to a formatted string using the given format.
Supported formats are the same as those in the standard C library.

"""
Libc.strftime

doc"""
    strptime([format], timestr)

Parse a formatted time string into a "TmStruct" giving the
seconds, minute, hour, date, etc. Supported formats are the same as
those in the standard C library. On some platforms, timezones will
not be parsed correctly. If the result of this function will be
passed to "time" to convert it to seconds since the epoch, the
"isdst" field should be filled in manually. Setting it to "-1"
will tell the C library to use the current system settings to
determine the timezone.

"""
Libc.strptime

doc"""
    time(t::TmStruct)

Converts a "TmStruct" struct to a number of seconds since the
epoch.

"""
Libc.time

doc"""
    DL_LOAD_PATH

When calling "dlopen", the paths in this list will be searched
first, in order, before searching the system locations for a valid
library handle.

"""
Libdl.DL_LOAD_PATH

doc"""
    RTLD_DEEPBIND

Enum constant for "dlopen()". See your platform man page for
details, if applicable.

"""
Libdl.RTLD_DEEPBIND

doc"""
    RTLD_FIRST

Enum constant for "dlopen()". See your platform man page for
details, if applicable.

"""
Libdl.RTLD_FIRST

doc"""
    RTLD_GLOBAL

Enum constant for "dlopen()". See your platform man page for
details, if applicable.

"""
Libdl.RTLD_GLOBAL

doc"""
    RTLD_LAZY

Enum constant for "dlopen()". See your platform man page for
details, if applicable.

"""
Libdl.RTLD_LAZY

doc"""
    RTLD_LOCAL

Enum constant for "dlopen()". See your platform man page for
details, if applicable.

"""
Libdl.RTLD_LOCAL

doc"""
    RTLD_NODELETE

Enum constant for "dlopen()". See your platform man page for
details, if applicable.

"""
Libdl.RTLD_NODELETE

doc"""
    RTLD_NOLOAD

Enum constant for "dlopen()". See your platform man page for
details, if applicable.

"""
Libdl.RTLD_NOLOAD

doc"""
    RTLD_NOW

Enum constant for "dlopen()". See your platform man page for
details, if applicable.

"""
Libdl.RTLD_NOW

doc"""
    dlclose(handle)

Close shared library referenced by handle.

"""
Libdl.dlclose

doc"""
    dlopen(libfile::AbstractString[, flags::Integer])

Load a shared library, returning an opaque handle.

The optional flags argument is a bitwise-or of zero or more of
"RTLD_LOCAL", "RTLD_GLOBAL", "RTLD_LAZY", "RTLD_NOW",
"RTLD_NODELETE", "RTLD_NOLOAD", "RTLD_DEEPBIND", and
"RTLD_FIRST".  These are converted to the corresponding flags of
the POSIX (and/or GNU libc and/or MacOS) dlopen command, if
possible, or are ignored if the specified functionality is not
available on the current platform.  The default is
"RTLD_LAZY|RTLD_DEEPBIND|RTLD_LOCAL".  An important usage of
these flags, on POSIX platforms, is to specify
"RTLD_LAZY|RTLD_DEEPBIND|RTLD_GLOBAL" in order for the library's
symbols to be available for usage in other shared libraries, in
situations where there are dependencies between shared libraries.

"""
Libdl.dlopen

doc"""
    dlopen_e(libfile::AbstractString[, flags::Integer])

Similar to "dlopen()", except returns a "NULL" pointer instead
of raising errors.

"""
Libdl.dlopen_e

doc"""
    dlsym(handle, sym)

Look up a symbol from a shared library handle, return callable
function pointer on success.

"""
Libdl.dlsym

doc"""
    dlsym_e(handle, sym)

Look up a symbol from a shared library handle, silently return NULL
pointer on lookup failure.

"""
Libdl.dlsym_e

doc"""
    find_library(names, locations)

Searches for the first library in "names" in the paths in the
"locations" list, "DL_LOAD_PATH", or system library paths (in
that order) which can successfully be dlopen'd. On success, the
return value will be one of the names (potentially prefixed by one
of the paths in locations). This string can be assigned to a
"global const" and used as the library name in future
"ccall"'s. On failure, it returns the empty string.

"""
Libdl.find_library

doc"""
    LoadError(file::AbstractString, line::Int, error)

An error occurred while *including*, *requiring*, or *using* a
file. The error specifics should be available in the *.error*
field.

"""
LoadError

doc"""
    MersenneTwister([seed])

Create a "MersenneTwister" RNG object. Different RNG objects can
have their own seeds, which may be useful for generating different
streams of random numbers.

"""
MersenneTwister

doc"""
    MethodError(f, args)

A method with the required type signature does not exist in the
given generic function.

"""
MethodError

doc"""
    NaN

A not-a-number value of type Float64

"""
NaN

doc"""
    NaN16

A not-a-number value of type Float16

"""
NaN16

doc"""
    NaN32

A not-a-number value of type Float32

"""
NaN32

doc"""
    NullException()

An attempted access to a "Nullable" with no defined value.

"""
NullException

doc"""
    Nullable(x)

Wrap value "x" in an object of type "Nullable", which indicates
whether a value is present. "Nullable(x)" yields a non-empty
wrapper, and "Nullable{T}()" yields an empty instance of a
wrapper that might contain a value of type "T".

"""
Nullable

doc"""
    OS_NAME

A symbol representing the name of the operating system. Possible
values are ":Linux", ":Darwin" (OS X), or ":Windows".

"""
OS_NAME

doc"""
    OutOfMemoryError()

An operation allocated too much memory for either the system or the
garbage collector to handle properly.

"""
OutOfMemoryError

doc"""
    OverflowError()

The result of an expression is too large for the specified type and
will cause a wraparound.

"""
OverflowError

doc"""
    ParseError(msg)

The expression passed to the *parse* function could not be
interpreted as a valid Julia expression.

"""
ParseError

doc"""
    PipeBuffer()

An IOBuffer that allows reading and performs writes by appending.
Seeking and truncating are not supported. See IOBuffer for the
available constructors.

    PipeBuffer(data::Vector{UInt8}[, maxsize])

Create a PipeBuffer to operate on a data vector, optionally
specifying a size beyond which the underlying Array may not be
grown.

"""
PipeBuffer

doc"""
    ProcessExitedException()

After a client Julia process has exited, further attempts to
reference the dead child will throw this exception.

"""
ProcessExitedException

doc"""
    RandomDevice()

Create a "RandomDevice" RNG object. Two such objects will always
generate different streams of random numbers.

"""
RandomDevice

doc"""
    ReadOnlyMemoryError()

An operation tried to write to memory that is read-only.

"""
ReadOnlyMemoryError

doc"""
    ReentrantLock()

Creates a reentrant lock. The same task can acquire the lock as
many times as required. Each lock must be matched with an unlock.

"""
ReentrantLock

doc"""
    RemoteRef()

Make an uninitialized remote reference on the local machine.

    RemoteRef(n)

Make an uninitialized remote reference on process "n".

"""
RemoteRef

doc"""
    RoundDown

"round()" using this rounding mode is an alias for "floor()".

"""
RoundDown

doc"""
    RoundNearest

The default rounding mode. Rounds to the nearest integer, with ties
(fractional values of 0.5) being rounded to the nearest even
integer.

"""
RoundNearest

doc"""
    RoundNearestTiesAway

Rounds to nearest integer, with ties rounded away from zero (C/C++
"round()" behaviour).

"""
RoundNearestTiesAway

doc"""
    RoundNearestTiesUp

Rounds to nearest integer, with ties rounded toward positive
infinity (Java/JavaScript "round()" behaviour).

"""
RoundNearestTiesUp

doc"""
    RoundToZero

"round()" using this rounding mode is an alias for "trunc()".

"""
RoundToZero

doc"""
    RoundUp

"round()" using this rounding mode is an alias for "ceil()".

"""
RoundUp

doc"""
    RoundingMode

A type which controls rounding behavior. Currently supported
rounding modes are:

* "RoundNearest" (default)

* "RoundNearestTiesAway"

* "RoundNearestTiesUp"

* "RoundToZero"

* "RoundUp"

* "RoundDown"

"""
RoundingMode

doc"""
    Set([itr])

Construct a "Set" of the values generated by the given iterable
object, or an empty set. Should be used instead of "IntSet" for
sparse integer sets, or for sets of arbitrary objects.

"""
Set

doc"""
    SharedArray(T::Type, dims::NTuple; init=false, pids=Int[])

Construct a SharedArray of a bitstype "T"  and size "dims"
across the processes specified by "pids" - all of which have to
be on the same host.

If "pids" is left unspecified, the shared array will be mapped
across all processes on the current host, including the master.
But, "localindexes" and "indexpids" will only refer to worker
processes. This facilitates work distribution code to use workers
for actual computation with the master process acting as a driver.

If an "init" function of the type "initfn(S::SharedArray)" is
specified, it is called on all the participating workers.

"""
SharedArray

doc"""
    StackOverflowError()

The function call grew beyond the size of the call stack. This
usually happens when a call recurses infinitely.

"""
StackOverflowError

doc"""
    SymTridiagonal(d, du)

Construct a real symmetric tridiagonal matrix from the diagonal and
upper diagonal, respectively. The result is of type
"SymTridiagonal" and provides efficient specialized eigensolvers,
but may be converted into a regular matrix with "full()".

"""
SymTridiagonal

doc"""
    Sys.set_process_title(title::AbstractString)

Set the process title. No-op on some operating systems. (not
exported)

    Sys.get_process_title()

Get the process title. On some systems, will always return empty
string. (not exported)

"""
Sys

doc"""
    SystemError(prefix::AbstractString[, errnum::Int32])

A system call failed with an error code (in the "errno" global
variable).

"""
SystemError

doc"""
    Task(func)

Create a "Task" (i.e. thread, or coroutine) to execute the given
function (which must be callable with no arguments). The task exits
when this function returns.

"""
Task

doc"""
    TextDisplay(stream)

Returns a "TextDisplay <: Display", which can display any object
as the text/plain MIME type (only), writing the text representation
to the given I/O stream.  (The text representation is the same as
the way an object is printed in the Julia REPL.)

"""
TextDisplay

doc"""
    Timer(callback::Function, delay, repeat=0)

Create a timer to call the given callback function. The callback is
passed one argument, the timer object itself. The callback will be
invoked after the specified initial delay, and then repeating with
the given "repeat" interval. If "repeat" is "0", the timer is
only triggered once. Times are in seconds. A timer is stopped and
has its resources freed by calling "close" on it.

    Timer(delay, repeat=0)

Create a timer that wakes up tasks waiting for it (by calling
"wait" on the timer object) at a specified interval.

"""
Timer

doc"""
    Tridiagonal(dl, d, du)

Construct a tridiagonal matrix from the lower diagonal, diagonal,
and upper diagonal, respectively.  The result is of type
"Tridiagonal" and provides efficient specialized linear solvers,
but may be converted into a regular matrix with "full()".

"""
Tridiagonal

doc"""
    TypeError(func::Symbol, context::AbstractString, expected::Type, got)

A type assertion failure, or calling an intrinsic function with an
incorrect argument type.

"""
TypeError

doc"""
    UndefRefError()

The item or field is not defined for the given object.

"""
UndefRefError

doc"""
    UndefVarError(var::Symbol)

A symbol in the current scope is not defined.

"""
UndefVarError

doc"""
    VERSION

An object describing which version of Julia is in use.

"""
VERSION

doc"""
    WORD_SIZE

Standard word size on the current machine, in bits.

"""
WORD_SIZE

doc"""
    abs(x)

Absolute value of "x"

"""
abs

doc"""
    abs2(x)

Squared absolute value of "x"

"""
abs2

doc"""
    abspath(path::AbstractString) -> AbstractString

Convert a path to an absolute path by adding the current directory
if necessary.

"""
abspath

doc"""
    accept(server[, client])

Accepts a connection on the given server and returns a connection
to the client. An uninitialized client stream may be provided, in
which case it will be used instead of creating a new stream.

"""
accept

doc"""
    acos(x)

Compute the inverse cosine of "x", where the output is in radians

"""
acos

doc"""
    acosd(x)

Compute the inverse cosine of "x", where the output is in degrees

"""
acosd

doc"""
    acosh(x)

Compute the inverse hyperbolic cosine of "x"

"""
acosh

doc"""
    acot(x)

Compute the inverse cotangent of "x", where the output is in
radians

"""
acot

doc"""
    acotd(x)

Compute the inverse cotangent of "x", where the output is in
degrees

"""
acotd

doc"""
    acoth(x)

Compute the inverse hyperbolic cotangent of "x"

"""
acoth

doc"""
    acsc(x)

Compute the inverse cosecant of "x", where the output is in
radians

"""
acsc

doc"""
    acscd(x)

Compute the inverse cosecant of "x", where the output is in
degrees

"""
acscd

doc"""
    acsch(x)

Compute the inverse hyperbolic cosecant of "x"

"""
acsch

doc"""
    addprocs(n::Integer; exeflags=``) -> List of process identifiers

Launches workers using the in-built "LocalManager" which only
launches workers on the local host. This can be used to take
advantage of multiple cores. "addprocs(4)" will add 4 processes
on the local machine.

    addprocs() -> List of process identifiers

Equivalent to "addprocs(CPU_CORES)"

    addprocs(machines; tunnel=false, sshflags=``, max_parallel=10, exeflags=``) -> List of process identifiers

Add processes on remote machines via SSH. Requires julia to be
installed in the same location on each node, or to be available via
a shared file system.

"machines" is a vector of machine specifications.  Worker are
started for each specification.

A machine specification is either a string "machine_spec" or a
tuple - "(machine_spec, count)"

"machine_spec" is a string of the form "[user@]host[:port]
[bind_addr[:port]]". "user" defaults to current user, "port"
to the standard ssh port. If "[bind_addr[:port]]" is specified,
other workers will connect to this worker at the specified
"bind_addr" and "port".

"count" is the number of workers to be launched on the specified
host. If specified as ":auto" it will launch as many workers as
the number of cores on the specific host.

Keyword arguments:

"tunnel" : if "true" then SSH tunneling will be used to connect
to the worker from the master process.

"sshflags" : specifies additional ssh options, e.g.
"sshflags=`-i /home/foo/bar.pem`" .

"max_parallel" : specifies the maximum number of workers
connected to in parallel at a host. Defaults to 10.

"dir" :  specifies the working directory on the workers. Defaults
to the host's current directory (as found by *pwd()*)

"exename" :  name of the julia executable. Defaults to
"\$JULIA_HOME/julia" or "\$JULIA_HOME/julia-debug" as the case
may be.

"exeflags" :  additional flags passed to the worker processes.

Environment variables :

If the master process fails to establish a connection with a newly
launched worker within 60.0 seconds, the worker treats it a fatal
situation and terminates. This timeout can be controlled via
environment variable "JULIA_WORKER_TIMEOUT". The value of
"JULIA_WORKER_TIMEOUT" on the master process, specifies the
number of seconds a newly launched worker waits for connection
establishment.

    addprocs(manager::ClusterManager; kwargs...) -> List of process identifiers

Launches worker processes via the specified cluster manager.

For example Beowulf clusters are  supported via a custom cluster
manager implemented in  package "ClusterManagers".

The number of seconds a newly launched worker waits for connection
establishment from the master can be specified via variable
"JULIA_WORKER_TIMEOUT" in the worker process's environment.
Relevant only when using TCP/IP as transport.

"""
addprocs

doc"""
    airy(k, x)

kth derivative of the Airy function \operatorname{Ai}(x).

"""
airy

doc"""
    airyai(x)

Airy function \operatorname{Ai}(x).

"""
airyai

doc"""
    airyaiprime(x)

Airy function derivative \operatorname{Ai}'(x).

"""
airyaiprime

doc"""
    airybi(x)

Airy function \operatorname{Bi}(x).

"""
airybi

doc"""
    airybiprime(x)

Airy function derivative \operatorname{Bi}'(x).

"""
airybiprime

doc"""
    airyprime(x)

Airy function derivative \operatorname{Ai}'(x).

"""
airyprime

doc"""
    airyx(k, x)

scaled kth derivative of the Airy function, return
\operatorname{Ai}(x) e^{\frac{2}{3} x \sqrt{x}} for "k == 0 ||
k == 1", and \operatorname{Ai}(x) e^{- \left| \operatorname{Re}
\left( \frac{2}{3} x \sqrt{x} \right) \right|} for "k == 2 ||
k == 3".

"""
airyx

doc"""
    all(itr) -> Bool

Test whether all elements of a boolean collection are true.

    all(A, dims)

Test whether all values along the given dimensions of an array are
true.

    all(p, itr) -> Bool

Determine whether predicate "p" returns true for all elements of
"itr".

    julia> all(i->(4<=i<=6), [4,5,6])
    true

"""
all

doc"""
    all!(r, A)

Test whether all values in "A" along the singleton dimensions of
"r" are true, and write results to "r".

"""
all!

doc"""
    angle(z)

Compute the phase angle in radians of a complex number "z"

"""
angle

doc"""
    any(itr) -> Bool

Test whether any elements of a boolean collection are true.

    any(A, dims)

Test whether any values along the given dimensions of an array are
true.

    any(p, itr) -> Bool

Determine whether predicate "p" returns true for any elements of
"itr".

"""
any

doc"""
    any!(r, A)

Test whether any values in "A" along the singleton dimensions of
"r" are true, and write results to "r".

"""
any!

doc"""
    append!(collection, collection2) -> collection.

Add the elements of "collection2" to the end of "collection".

    julia> append!([1],[2,3])
    3-element Array{Int64,1}:
     1
     2
     3

    julia> append!([1, 2, 3], [4, 5, 6])
    6-element Array{Int64,1}:
     1
     2
     3
     4
     5
     6

Use "push!()" to add individual items to "collection" which are
not already themselves in another collection. The result is of the
preceding example is equivalent to "push!([1, 2, 3], 4, 5, 6)".

"""
append!

doc"""
    applicable(f, args...) -> Bool

Determine whether the given generic function has a method
applicable to the given arguments.

    julia> function f(x, y)
               x + y
           end;

    julia> applicable(f, 1)
    false

    julia> applicable(f, 1, 2)
    true

"""
applicable

doc"""
    ascii(::Array{UInt8, 1})

Create an ASCII string from a byte array.

    ascii(s)

Convert a string to a contiguous ASCII string (all characters must
be valid ASCII characters).

    ascii(::Ptr{UInt8}[, length])

Create an ASCII string from the address of a C (0-terminated)
string encoded in ASCII. A copy is made; the ptr can be safely
freed. If "length" is specified, the string does not have to be
0-terminated.

"""
ascii

doc"""
    asec(x)

Compute the inverse secant of "x", where the output is in radians

"""
asec

doc"""
    asecd(x)

Compute the inverse secant of "x", where the output is in degrees

"""
asecd

doc"""
    asech(x)

Compute the inverse hyperbolic secant of "x"

"""
asech

doc"""
    asin(x)

Compute the inverse sine of "x", where the output is in radians

"""
asin

doc"""
    asind(x)

Compute the inverse sine of "x", where the output is in degrees

"""
asind

doc"""
    asinh(x)

Compute the inverse hyperbolic sine of "x"

"""
asinh

doc"""
    assert(cond)

Throw an "AssertionError" if "cond" is false. Also available as
the macro "@assert expr".

"""
assert

doc"""
    atan(x)

Compute the inverse tangent of "x", where the output is in
radians

"""
atan

doc"""
    atan2(y, x)

Compute the inverse tangent of "y/x", using the signs of both
"x" and "y" to determine the quadrant of the return value.

"""
atan2

doc"""
    atand(x)

Compute the inverse tangent of "x", where the output is in
degrees

"""
atand

doc"""
    atanh(x)

Compute the inverse hyperbolic tangent of "x"

"""
atanh

doc"""
    atexit(f)

Register a zero-argument function to be called at exit.

"""
atexit

doc"""
    atreplinit(f)

Register a one-argument function to be called before the REPL
interface is initialized in interactive sessions; this is useful to
customize the interface. The argument of "f" is the REPL object.
This function should be called from within the ".juliarc.jl"
initialization file.

"""
atreplinit

doc"""
    backtrace()

Get a backtrace object for the current program point.

"""
backtrace

doc"""
    base(base, n[, pad])

Convert an integer to a string in the given base, optionally
specifying a number of digits to pad to. The base can be specified
as either an integer, or as a "UInt8" array of character values
to use as digit symbols.

"""
base

doc"""
    base64decode(string)

Decodes the base64-encoded "string" and returns a
"Vector{UInt8}" of the decoded bytes.

"""
base64decode

doc"""
    base64encode(writefunc, args...)
base64encode(args...)

Given a "write"-like function "writefunc", which takes an I/O
stream as its first argument, "base64(writefunc, args...)" calls
"writefunc" to write "args..." to a base64-encoded string, and
returns the string.  "base64(args...)" is equivalent to
"base64(write, args...)": it converts its arguments into bytes
using the standard "write" functions and returns the
base64-encoded string.

"""
base64encode

doc"""
    basename(path::AbstractString) -> AbstractString

Get the file name part of a path.

"""
basename

doc"""
    besselh(nu, k, x)

Bessel function of the third kind of order "nu" (Hankel
function). "k" is either 1 or 2, selecting "hankelh1" or
"hankelh2", respectively.

"""
besselh

doc"""
    besseli(nu, x)

Modified Bessel function of the first kind of order "nu",
I_\nu(x).

"""
besseli

doc"""
    besselix(nu, x)

Scaled modified Bessel function of the first kind of order "nu",
I_\nu(x) e^{- | \operatorname{Re}(x) |}.

"""
besselix

doc"""
    besselj(nu, x)

Bessel function of the first kind of order "nu", J_\nu(x).

"""
besselj

doc"""
    besselj0(x)

Bessel function of the first kind of order 0, J_0(x).

"""
besselj0

doc"""
    besselj1(x)

Bessel function of the first kind of order 1, J_1(x).

"""
besselj1

doc"""
    besseljx(nu, x)

Scaled Bessel function of the first kind of order "nu", J_\nu(x)
e^{- | \operatorname{Im}(x) |}.

"""
besseljx

doc"""
    besselk(nu, x)

Modified Bessel function of the second kind of order "nu",
K_\nu(x).

"""
besselk

doc"""
    besselkx(nu, x)

Scaled modified Bessel function of the second kind of order "nu",
K_\nu(x) e^x.

"""
besselkx

doc"""
    bessely(nu, x)

Bessel function of the second kind of order "nu", Y_\nu(x).

"""
bessely

doc"""
    bessely0(x)

Bessel function of the second kind of order 0, Y_0(x).

"""
bessely0

doc"""
    bessely1(x)

Bessel function of the second kind of order 1, Y_1(x).

"""
bessely1

doc"""
    besselyx(nu, x)

Scaled Bessel function of the second kind of order "nu",
Y_\nu(x) e^{- | \operatorname{Im}(x) |}.

"""
besselyx

doc"""
    beta(x, y)

Euler integral of the first kind \operatorname{B}(x,y) =
\Gamma(x)\Gamma(y)/\Gamma(x+y).

"""
beta

doc"""
    bfft(A[, dims])

Similar to "ifft()", but computes an unnormalized inverse
(backward) transform, which must be divided by the product of the
sizes of the transformed dimensions in order to obtain the inverse.
(This is slightly more efficient than "ifft()" because it omits a
scaling step, which in some applications can be combined with other
computational steps elsewhere.)

    \operatorname{BDFT}(A)[k] = \operatorname{length}(A)
    \operatorname{IDFT}(A)[k]

"""
bfft

doc"""
    bfft!(A[, dims])

Same as "bfft()", but operates in-place on "A".

"""
bfft!

doc"""
    big(x)

Convert a number to a maximum precision representation (typically
"BigInt" or "BigFloat"). See "BigFloat" for information about
some pitfalls with floating-point numbers.

"""
big

doc"""
    bin(n[, pad])

Convert an integer to a binary string, optionally specifying a
number of digits to pad to.

"""
bin

doc"""
    bind(socket::Union{UDPSocket, TCPSocket}, host::IPv4, port::Integer)

Bind "socket" to the given "host:port". Note that *0.0.0.0*
will listen on all devices.

"""
bind

doc"""
    binomial(n, k)

Number of ways to choose "k" out of "n" items

"""
binomial

doc"""
    bitbroadcast(f, As...)

Like "broadcast", but allocates a "BitArray" to store the
result, rather then an "Array".

"""
bitbroadcast

doc"""
    bitpack(A::AbstractArray{T, N}) -> BitArray

Converts a numeric array to a packed boolean array

"""
bitpack

doc"""
    bitrand([rng][, dims...])

Generate a "BitArray" of random boolean values.

"""
bitrand

doc"""
    bits(n)

A string giving the literal bit representation of a number.

"""
bits

doc"""
    bitunpack(B::BitArray{N}) -> Array{Bool,N}

Converts a packed boolean array to an array of booleans

"""
bitunpack

doc"""
    bkfact(A) -> BunchKaufman

Compute the Bunch-Kaufman [Bunch1977] factorization of a real
symmetric or complex Hermitian matrix "A" and return a
"BunchKaufman" object. The following functions are available for
"BunchKaufman" objects: "size", "\", "inv", "issym",
"ishermitian".

"""
bkfact

doc"""
    bkfact!(A) -> BunchKaufman

"bkfact!" is the same as "bkfact()", but saves space by
overwriting the input "A", instead of creating a copy.

"""
bkfact!

doc"""
    blkdiag(A...)

Concatenate matrices block-diagonally. Currently only implemented
for sparse matrices.

"""
blkdiag

doc"""
    brfft(A, d[, dims])

Similar to "irfft()" but computes an unnormalized inverse
transform (similar to "bfft()"), which must be divided by the
product of the sizes of the transformed dimensions (of the real
output array) in order to obtain the inverse transform.

"""
brfft

doc"""
    broadcast(f, As...)

Broadcasts the arrays "As" to a common size by expanding
singleton dimensions, and returns an array of the results
"f(as...)" for each position.

"""
broadcast

doc"""
    broadcast!(f, dest, As...)

Like "broadcast", but store the result of "broadcast(f, As...)"
in the "dest" array. Note that "dest" is only used to store the
result, and does not supply arguments to "f" unless it is also
listed in the "As", as in "broadcast!(f, A, A, B)" to perform
"A[:] = broadcast(f, A, B)".

"""
broadcast!

doc"""
    broadcast!_function(f)

Like "broadcast_function", but for "broadcast!".

"""
broadcast!_function

doc"""
    broadcast_function(f)

Returns a function "broadcast_f" such that
"broadcast_function(f)(As...) === broadcast(f, As...)". Most
useful in the form "const broadcast_f = broadcast_function(f)".

"""
broadcast_function

doc"""
    broadcast_getindex(A, inds...)

Broadcasts the "inds" arrays to a common size like "broadcast",
and returns an array of the results "A[ks...]", where "ks" goes
over the positions in the broadcast.

"""
broadcast_getindex

doc"""
    broadcast_setindex!(A, X, inds...)

Broadcasts the "X" and "inds" arrays to a common size and
stores the value from each position in "X" at the indices given
by the same positions in "inds".

"""
broadcast_setindex!

doc"""
    bswap(n)

Byte-swap an integer

"""
bswap

doc"""
    bytes2hex(bin_arr::Array{UInt8, 1})

Convert an array of bytes to its hexadecimal representation. All
characters are in lower-case. Returns an ASCIIString.

"""
bytes2hex

doc"""
    bytestring(::Ptr{UInt8}[, length])

Create a string from the address of a C (0-terminated) string
encoded in ASCII or UTF-8. A copy is made; the ptr can be safely
freed. If "length" is specified, the string does not have to be
0-terminated.

    bytestring(s)

Convert a string to a contiguous byte array representation
appropriate for passing it to C functions. The string will be
encoded as either ASCII or UTF-8.

"""
bytestring

doc"""
    call(x, args...)

If "x" is not a "Function", then "x(args...)" is equivalent
to "call(x, args...)".  This means that function-like behavior
can be added to any type by defining new "call" methods.

"""
call

doc"""
    cartesianmap(f, dims)

Given a "dims" tuple of integers "(m, n, ...)", call "f" on
all combinations of integers in the ranges "1:m", "1:n", etc.

    julia> cartesianmap(println, (2,2))
    11
    21
    12
    22

"""
cartesianmap

doc"""
    cat(dims, A...)

Concatenate the input arrays along the specified dimensions in the
iterable "dims". For dimensions not in "dims", all input arrays
should have the same size, which will also be the size of the
output array along that dimension. For dimensions in "dims", the
size of the output array is the sum of the sizes of the input
arrays along that dimension. If "dims" is a single number, the
different arrays are tightly stacked along that dimension. If
"dims" is an iterable containing several dimensions, this allows
to construct block diagonal matrices and their higher-dimensional
analogues by simultaneously increasing several dimensions for every
new input array and putting zero blocks elsewhere. For example,
*cat([1,2], matrices...)* builds a block diagonal matrix, i.e. a
block matrix with *matrices[1]*, *matrices[2]*, ... as diagonal
blocks and matching zero blocks away from the diagonal.

"""
cat

doc"""
    catalan

Catalan's constant

"""
catalan

doc"""
    catch_backtrace()

Get the backtrace of the current exception, for use within
"catch" blocks.

"""
catch_backtrace

doc"""
    cbrt(x)

Return x^{1/3}.  The prefix operator "∛" is equivalent to
"cbrt".

"""
cbrt

doc"""
    cconvert(T, x)

Convert "x" to a value of type "T", typically by calling
"convert(T,x)"

In cases where "x" cannot be safely converted to "T", unlike
"convert", "cconvert" may return an object of a type different
from "T", which however is suitable for "unsafe_convert" to
handle.

Neither "convert" nor "cconvert" should take a Julia object and
turn it into a "Ptr".

"""
cconvert

doc"""
    cd(dir::AbstractString)

Set the current working directory.

    cd(f[, dir])

Temporarily changes the current working directory (HOME if not
specified) and applies function f before returning.

"""
cd

doc"""
    ceil([T], x[, digits[, base]])

"ceil(x)" returns the nearest integral value of the same type as
"x" that is greater than or equal to "x".

"ceil(T, x)" converts the result to type "T", throwing an
"InexactError" if the value is not representable.

"digits" and "base" work as for "round()".

"""
ceil

doc"""
    cell(dims)

Construct an uninitialized cell array (heterogeneous array).
"dims" can be either a tuple or a series of integer arguments.

"""
cell

doc"""
    cfunction(function::Function, ReturnType::Type, (ArgumentTypes...))

Generate C-callable function pointer from Julia function. Type
annotation of the return value in the callback function is a must
for situations where Julia cannot infer the return type
automatically.

For example:

    function foo()
        # body

        retval::Float64
    end

    bar = cfunction(foo, Float64, ())

"""
cfunction

doc"""
    cglobal((symbol, library)[, type=Void])

Obtain a pointer to a global variable in a C-exported shared
library, specified exactly as in "ccall".  Returns a
"Ptr{Type}", defaulting to "Ptr{Void}" if no Type argument is
supplied.  The values can be read or written by "unsafe_load" or
"unsafe_store!", respectively.

"""
cglobal

doc"""
    charwidth(c)

Gives the number of columns needed to print a character.

"""
charwidth

doc"""
    checkbounds(array, indexes...)

Throw an error if the specified indexes are not in bounds for the
given array.

"""
checkbounds

doc"""
    chmod(path, mode)

Change the permissions mode of "path" to "mode". Only integer
"mode"s (e.g. 0o777) are currently supported.

"""
chmod

doc"""
    chol(A[, LU]) -> F

Compute the Cholesky factorization of a symmetric positive definite
matrix "A" and return the matrix "F". If "LU" is "Val{:U}"
(Upper), "F" is of type "UpperTriangular" and "A = F'*F". If
"LU" is "Val{:L}" (Lower), "F" is of type "LowerTriangular"
and "A = F*F'". "LU" defaults to "Val{:U}".

"""
chol

doc"""
    cholfact(A, [LU=:U[,pivot=Val{false}]][;tol=-1.0]) -> Cholesky

Compute the Cholesky factorization of a dense symmetric positive
(semi)definite matrix "A" and return either a "Cholesky" if
"pivot==Val{false}" or "CholeskyPivoted" if
"pivot==Val{true}". "LU" may be ":L" for using the lower part
or ":U" for the upper part. The default is to use ":U". The
triangular matrix can be obtained from the factorization "F"
with: "F[:L]" and "F[:U]". The following functions are
available for "Cholesky" objects: "size", "\", "inv",
"det". For "CholeskyPivoted" there is also defined a "rank".
If "pivot==Val{false}" a "PosDefException" exception is thrown
in case the matrix is not positive definite. The argument "tol"
determines the tolerance for determining the rank. For negative
values, the tolerance is the machine precision.

    cholfact(A; shift=0, perm=Int[]) -> CHOLMOD.Factor

Compute the Cholesky factorization of a sparse positive definite
matrix "A". A fill-reducing permutation is used.  "F =
cholfact(A)" is most frequently used to solve systems of equations
with "F\b", but also the methods "diag", "det", "logdet"
are defined for "F".  You can also extract individual factors
from "F", using "F[:L]".  However, since pivoting is on by
default, the factorization is internally represented as "A ==
P'*L*L'*P" with a permutation matrix "P"; using just "L"
without accounting for "P" will give incorrect answers.  To
include the effects of permutation, it's typically preferable to
extact "combined" factors like "PtL = F[:PtL]" (the equivalent
of "P'*L") and "LtP = F[:UP]" (the equivalent of "L'*P").

Setting optional "shift" keyword argument computes the
factorization of "A+shift*I" instead of "A".  If the "perm"
argument is nonempty, it should be a permutation of *1:size(A,1)*
giving the ordering to use (instead of CHOLMOD's default AMD
ordering).

The function calls the C library CHOLMOD and many other functions
from the library are wrapped but not exported.

"""
cholfact

doc"""
    cholfact!(A [,LU=:U [,pivot=Val{false}]][;tol=-1.0]) -> Cholesky

"cholfact!" is the same as "cholfact()", but saves space by
overwriting the input "A", instead of creating a copy.
"cholfact!" can also reuse the symbolic factorization from a
different matrix "F" with the same structure when used as:
"cholfact!(F::CholmodFactor, A)".

"""
cholfact!

doc"""
    chomp(string)

Remove a trailing newline from a string

"""
chomp

doc"""
    chop(string)

Remove the last character from a string

"""
chop

doc"""
    chr2ind(string, i)

Convert a character index to a byte index

"""
chr2ind

doc"""
    circshift(A, shifts)

Circularly shift the data in an array. The second argument is a
vector giving the amount to shift in each dimension.

"""
circshift

doc"""
    cis(z)

Return \exp(iz).

"""
cis

doc"""
    clamp(x, lo, hi)

Return x if "lo <= x <= hi". If "x < lo", return "lo". If "x >
hi", return "hi". Arguments are promoted to a common type.
Operates elementwise over "x" if it is an array.

"""
clamp

doc"""
    cld(x, y)

Smallest integer larger than or equal to "x/y".

"""
cld

doc"""
    clipboard(x)

Send a printed form of "x" to the operating system clipboard
("copy").

    clipboard() -> AbstractString

Return a string with the contents of the operating system clipboard
("paste").

"""
clipboard

doc"""
    close(stream)

Close an I/O stream. Performs a "flush" first.

"""
close

doc"""
    cmp(x, y)

Return -1, 0, or 1 depending on whether "x" is less than, equal
to, or greater than "y", respectively. Uses the total order
implemented by "isless". For floating-point numbers, uses "<"
but throws an error for unordered arguments.

"""
cmp

doc"""
    code_llvm(f, types)

Prints the LLVM bitcodes generated for running the method matching
the given generic function and type signature to "STDOUT".

All metadata and dbg.* calls are removed from the printed bitcode.
Use code_llvm_raw for the full IR.

"""
code_llvm

doc"""
    code_lowered(f, types)

Returns an array of lowered ASTs for the methods matching the given
generic function and type signature.

"""
code_lowered

doc"""
    code_native(f, types)

Prints the native assembly instructions generated for running the
method matching the given generic function and type signature to
STDOUT.

"""
code_native

doc"""
    code_typed(f, types; optimize=true)

Returns an array of lowered and type-inferred ASTs for the methods
matching the given generic function and type signature. The keyword
argument "optimize" controls whether additional optimizations,
such as inlining, are also applied.

"""
code_typed

doc"""
    code_warntype(f, types)

Displays lowered and type-inferred ASTs for the methods matching
the given generic function and type signature. The ASTs are
annotated in such a way as to cause "non-leaf" types to be
emphasized (if color is available, displayed in red). This serves
as a warning of potential type instability. Not all non-leaf types
are particularly problematic for performance, so the results need
to be used judiciously. See *@code_warntype* for more information.

"""
code_warntype

doc"""
    collect(collection)

Return an array of all items in a collection. For associative
collections, returns (key, value) tuples.

    collect(element_type, collection)

Return an array of type "Array{element_type,1}" of all items in a
collection.

"""
collect

doc"""
    colon(start[, step], stop)

Called by ":" syntax for constructing ranges.

"""
colon

doc"""
    combinations(array, n)

Generate all combinations of "n" elements from an indexable
object.  Because the number of combinations can be very large, this
function returns an iterator object. Use
"collect(combinations(array,n))" to get an array of all
combinations.

"""
combinations

doc"""
    complement(s)

Returns the set-complement of "IntSet" "s".

"""
complement

doc"""
    complement!(s)

Mutates "IntSet" "s" into its set-complement.

"""
complement!

doc"""
    complex(r[, i])

Convert real numbers or arrays to complex. "i" defaults to zero.

"""
complex

doc"""
    cond(M[, p])

Condition number of the matrix "M", computed using the operator
"p"-norm. Valid values for "p" are "1", "2" (default), or
"Inf".

"""
cond

doc"""
    condskeel(M[, x, p])

    \kappa_S(M, p) & = \left\Vert \left\vert M \right\vert
    \left\vert M^{-1} \right\vert  \right\Vert_p \\
    \kappa_S(M, x, p) & = \left\Vert \left\vert M \right\vert
    \left\vert M^{-1} \right\vert \left\vert x \right\vert
    \right\Vert_p

Skeel condition number \kappa_S of the matrix "M", optionally
with respect to the vector "x", as computed using the operator
"p"-norm. "p" is "Inf" by default, if not provided. Valid
values for "p" are "1", "2", or "Inf".

This quantity is also known in the literature as the Bauer
condition number, relative condition number, or componentwise
relative condition number.

"""
condskeel

doc"""
    conj(z)

Compute the complex conjugate of a complex number "z"

"""
conj

doc"""
    conj!(A)

Convert an array to its complex conjugate in-place

"""
conj!

doc"""
    connect([host], port) -> TcpSocket

Connect to the host "host" on port "port"

    connect(path) -> Pipe

Connect to the Named Pipe/Domain Socket at "path"

    connect(manager::FooManager, pid::Int, config::WorkerConfig) -> (instrm::AsyncStream, outstrm::AsyncStream)

Implemented by cluster managers using custom transports. It should
establish a logical connection to worker with id "pid", specified
by "config" and return a pair of "AsyncStream" objects.
Messages from "pid" to current process will be read off
"instrm", while messages to be sent to "pid" will be written to
"outstrm". The custom transport implementation must ensure that
messages are delivered and received completely and in order.
"Base.connect(manager::ClusterManager.....)" sets up TCP/IP
socket connections in-between workers.

"""
connect

doc"""
    consume(task, values...)

Receive the next value passed to "produce" by the specified task.
Additional arguments may be passed, to be returned from the last
"produce" call in the producer.

"""
consume

doc"""
    contains(haystack, needle)

Determine whether the second argument is a substring of the first.

"""
contains

doc"""
    conv(u, v)

Convolution of two vectors. Uses FFT algorithm.

"""
conv

doc"""
    conv2(u, v, A)

2-D convolution of the matrix "A" with the 2-D separable kernel
generated by the vectors "u" and "v".  Uses 2-D FFT algorithm

    conv2(B, A)

2-D convolution of the matrix "B" with the matrix "A".  Uses
2-D FFT algorithm

"""
conv2

doc"""
    convert(T, x)

Convert "x" to a value of type "T".

If "T" is an "Integer" type, an "InexactError" will be raised
if "x" is not representable by "T", for example if "x" is not
integer-valued, or is outside the range supported by "T".

    julia> convert(Int, 3.0)
    3

    julia> convert(Int, 3.5)
    ERROR: InexactError()
     in convert at int.jl:196

If "T" is a "FloatingPoint" or "Rational" type, then it will
return the closest value to "x" representable by "T".

    julia> x = 1/3
    0.3333333333333333

    julia> convert(Float32, x)
    0.33333334f0

    julia> convert(Rational{Int32}, x)
    1//3

    julia> convert(Rational{Int64}, x)
    6004799503160661//18014398509481984

"""
convert

doc"""
    copy(x)

Create a shallow copy of "x": the outer structure is copied, but
not all internal values. For example, copying an array produces a
new array with identically-same elements as the original.

"""
copy

doc"""
    copy!(dest, src)

Copy all elements from collection "src" to array "dest".
Returns "dest".

    copy!(dest, do, src, so, N)

Copy "N" elements from collection "src" starting at offset
"so", to array "dest" starting at offset "do". Returns
"dest".

"""
copy!

doc"""
    copysign(x, y)

Return "x" such that it has the same sign as "y"

"""
copysign

doc"""
    cor(v1[, v2][, vardim=1, mean=nothing])

Compute the Pearson correlation between the vector(s) in "v1" and
"v2".

Users can use the keyword argument "vardim" to specify the
variable dimension, and "mean" to supply pre-computed mean
values.

"""
cor

doc"""
    cos(x)

Compute cosine of "x", where "x" is in radians

"""
cos

doc"""
    cosc(x)

Compute \cos(\pi x) / x - \sin(\pi x) / (\pi x^2) if x \neq
0, and 0 if x = 0. This is the derivative of "sinc(x)".

"""
cosc

doc"""
    cosd(x)

Compute cosine of "x", where "x" is in degrees

"""
cosd

doc"""
    cosh(x)

Compute hyperbolic cosine of "x"

"""
cosh

doc"""
    cospi(x)

Compute \cos(\pi x) more accurately than "cos(pi*x)",
especially for large "x".

"""
cospi

doc"""
    cot(x)

Compute the cotangent of "x", where "x" is in radians

"""
cot

doc"""
    cotd(x)

Compute the cotangent of "x", where "x" is in degrees

"""
cotd

doc"""
    coth(x)

Compute the hyperbolic cotangent of "x"

"""
coth

doc"""
    count(p, itr) -> Integer

Count the number of elements in "itr" for which predicate "p"
returns true.

"""
count

doc"""
    count_ones(x::Integer) -> Integer

Number of ones in the binary representation of "x".

    julia> count_ones(7)
    3

"""
count_ones

doc"""
    count_zeros(x::Integer) -> Integer

Number of zeros in the binary representation of "x".

    julia> count_zeros(Int32(2 ^ 16 - 1))
    16

"""
count_zeros

doc"""
    countfrom(start=1, step=1)

An iterator that counts forever, starting at "start" and
incrementing by "step".

"""
countfrom

doc"""
    countlines(io[, eol::Char])

Read io until the end of the stream/file and count the number of
non-empty lines. To specify a file pass the filename as the first
argument. EOL markers other than '\n' are supported by passing
them as the second argument.

"""
countlines

doc"""
    countnz(A)

Counts the number of nonzero values in array A (dense or sparse).
Note that this is not a constant-time operation. For sparse
matrices, one should usually use "nnz", which returns the number
of stored values.

"""
countnz

doc"""
    cov(v1[, v2][, vardim=1, corrected=true, mean=nothing])

Compute the Pearson covariance between the vector(s) in "v1" and
"v2". Here, "v1" and "v2" can be either vectors or matrices.

This function accepts three keyword arguments:

* "vardim": the dimension of variables. When "vardim = 1",
  variables are considered in columns while observations in rows;
  when "vardim = 2", variables are in rows while observations in
  columns. By default, it is set to "1".

* "corrected": whether to apply Bessel's correction (divide by
  "n-1" instead of "n"). By default, it is set to "true".

* "mean": allow users to supply mean values that are known. By
  default, it is set to "nothing", which indicates that the
  mean(s) are unknown, and the function will compute the mean.
  Users can use "mean=0" to indicate that the input data are
  centered, and hence there's no need to subtract the mean.

The size of the result depends on the size of "v1" and "v2".
When both "v1" and "v2" are vectors, it returns the covariance
between them as a scalar. When either one is a matrix, it returns a
covariance matrix of size "(n1, n2)", where "n1" and "n2" are
the numbers of slices in "v1" and "v2", which depend on the
setting of "vardim".

Note: "v2" can be omitted, which indicates "v2 = v1".

"""
cov

doc"""
    cp(src::AbstractString, dst::AbstractString; remove_destination::Bool=false, follow_symlinks::Bool=false)

Copy the file, link, or directory from *src* to *dest*.
"remove_destination=true" will first remove an existing *dst*.

If *follow_symlinks=false*, and src is a symbolic link, dst will be
created as a symbolic link. If *follow_symlinks=true* and src is a
symbolic link, dst will be a copy of the file or directory *src*
refers to.

"""
cp

doc"""
    cross(x, y)
×(x, y)

Compute the cross product of two 3-vectors.

"""
cross

doc"""
    csc(x)

Compute the cosecant of "x", where "x" is in radians

"""
csc

doc"""
    cscd(x)

Compute the cosecant of "x", where "x" is in degrees

"""
cscd

doc"""
    csch(x)

Compute the hyperbolic cosecant of "x"

"""
csch

doc"""
    ctime(file)

Equivalent to stat(file).ctime

"""
ctime

doc"""
    ctranspose(A)

The conjugate transposition operator ("'").

"""
ctranspose

doc"""
    ctranspose!(dest, src)

Conjugate transpose array "src" and store the result in the
preallocated array "dest", which should have a size corresponding
to "(size(src,2),size(src,1))". No in-place transposition is
supported and unexpected results will happen if *src* and *dest*
have overlapping memory regions.

"""
ctranspose!

doc"""
    cummax(A[, dim])

Cumulative maximum along a dimension. The dimension defaults to 1.

"""
cummax

doc"""
    cummin(A[, dim])

Cumulative minimum along a dimension. The dimension defaults to 1.

"""
cummin

doc"""
    cumprod(A[, dim])

Cumulative product along a dimension "dim" (defaults to 1). See
also "cumprod!()" to use a preallocated output array, both for
performance and to control the precision of the output (e.g. to
avoid overflow).

"""
cumprod

doc"""
    cumprod!(B, A[, dim])

Cumulative product of "A" along a dimension, storing the result
in "B". The dimension defaults to 1.

"""
cumprod!

doc"""
    cumsum(A[, dim])

Cumulative sum along a dimension "dim" (defaults to 1). See also
"cumsum!()" to use a preallocated output array, both for
performance and to control the precision of the output (e.g. to
avoid overflow).

"""
cumsum

doc"""
    cumsum!(B, A[, dim])

Cumulative sum of "A" along a dimension, storing the result in
"B". The dimension defaults to 1.

"""
cumsum!

doc"""
    cumsum_kbn(A[, dim])

Cumulative sum along a dimension, using the Kahan-Babuska-Neumaier
compensated summation algorithm for additional accuracy. The
dimension defaults to 1.

"""
cumsum_kbn

doc"""
    current_module() -> Module

Get the *dynamically* current module, which is the module code is
currently being read from. In general, this is not the same as the
module containing the call to this function.

"""
current_module

doc"""
    current_task()

Get the currently running Task.

"""
current_task

doc"""
    cycle(iter)

An iterator that cycles through "iter" forever.

"""
cycle

doc"""
    dawson(x)

Compute the Dawson function (scaled imaginary error function) of
"x", defined by \frac{\sqrt{\pi}}{2} e^{-x^2}
\operatorname{erfi}(x).

"""
dawson

doc"""
    dct(A[, dims])

Performs a multidimensional type-II discrete cosine transform (DCT)
of the array "A", using the unitary normalization of the DCT. The
optional "dims" argument specifies an iterable subset of
dimensions (e.g. an integer, range, tuple, or array) to transform
along.  Most efficient if the size of "A" along the transformed
dimensions is a product of small primes; see "nextprod()".  See
also "plan_dct()" for even greater efficiency.

"""
dct

doc"""
    dct!(A[, dims])

Same as "dct!()", except that it operates in-place on "A",
which must be an array of real or complex floating-point values.

"""
dct!

doc"""
    dec(n[, pad])

Convert an integer to a decimal string, optionally specifying a
number of digits to pad to.

"""
dec

doc"""
    deconv(b, a)

Construct vector "c" such that "b = conv(a,c) + r". Equivalent
to polynomial division.

"""
deconv

doc"""
    deepcopy(x)

Create a deep copy of "x": everything is copied recursively,
resulting in a fully independent object. For example, deep-copying
an array produces a new array whose elements are deep copies of the
original elements. Calling *deepcopy* on an object should generally
have the same effect as serializing and then deserializing it.

As a special case, functions can only be actually deep-copied if
they are anonymous, otherwise they are just copied. The difference
is only relevant in the case of closures, i.e. functions which may
contain hidden internal references.

While it isn't normally necessary, user-defined types can override
the default "deepcopy" behavior by defining a specialized version
of the function "deepcopy_internal(x::T, dict::ObjectIdDict)"
(which shouldn't otherwise be used), where "T" is the type to be
specialized for, and "dict" keeps track of objects copied so far
within the recursion. Within the definition, "deepcopy_internal"
should be used in place of "deepcopy", and the "dict" variable
should be updated as appropriate before returning.

"""
deepcopy

doc"""
    deg2rad(x)

Convert "x" from degrees to radians

"""
deg2rad

doc"""
    delete!(collection, key)

Delete the mapping for the given key in a collection, and return
the collection.

"""
delete!

doc"""
    deleteat!(collection, index)

Remove the item at the given "index" and return the modified
"collection". Subsequent items are shifted to fill the resulting
gap.

    julia> deleteat!([6, 5, 4, 3, 2, 1], 2)
    5-element Array{Int64,1}:
     6
     4
     3
     2
     1

    deleteat!(collection, itr)

Remove the items at the indices given by "itr", and return the
modified "collection". Subsequent items are shifted to fill the
resulting gap. "itr" must be sorted and unique.

    julia> deleteat!([6, 5, 4, 3, 2, 1], 1:2:5)
    3-element Array{Int64,1}:
     5
     3
     1

    julia> deleteat!([6, 5, 4, 3, 2, 1], (2, 2))
    ERROR: ArgumentError: indices must be unique and sorted
     in deleteat! at array.jl:631

"""
deleteat!

doc"""
    den(x)

Denominator of the rational representation of "x"

"""
den

doc"""
    deserialize(stream)

Read a value written by "serialize".

"""
deserialize

doc"""
    det(M)

Matrix determinant

"""
det

doc"""
    detach(command)

Mark a command object so that it will be run in a new process
group, allowing it to outlive the julia process, and not have
Ctrl-C interrupts passed to it.

"""
detach

doc"""
    diag(M[, k])

The "k"th diagonal of a matrix, as a vector. Use "diagm" to
construct a diagonal matrix.

"""
diag

doc"""
    diagind(M[, k])

A "Range" giving the indices of the "k"th diagonal of the
matrix "M".

"""
diagind

doc"""
    diagm(v[, k])

Construct a diagonal matrix and place "v" on the "k"th
diagonal.

"""
diagm

doc"""
    diff(A[, dim])

Finite difference operator of matrix or vector.

"""
diff

doc"""
    digamma(x)

Compute the digamma function of "x" (the logarithmic derivative
of "gamma(x)")

"""
digamma

doc"""
    digits(n[, base][, pad])

Returns an array of the digits of "n" in the given base,
optionally padded with zeros to a specified size. More significant
digits are at higher indexes, such that "n ==
sum([digits[k]*base^(k-1) for k=1:length(digits)])".

"""
digits

doc"""
    digits!(array, n[, base])

Fills an array of the digits of "n" in the given base. More
significant digits are at higher indexes. If the array length is
insufficient, the least significant digits are filled up to the
array length. If the array length is excessive, the excess portion
is filled with zeros.

"""
digits!

doc"""
    dirname(path::AbstractString) -> AbstractString

Get the directory part of a path.

"""
dirname

doc"""
    disable_sigint(f::Function)

Disable Ctrl-C handler during execution of a function, for calling
external code that is not interrupt safe. Intended to be called
using "do" block syntax as follows:

    disable_sigint() do
        # interrupt-unsafe code
        ...
    end

"""
disable_sigint

doc"""
    display(x)
display(d::Display, x)
display(mime, x)
display(d::Display, mime, x)

Display "x" using the topmost applicable display in the display
stack, typically using the richest supported multimedia output for
"x", with plain-text "STDOUT" output as a fallback.  The
"display(d, x)" variant attempts to display "x" on the given
display "d" only, throwing a "MethodError" if "d" cannot
display objects of this type.

There are also two variants with a "mime" argument (a MIME type
string, such as ""image/png""), which attempt to display "x"
using the requested MIME type *only*, throwing a "MethodError" if
this type is not supported by either the display(s) or by "x".
With these variants, one can also supply the "raw" data in the
requested MIME type by passing "x::AbstractString" (for MIME
types with text-based storage, such as text/html or
application/postscript) or "x::Vector{UInt8}" (for binary MIME
types).

"""
display

doc"""
    displayable(mime) -> Bool
displayable(d::Display, mime) -> Bool

Returns a boolean value indicating whether the given "mime" type
(string) is displayable by any of the displays in the current
display stack, or specifically by the display "d" in the second
variant.

"""
displayable

doc"""
    div(x, y)
÷(x, y)

The quotient from Euclidean division. Computes "x/y", truncated
to an integer.

"""
div

doc"""
    divrem(x, y)

The quotient and remainder from Euclidean division. Equivalent to
"(x÷y, x%y)".

"""
divrem

doc"""
    done(iter, state) -> Bool

Test whether we are done iterating

"""
done

doc"""
    dot(x, y)
⋅(x, y)

Compute the dot product. For complex vectors, the first vector is
conjugated.

"""
dot

doc"""
    download(url[, localfile])

Download a file from the given url, optionally renaming it to the
given local file name. Note that this function relies on the
availability of external tools such as "curl", "wget" or
"fetch" to download the file and is provided for convenience. For
production use or situations in which more options are need, please
use a package that provides the desired functionality instead.

"""
download

doc"""
    drop(iter, n)

An iterator that generates all but the first "n" elements of
"iter".

"""
drop

doc"""
    dump(x)

Show all user-visible structure of a value.

"""
dump

doc"""
    e
eu

The constant e

"""
e

doc"""
    eachindex(A...)

Creates an iterable object for visiting each index of an
AbstractArray "A" in an efficient manner. For array types that
have opted into fast linear indexing (like "Array"), this is
simply the range "1:length(A)". For other array types, this
returns a specialized Cartesian range to efficiently index into the
array with indices specified for every dimension. For other
iterables, including strings and dictionaries, this returns an
iterator object supporting arbitrary index types (e.g. unevenly
spaced or non-integer indices).

Example for a sparse 2-d array:

    julia> A = sprand(2, 3, 0.5)
    2x3 sparse matrix with 4 Float64 entries:
        [1, 1]  =  0.598888
        [1, 2]  =  0.0230247
        [1, 3]  =  0.486499
        [2, 3]  =  0.809041

    julia> for iter in eachindex(A)
               @show iter.I_1, iter.I_2
               @show A[iter]
           end
    (iter.I_1,iter.I_2) = (1,1)
    A[iter] = 0.5988881393454597
    (iter.I_1,iter.I_2) = (2,1)
    A[iter] = 0.0
    (iter.I_1,iter.I_2) = (1,2)
    A[iter] = 0.02302469881746183
    (iter.I_1,iter.I_2) = (2,2)
    A[iter] = 0.0
    (iter.I_1,iter.I_2) = (1,3)
    A[iter] = 0.4864987874354343
    (iter.I_1,iter.I_2) = (2,3)
    A[iter] = 0.8090413606455655

"""
eachindex

doc"""
    eachline(stream)

Create an iterable object that will yield each line from a stream.

"""
eachline

doc"""
    eachmatch(r::Regex, s::AbstractString[, overlap::Bool=false])

Search for all matches of a the regular expression "r" in "s"
and return a iterator over the matches. If overlap is true, the
matching sequences are allowed to overlap indices in the original
string, otherwise they must be from distinct character ranges.

"""
eachmatch

doc"""
    edit(file::AbstractString[, line])

Edit a file optionally providing a line number to edit at. Returns
to the julia prompt when you quit the editor.

    edit(function[, types])

Edit the definition of a function, optionally specifying a tuple of
types to indicate which method to edit.

"""
edit

doc"""
    eig(A,[irange,][vl,][vu,][permute=true,][scale=true]) -> D, V

Computes eigenvalues and eigenvectors of "A". See "eigfact()"
for details on the "balance" keyword argument.

    julia> eig([1.0 0.0 0.0; 0.0 3.0 0.0; 0.0 0.0 18.0])
    ([1.0,3.0,18.0],
    3x3 Array{Float64,2}:
     1.0  0.0  0.0
     0.0  1.0  0.0
     0.0  0.0  1.0)

"eig" is a wrapper around "eigfact()", extracting all parts of
the factorization to a tuple; where possible, using "eigfact()"
is recommended.

    eig(A, B) -> D, V

Computes generalized eigenvalues and vectors of "A" with respect
to "B".

"eig" is a wrapper around "eigfact()", extracting all parts of
the factorization to a tuple; where possible, using "eigfact()"
is recommended.

"""
eig

doc"""
    eigfact(A,[irange,][vl,][vu,][permute=true,][scale=true]) -> Eigen

Computes the eigenvalue decomposition of "A", returning an
"Eigen" factorization object "F" which contains the eigenvalues
in "F[:values]" and the eigenvectors in the columns of the matrix
"F[:vectors]". (The "k"th eigenvector can be obtained from the
slice "F[:vectors][:, k]".)

The following functions are available for "Eigen" objects:
"inv", "det".

If "A" is "Symmetric", "Hermitian" or "SymTridiagonal", it
is possible to calculate only a subset of the eigenvalues by
specifying either a "UnitRange" "irange" covering indices of
the sorted eigenvalues or a pair "vl" and "vu" for the lower
and upper boundaries of the eigenvalues.

For general nonsymmetric matrices it is possible to specify how the
matrix is balanced before the eigenvector calculation. The option
"permute=true" permutes the matrix to become closer to upper
triangular, and "scale=true" scales the matrix by its diagonal
elements to make rows and columns more equal in norm. The default
is "true" for both options.

    eigfact(A, B) -> GeneralizedEigen

Computes the generalized eigenvalue decomposition of "A" and
"B", returning a "GeneralizedEigen" factorization object "F"
which contains the generalized eigenvalues in "F[:values]" and
the generalized eigenvectors in the columns of the matrix
"F[:vectors]". (The "k"th generalized eigenvector can be
obtained from the slice "F[:vectors][:, k]".)

"""
eigfact

doc"""
    eigfact!(A[, B])

Same as "eigfact()", but saves space by overwriting the input
"A" (and "B"), instead of creating a copy.

"""
eigfact!

doc"""
    eigmax(A)

Returns the largest eigenvalue of "A".

"""
eigmax

doc"""
    eigmin(A)

Returns the smallest eigenvalue of "A".

"""
eigmin

doc"""
    eigs(A[, B], ; nev=6, which="LM", tol=0.0, maxiter=300, sigma=nothing, ritzvec=true, v0=zeros((0, ))) -> (d[, v], nconv, niter, nmult, resid)

Computes eigenvalues "d" of "A" using Lanczos or Arnoldi
iterations for real symmetric or general nonsymmetric matrices
respectively. If "B" is provided, the generalized eigenproblem is
solved.

The following keyword arguments are supported:
* "nev": Number of eigenvalues
* "ncv": Number of Krylov vectors used in the computation;
  should satisfy

     "nev+1 <= ncv <= n" for real symmetric problems and
     "nev+2 <= ncv <= n" for other problems, where "n" is
     the size of the input matrix "A". The default is "ncv =
     max(20,2*nev+1)". Note that these restrictions limit the
     input matrix "A" to be of dimension at least 2.

* "which": type of eigenvalues to compute. See the note
  below.

    +-----------+-----------------------------------------------------------------------------------------------------------------------------+
    | \"which\" | type of eigenvalues                                                                                                         |
    +-----------+-----------------------------------------------------------------------------------------------------------------------------+
    | \":LM\"   | eigenvalues of largest magnitude (default)                                                                                  |
    +-----------+-----------------------------------------------------------------------------------------------------------------------------+
    | \":SM\"   | eigenvalues of smallest magnitude                                                                                           |
    +-----------+-----------------------------------------------------------------------------------------------------------------------------+
    | \":LR\"   | eigenvalues of largest real part                                                                                            |
    +-----------+-----------------------------------------------------------------------------------------------------------------------------+
    | \":SR\"   | eigenvalues of smallest real part                                                                                           |
    +-----------+-----------------------------------------------------------------------------------------------------------------------------+
    | \":LI\"   | eigenvalues of largest imaginary part (nonsymmetric or complex \"A\" only)                                                  |
    +-----------+-----------------------------------------------------------------------------------------------------------------------------+
    | \":SI\"   | eigenvalues of smallest imaginary part (nonsymmetric or complex \"A\" only)                                                 |
    +-----------+-----------------------------------------------------------------------------------------------------------------------------+
    | \":BE\"   | compute half of the eigenvalues from each end of the spectrum, biased in favor of the high end. (real symmetric \"A\" only) |
    +-----------+-----------------------------------------------------------------------------------------------------------------------------+

* "tol": tolerance (tol \le 0.0 defaults to
  "DLAMCH('EPS')")

* "maxiter": Maximum number of iterations (default = 300)

* "sigma": Specifies the level shift used in inverse
  iteration. If "nothing" (default), defaults to ordinary
  (forward) iterations. Otherwise, find eigenvalues close to
  "sigma" using shift and invert iterations.

* "ritzvec": Returns the Ritz vectors "v" (eigenvectors)
  if "true"

* "v0": starting vector from which to start the iterations

"eigs" returns the "nev" requested eigenvalues in "d", the
corresponding Ritz vectors "v" (only if "ritzvec=true"), the
number of converged eigenvalues "nconv", the number of iterations
"niter" and the number of matrix vector multiplications
"nmult", as well as the final residual vector "resid".

Note: The "sigma" and "which" keywords interact: the
description of eigenvalues searched for by "which" do _not_
necessarily refer to the eigenvalues of "A", but rather the
linear operator constructed by the specification of the iteration
mode implied by "sigma".

    +-----------------+------------------------------------+------------------------------------+
    | \"sigma\"       | iteration mode                     | \"which\" refers to eigenvalues of |
    +-----------------+------------------------------------+------------------------------------+
    | \"nothing\"     | ordinary (forward)                 | A                                  |
    +-----------------+------------------------------------+------------------------------------+
    | real or complex | inverse with level shift \"sigma\" | (A - \\sigma I )^{-1}              |
    +-----------------+------------------------------------+------------------------------------+

"""
eigs

doc"""
    eigvals(A,[irange,][vl,][vu])

Returns the eigenvalues of "A". If "A" is "Symmetric",
"Hermitian" or "SymTridiagonal", it is possible to calculate
only a subset of the eigenvalues by specifying either a
"UnitRange" "irange" covering indices of the sorted
eigenvalues, or a pair "vl" and "vu" for the lower and upper
boundaries of the eigenvalues.

For general non-symmetric matrices it is possible to specify how
the matrix is balanced before the eigenvector calculation. The
option "permute=true" permutes the matrix to become closer to
upper triangular, and "scale=true" scales the matrix by its
diagonal elements to make rows and columns more equal in norm. The
default is "true" for both options.

"""
eigvals

doc"""
    eigvecs(A, [eigvals,][permute=true,][scale=true]) -> Matrix

Returns a matrix "M" whose columns are the eigenvectors of "A".
(The "k"th eigenvector can be obtained from the slice "M[:,
k]".) The "permute" and "scale" keywords are the same as for
"eigfact()".

For "SymTridiagonal" matrices, if the optional vector of
eigenvalues "eigvals" is specified, returns the specific
corresponding eigenvectors.

"""
eigvecs

doc"""
    eltype(type)

Determine the type of the elements generated by iterating a
collection of the given "type". For associative collection types,
this will be a "(key,value)" tuple type. The definition
"eltype(x) = eltype(typeof(x))" is provided for convenience so
that instances can be passed instead of types. However the form
that accepts a type argument should be defined for new types.

"""
eltype

doc"""
    empty!(collection) -> collection

Remove all elements from a "collection".

"""
empty!

doc"""
    endof(collection) -> Integer

Returns the last index of the collection.

    julia> endof([1,2,4])
    3

"""
endof

doc"""
    endswith(string, suffix | chars)

Returns "true" if "string" ends with "suffix". If the second
argument is a vector or set of characters, tests whether the last
character of "string" belongs to that set.

"""
endswith

doc"""
    enumerate(iter)

An iterator that yields "(i, x)" where "i" is an index starting
at 1, and "x" is the "i"th value from the given iterator. It's
useful when you need not only the values "x" over which you are
iterating, but also the index "i" of the iterations.

    julia> a = ["a", "b", "c"];

    julia> for (index, value) in enumerate(a)
               println("\$index \$value")
           end
    1 a
    2 b
    3 c

"""
enumerate

doc"""
    eof(stream) -> Bool

Tests whether an I/O stream is at end-of-file. If the stream is not
yet exhausted, this function will block to wait for more data if
necessary, and then return "false". Therefore it is always safe
to read one byte after seeing "eof" return "false". "eof"
will return "false" as long as buffered data is still available,
even if the remote end of a connection is closed.

"""
eof

doc"""
    eps([type])

The distance between 1.0 and the next larger representable
floating-point value of "type". Only floating-point types are
sensible arguments. If "type" is omitted, then "eps(Float64)"
is returned.

    eps(x)

The distance between "x" and the next larger representable
floating-point value of the same type as "x".

"""
eps

doc"""
    erf(x)

Compute the error function of "x", defined by
\frac{2}{\sqrt{\pi}} \int_0^x e^{-t^2} dt for arbitrary complex
"x".

"""
erf

doc"""
    erfc(x)

Compute the complementary error function of "x", defined by 1 -
\operatorname{erf}(x).

"""
erfc

doc"""
    erfcinv(x)

Compute the inverse error complementary function of a real "x",
defined by \operatorname{erfc}(\operatorname{erfcinv}(x)) = x.

"""
erfcinv

doc"""
    erfcx(x)

Compute the scaled complementary error function of "x", defined
by e^{x^2} \operatorname{erfc}(x).  Note also that
\operatorname{erfcx}(-ix) computes the Faddeeva function w(x).

"""
erfcx

doc"""
    erfi(x)

Compute the imaginary error function of "x", defined by -i
\operatorname{erf}(ix).

"""
erfi

doc"""
    erfinv(x)

Compute the inverse error function of a real "x", defined by
\operatorname{erf}(\operatorname{erfinv}(x)) = x.

"""
erfinv

doc"""
    error(message::AbstractString)

Raise an "ErrorException" with the given message

"""
error

doc"""
    esc(e::ANY)

Only valid in the context of an Expr returned from a macro.
Prevents the macro hygiene pass from turning embedded variables
into gensym variables. See the *Macros* section of the
Metaprogramming chapter of the manual for more details and
examples.

"""
esc

doc"""
    escape_string(str::AbstractString) -> AbstractString

General escaping of traditional C and Unicode escape sequences. See
"print_escaped()" for more general escaping.

"""
escape_string

doc"""
    eta(x)

Dirichlet eta function \eta(s) =
\sum^\infty_{n=1}(-)^{n-1}/n^{s}.

"""
eta

doc"""
    etree(A[, post])

Compute the elimination tree of a symmetric sparse matrix "A"
from "triu(A)" and, optionally, its post-ordering permutation.

"""
etree

doc"""
    eval([m::Module], expr::Expr)

Evaluate an expression in the given module and return the result.
Every module (except those defined with "baremodule") has its own
1-argument definition of "eval", which evaluates expressions in
that module.

"""
eval

doc"""
    evalfile(path::AbstractString)

Load the file using "include", evaluate all expressions, and
return the value of the last one.

"""
evalfile

doc"""
    exit([code])

Quit (or control-D at the prompt). The default exit code is zero,
indicating that the processes completed successfully.

"""
exit

doc"""
    exp(x)

Compute e^x

"""
exp

doc"""
    exp10(x)

Compute 10^x

"""
exp10

doc"""
    exp2(x)

Compute 2^x

"""
exp2

doc"""
    expand(x)

Takes the expression x and returns an equivalent expression in
lowered form

"""
expand

doc"""
    expanduser(path::AbstractString) -> AbstractString

On Unix systems, replace a tilde character at the start of a path
with the current user's home directory.

"""
expanduser

doc"""
    expm(A)

Matrix exponential.

"""
expm

doc"""
    expm1(x)

Accurately compute e^x-1

"""
expm1

doc"""
    exponent(x) -> Int

Get the exponent of a normalized floating-point number.

"""
exponent

doc"""
    extrema(itr)

Compute both the minimum and maximum element in a single pass, and
return them as a 2-tuple.

"""
extrema

doc"""
    eye(n)

n-by-n identity matrix

    eye(m, n)

m-by-n identity matrix

    eye(A)

Constructs an identity matrix of the same dimensions and type as
"A".

"""
eye

doc"""
    factor(n) -> Dict

Compute the prime factorization of an integer "n". Returns a
dictionary. The keys of the dictionary correspond to the factors,
and hence are of the same type as "n". The value associated with
each key indicates the number of times the factor appears in the
factorization.

    julia> factor(100) # == 2*2*5*5
    Dict{Int64,Int64} with 2 entries:
      2 => 2
      5 => 2

"""
factor

doc"""
    factorial(n)

Factorial of "n".  If "n" is an "Integer", the factorial is
computed as an integer (promoted to at least 64 bits).  Note that
this may overflow if "n" is not small, but you can use
"factorial(big(n))" to compute the result exactly in arbitrary
precision.  If "n" is not an "Integer", "factorial(n)" is
equivalent to "gamma(n+1)".

    factorial(n, k)

Compute "factorial(n)/factorial(k)"

"""
factorial

doc"""
    factorize(A)

Compute a convenient factorization (including LU, Cholesky, Bunch-
Kaufman, LowerTriangular, UpperTriangular) of A, based upon the
type of the input matrix. The return value can then be reused for
efficient solving of multiple systems. For example:
"A=factorize(A); x=A\\b; y=A\\C".

"""
factorize

doc"""
    falses(dims)

Create a "BitArray" with all values set to false

"""
falses

doc"""
    fd(stream)

Returns the file descriptor backing the stream or file. Note that
this function only applies to synchronous *File*'s and *IOStream*'s
not to any of the asynchronous streams.

"""
fd

doc"""
    fdio([name::AbstractString], fd::Integer[, own::Bool]) -> IOStream

Create an "IOStream" object from an integer file descriptor. If
"own" is true, closing this object will close the underlying
descriptor. By default, an "IOStream" is closed when it is
garbage collected. "name" allows you to associate the descriptor
with a named file.

"""
fdio

doc"""
    fetch(RemoteRef)

Wait for and get the value of a remote reference.

"""
fetch

doc"""
    fft(A[, dims])

Performs a multidimensional FFT of the array "A".  The optional
"dims" argument specifies an iterable subset of dimensions (e.g.
an integer, range, tuple, or array) to transform along.  Most
efficient if the size of "A" along the transformed dimensions is
a product of small primes; see "nextprod()".  See also
"plan_fft()" for even greater efficiency.

A one-dimensional FFT computes the one-dimensional discrete Fourier
transform (DFT) as defined by

    \operatorname{DFT}(A)[k] =
    \sum_{n=1}^{\operatorname{length}(A)}
    \exp\left(-i\frac{2\pi
    (n-1)(k-1)}{\operatorname{length}(A)} \right) A[n].

A multidimensional FFT simply performs this operation along each
transformed dimension of "A".

Higher performance is usually possible with multi-threading. Use
*FFTW.set_num_threads(np)* to use *np* threads, if you have *np*
processors.

"""
fft

doc"""
    fft!(A[, dims])

Same as "fft()", but operates in-place on "A", which must be an
array of complex floating-point numbers.

"""
fft!

doc"""
    fftshift(x)

Swap the first and second halves of each dimension of "x".

    fftshift(x, dim)

Swap the first and second halves of the given dimension of array
"x".

"""
fftshift

doc"""
    fieldnames(x::DataType)

Get an array of the fields of a data type.

"""
fieldnames

doc"""
    fieldoffsets(type)

The byte offset of each field of a type relative to the data start.
For example, we could use it in the following manner to summarize
information about a struct type:

    julia> structinfo(T) = [zip(fieldoffsets(T),fieldnames(T),T.types)...];

    julia> structinfo(StatStruct)
    12-element Array{Tuple{Int64,Symbol,DataType},1}:
     (0,:device,UInt64)
     (8,:inode,UInt64)
     (16,:mode,UInt64)
     (24,:nlink,Int64)
     (32,:uid,UInt64)
     (40,:gid,UInt64)
     (48,:rdev,UInt64)
     (56,:size,Int64)
     (64,:blksize,Int64)
     (72,:blocks,Int64)
     (80,:mtime,Float64)
     (88,:ctime,Float64)

"""
fieldoffsets

doc"""
    fieldtype(type, name::Symbol | index::Int)

Determine the declared type of a field (specified by name or index)
in a composite type.

"""
fieldtype

doc"""
    filemode(file)

Equivalent to stat(file).mode

"""
filemode

doc"""
    filesize(path...)

Equivalent to stat(file).size

"""
filesize

doc"""
    fill(x, dims)

Create an array filled with the value "x". For example,
"fill(1.0, (10,10))" returns a  10x10 array of floats, with each
element initialized to 1.0.

If "x" is an object reference, all elements will refer to the
same object. "fill(Foo(), dims)" will return an array filled with
the result of evaluating "Foo()" once.

"""
fill

doc"""
    fill!(A, x)

Fill array "A" with the value "x". If "x" is an object
reference, all elements will refer to the same object. "fill!(A,
Foo())" will return "A" filled with the result of evaluating
"Foo()" once.

"""
fill!

doc"""
    filt(b, a, x[, si])

Apply filter described by vectors "a" and "b" to vector "x",
with an optional initial filter state vector "si" (defaults to
zeros).

"""
filt

doc"""
    filt!(out, b, a, x[, si])

Same as "filt()" but writes the result into the "out" argument,
which may alias the input "x" to modify it in-place.

"""
filt!

doc"""
    filter(function, collection)

Return a copy of "collection", removing elements for which
"function" is false. For associative collections, the function is
passed two arguments (key and value).

"""
filter

doc"""
    filter!(function, collection)

Update "collection", removing elements for which "function" is
false. For associative collections, the function is passed two
arguments (key and value).

"""
filter!

doc"""
    finalize(x)

Immediately run finalizers registered for object "x".

"""
finalize

doc"""
    finalizer(x, function)

Register a function "f(x)" to be called when there are no
program-accessible references to "x". The behavior of this
function is unpredictable if "x" is of a bits type.

"""
finalizer

doc"""
    find(A)

Return a vector of the linear indexes of the non-zeros in "A"
(determined by "A[i]!=0").  A common use of this is to convert a
boolean array to an array of indexes of the "true" elements.

    find(f, A)

Return a vector of the linear indexes of  "A" where "f" returns
true.

"""
find

doc"""
    findfirst(A)

Return the index of the first non-zero value in "A" (determined
by "A[i]!=0").

    findfirst(A, v)

Return the index of the first element equal to "v" in "A".

    findfirst(predicate, A)

Return the index of the first element of "A" for which
"predicate" returns true.

"""
findfirst

doc"""
    findin(a, b)

Returns the indices of elements in collection "a" that appear in
collection "b"

"""
findin

doc"""
    findlast(A)

Return the index of the last non-zero value in "A" (determined by
"A[i]!=0").

    findlast(A, v)

Return the index of the last element equal to "v" in "A".

    findlast(predicate, A)

Return the index of the last element of "A" for which
"predicate" returns true.

"""
findlast

doc"""
    findmax(itr) -> (x, index)

Returns the maximum element and its index.

    findmax(A, dims) -> (maxval, index)

For an array input, returns the value and index of the maximum over
the given dimensions.

"""
findmax

doc"""
    findmin(itr) -> (x, index)

Returns the minimum element and its index.

    findmin(A, dims) -> (minval, index)

For an array input, returns the value and index of the minimum over
the given dimensions.

"""
findmin

doc"""
    findn(A)

Return a vector of indexes for each dimension giving the locations
of the non-zeros in "A" (determined by "A[i]!=0").

"""
findn

doc"""
    findnext(A, i)

Find the next index >= "i" of a non-zero element of "A", or
"0" if not found.

    findnext(predicate, A, i)

Find the next index >= "i" of an element of "A" for which
"predicate" returns true, or "0" if not found.

    findnext(A, v, i)

Find the next index >= "i" of an element of "A" equal to "v"
(using "=="), or "0" if not found.

"""
findnext

doc"""
    findnz(A)

Return a tuple "(I, J, V)" where "I" and "J" are the row and
column indexes of the non-zero values in matrix "A", and "V" is
a vector of the non-zero values.

"""
findnz

doc"""
    findprev(A, i)

Find the previous index <= "i" of a non-zero element of "A", or
0 if not found.

    findprev(predicate, A, i)

Find the previous index <= "i" of an element of "A" for which
"predicate" returns true, or "0" if not found.

    findprev(A, v, i)

Find the previous index <= "i" of an element of "A" equal to
"v" (using "=="), or "0" if not found.

"""
findprev

doc"""
    first(coll)

Get the first element of an iterable collection. Returns the start
point of a "Range" even if it is empty.

"""
first

doc"""
    fld(x, y)

Largest integer less than or equal to "x/y".

"""
fld

doc"""
    fldmod(x, y)

The floored quotient and modulus after division. Equivalent to
"(fld(x,y), mod(x,y))".

"""
fldmod

doc"""
    flipbits!(B::BitArray{N}) -> BitArray{N}

Performs a bitwise not operation on B. See *~ operator*.

"""
flipbits!

doc"""
    flipdim(A, d)

Reverse "A" in dimension "d".

"""
flipdim

doc"""
    flipsign(x, y)

Return "x" with its sign flipped if "y" is negative. For
example "abs(x) = flipsign(x,x)".

"""
flipsign

doc"""
    float(x)

Convert a number, array, or string to a "FloatingPoint" data
type. For numeric data, the smallest suitable "FloatingPoint"
type is used. Converts strings to "Float64".

"""
float

doc"""
    floor([T], x[, digits[, base]])

"floor(x)" returns the nearest integral value of the same type as
"x" that is less than or equal to "x".

"floor(T, x)" converts the result to type "T", throwing an
"InexactError" if the value is not representable.

"digits" and "base" work as for "round()".

"""
floor

doc"""
    flush(stream)

Commit all currently buffered writes to the given stream.

"""
flush

doc"""
    fma(x, y, z)

Computes "x*y+z" without rounding the intermediate result
"x*y". On some systems this is significantly more expensive than
"x*y+z". "fma" is used to improve accuracy in certain
algorithms. See "muladd".

"""
fma

doc"""
    foldl(op, v0, itr)

Like "reduce()", but with guaranteed left associativity. "v0"
will be used exactly once.

    foldl(op, itr)

Like "foldl(op, v0, itr)", but using the first element of "itr"
as "v0". In general, this cannot be used with empty collections
(see "reduce(op, itr)").

"""
foldl

doc"""
    foldr(op, v0, itr)

Like "reduce()", but with guaranteed right associativity. "v0"
will be used exactly once.

    foldr(op, itr)

Like "foldr(op, v0, itr)", but using the last element of "itr"
as "v0". In general, this cannot be used with empty collections
(see "reduce(op, itr)").

"""
foldr

doc"""
    frexp(val)

Return "(x,exp)" such that "x" has a magnitude in the interval
"[1/2, 1)" or 0, and val = x \times 2^{exp}.

"""
frexp

doc"""
    full(S)

Convert a sparse matrix "S" into a dense matrix.

    full(F)

Reconstruct the matrix "A" from the factorization
"F=factorize(A)".

    full(QRCompactWYQ[, thin=true]) -> Matrix

Converts an orthogonal or unitary matrix stored as a
"QRCompactWYQ" object, i.e. in the compact WY format
[Bischof1987], to a dense matrix.

Optionally takes a "thin" Boolean argument, which if "true"
omits the columns that span the rows of "R" in the QR
factorization that are zero. The resulting matrix is the "Q" in a
thin QR factorization (sometimes called the reduced QR
factorization).  If "false", returns a "Q" that spans all rows
of "R" in its corresponding QR factorization.

"""
full

doc"""
    fullname(m::Module)

Get the fully-qualified name of a module as a tuple of symbols. For
example, "fullname(Base.Pkg)" gives "(:Base,:Pkg)", and
"fullname(Main)" gives "()".

"""
fullname

doc"""
    function_module(f::Function, types) -> Module

Determine the module containing a given definition of a generic
function.

"""
function_module

doc"""
    function_name(f::Function) -> Symbol

Get the name of a generic function as a symbol, or ":anonymous".

"""
function_name

doc"""
    functionloc(f::Function, types)

Returns a tuple "(filename,line)" giving the location of a method
definition.

    functionloc(m::Method)

Returns a tuple "(filename,line)" giving the location of a method
definition.

"""
functionloc

doc"""
    gamma(x)

Compute the gamma function of "x"

"""
gamma

doc"""
    gc()

Perform garbage collection. This should not generally be used.

"""
gc

doc"""
    gc_enable(on::Bool)

Control whether garbage collection is enabled using a boolean
argument (true for enabled, false for disabled). Returns previous
GC state. Disabling garbage collection should be used only with
extreme caution, as it can cause memory use to grow without bound.

"""
gc_enable

doc"""
    gcd(x, y)

Greatest common (positive) divisor (or zero if x and y are both
zero).

"""
gcd

doc"""
    gcdx(x, y)

Computes the greatest common (positive) divisor of "x" and "y"
and their Bézout coefficients, i.e. the integer coefficients "u"
and "v" that satisfy ux+vy = d = gcd(x,y).

    julia> gcdx(12, 42)
    (6,-3,1)

    julia> gcdx(240, 46)
    (2,-9,47)

Note: Bézout coefficients are *not* uniquely defined. "gcdx"
  returns the minimal Bézout coefficients that are computed by the
  extended Euclid algorithm. (Ref: D. Knuth, TAoCP, 2/e, p. 325,
  Algorithm X.) These coefficients "u" and "v" are minimal in
  the sense that |u| < |\frac y d and |v| < |\frac x d.
  Furthermore, the signs of "u" and "v" are chosen so that
  "d" is positive.

"""
gcdx

doc"""
    gensym([tag])

Generates a symbol which will not conflict with other variable
names.

"""
gensym

doc"""
    get(x)

Attempt to access the value of the "Nullable" object, "x".
Returns the value if it is present; otherwise, throws a
"NullException".

    get(x, y)

Attempt to access the value of the "Nullable{T}" object, "x".
Returns the value if it is present; otherwise, returns "convert(T,
y)".

    get(collection, key, default)

Return the value stored for the given key, or the given default
value if no mapping for the key is present.

    get(f::Function, collection, key)

Return the value stored for the given key, or if no mapping for the
key is present, return "f()".  Use "get!()" to also store the
default value in the dictionary.

This is intended to be called using "do" block syntax:

    get(dict, key) do
        # default value calculated here
             time()
    end

"""
get

doc"""
    get!(collection, key, default)

Return the value stored for the given key, or if no mapping for the
key is present, store "key => default", and return "default".

    get!(f::Function, collection, key)

Return the value stored for the given key, or if no mapping for the
key is present, store "key => f()", and return "f()".

This is intended to be called using "do" block syntax:

    get!(dict, key) do
        # default value calculated here
             time()
    end

"""
get!

doc"""
    get_bigfloat_precision()

Get the precision (in bits) currently used for BigFloat arithmetic.

"""
get_bigfloat_precision

doc"""
    get_rounding(T)

Get the current floating point rounding mode for type "T",
controlling the rounding of basic arithmetic functions ("+()",
"-()", "*()", "/()" and "sqrt()") and type conversion.

Valid modes are "RoundNearest", "RoundToZero", "RoundUp",
"RoundDown", and "RoundFromZero" ("BigFloat" only).

"""
get_rounding

doc"""
    getaddrinfo(host)

Gets the IP address of the "host" (may have to do a DNS lookup)

"""
getaddrinfo

doc"""
    getfield(value, name::Symbol)

Extract a named field from a value of composite type. The syntax
"a.b" calls "getfield(a, :b)", and the syntax "a.(b)" calls
"getfield(a, b)".

"""
getfield

doc"""
    gethostname() -> AbstractString

Get the local machine's host name.

"""
gethostname

doc"""
    getindex(type[, elements...])

Construct a 1-d array of the specified type. This is usually called
with the syntax "Type[]". Element values can be specified using
"Type[a,b,c,...]".

    getindex(A, inds...)

Returns a subset of array "A" as specified by "inds", where
each "ind" may be an "Int", a "Range", or a "Vector". See
the manual section on *array indexing* for details.

    getindex(collection, key...)

Retrieve the value(s) stored at the given key or index within a
collection. The syntax "a[i,j,...]" is converted by the compiler
to "getindex(a, i, j, ...)".

"""
getindex

doc"""
    getipaddr() -> AbstractString

Get the IP address of the local machine, as a string of the form
"x.x.x.x".

"""
getipaddr

doc"""
    getkey(collection, key, default)

Return the key matching argument "key" if one exists in
"collection", otherwise return "default".

"""
getkey

doc"""
    getpid() -> Int32

Get julia's process ID.

"""
getpid

doc"""
    gperm(file)

Like uperm but gets the permissions of the group owning the file

"""
gperm

doc"""
    gradient(F[, h])

Compute differences along vector "F", using "h" as the spacing
between points. The default spacing is one.

"""
gradient

doc"""
    graphemes(s) -> iterator over substrings of s

Returns an iterator over substrings of "s" that correspond to the
extended graphemes in the string, as defined by Unicode UAX #29.
(Roughly, these are what users would perceive as single characters,
even though they may contain more than one codepoint; for example a
letter combined with an accent mark is a single grapheme.)

"""
graphemes

doc"""
    hankelh1(nu, x)

Bessel function of the third kind of order "nu", H^{(1)}_\nu(x).

"""
hankelh1

doc"""
    hankelh1x(nu, x)

Scaled Bessel function of the third kind of order "nu",
H^{(1)}_\nu(x) e^{-x i}.

"""
hankelh1x

doc"""
    hankelh2(nu, x)

Bessel function of the third kind of order "nu", H^{(2)}_\nu(x).

"""
hankelh2

doc"""
    hankelh2x(nu, x)

Scaled Bessel function of the third kind of order "nu",
H^{(2)}_\nu(x) e^{x i}.

"""
hankelh2x

doc"""
    hash(x[, h])

Compute an integer hash code such that "isequal(x,y)" implies
"hash(x)==hash(y)". The optional second argument "h" is a hash
code to be mixed with the result.

New types should implement the 2-argument form, typically  by
calling the 2-argument "hash" method recursively in order to mix
hashes of the contents with each other (and with "h").
Typically, any type that implements "hash" should also implement
its own "==" (hence "isequal") to guarantee the property
mentioned above.

"""
hash

doc"""
    haskey(collection, key) -> Bool

Determine whether a collection has a mapping for a given key.

"""
haskey

doc"""
    hcat(A...)

Concatenate along dimension 2

"""
hcat

doc"""
    hessfact(A)

Compute the Hessenberg decomposition of "A" and return a
"Hessenberg" object. If "F" is the factorization object, the
unitary matrix can be accessed with "F[:Q]" and the Hessenberg
matrix with "F[:H]". When "Q" is extracted, the resulting type
is the "HessenbergQ" object, and may be converted to a regular
matrix with "full()".

"""
hessfact

doc"""
    hessfact!(A)

"hessfact!" is the same as "hessfact()", but saves space by
overwriting the input A, instead of creating a copy.

"""
hessfact!

doc"""
    hex(n[, pad])

Convert an integer to a hexadecimal string, optionally specifying a
number of digits to pad to.

"""
hex

doc"""
    hex2bytes(s::ASCIIString)

Convert an arbitrarily long hexadecimal string to its binary
representation. Returns an Array{UInt8, 1}, i.e. an array of bytes.

"""
hex2bytes

doc"""
    hex2num(str)

Convert a hexadecimal string to the floating point number it
represents

"""
hex2num

doc"""
    hist(v[, n]) -> e, counts

Compute the histogram of "v", optionally using approximately
"n" bins. The return values are a range "e", which correspond
to the edges of the bins, and "counts" containing the number of
elements of "v" in each bin. Note: Julia does not ignore "NaN"
values in the computation.

    hist(v, e) -> e, counts

Compute the histogram of "v" using a vector/range "e" as the
edges for the bins. The result will be a vector of length
"length(e) - 1", such that the element at location "i"
satisfies "sum(e[i] .< v .<= e[i+1])". Note: Julia does not
ignore "NaN" values in the computation.

"""
hist

doc"""
    hist!(counts, v, e) -> e, counts

Compute the histogram of "v", using a vector/range "e" as the
edges for the bins. This function writes the resultant counts to a
pre-allocated array "counts".

"""
hist!

doc"""
    hist2d(M, e1, e2) -> (edge1, edge2, counts)

Compute a "2d histogram" of a set of N points specified by N-by-2
matrix "M". Arguments "e1" and "e2" are bins for each
dimension, specified either as integer bin counts or vectors of bin
edges. The result is a tuple of "edge1" (the bin edges used in
the first dimension), "edge2" (the bin edges used in the second
dimension), and "counts", a histogram matrix of size
"(length(edge1)-1, length(edge2)-1)". Note: Julia does not ignore
"NaN" values in the computation.

"""
hist2d

doc"""
    hist2d!(counts, M, e1, e2) -> (e1, e2, counts)

Compute a "2d histogram" with respect to the bins delimited by
the edges given in "e1" and "e2". This function writes the
results to a pre-allocated array "counts".

"""
hist2d!

doc"""
    histrange(v, n)

Compute *nice* bin ranges for the edges of a histogram of "v",
using approximately "n" bins. The resulting step sizes will be 1,
2 or 5 multiplied by a power of 10. Note: Julia does not ignore
"NaN" values in the computation.

"""
histrange

doc"""
    homedir() -> AbstractString

Return the current user's home directory.

"""
homedir

doc"""
    htol(x)

Converts the endianness of a value from that used by the Host to
Little-endian.

"""
htol

doc"""
    hton(x)

Converts the endianness of a value from that used by the Host to
Network byte order (big-endian).

"""
hton

doc"""
    hvcat(rows::Tuple{Vararg{Int}}, values...)

Horizontal and vertical concatenation in one call. This function is
called for block matrix syntax. The first argument specifies the
number of arguments to concatenate in each block row. For example,
"[a b;c d e]" calls "hvcat((2,3),a,b,c,d,e)".

If the first argument is a single integer "n", then all block
rows are assumed to have "n" block columns.

"""
hvcat

doc"""
    hypot(x, y)

Compute the \sqrt{x^2+y^2} avoiding overflow and underflow

"""
hypot

doc"""
    idct(A[, dims])

Computes the multidimensional inverse discrete cosine transform
(DCT) of the array "A" (technically, a type-III DCT with the
unitary normalization). The optional "dims" argument specifies an
iterable subset of dimensions (e.g. an integer, range, tuple, or
array) to transform along.  Most efficient if the size of "A"
along the transformed dimensions is a product of small primes; see
"nextprod()".  See also "plan_idct()" for even greater
efficiency.

"""
idct

doc"""
    idct!(A[, dims])

Same as "idct!()", but operates in-place on "A".

"""
idct!

doc"""
    identity(x)

The identity function. Returns its argument.

"""
identity

doc"""
    ifelse(condition::Bool, x, y)

Return "x" if "condition" is true, otherwise return "y". This
differs from "?" or "if" in that it is an ordinary function, so
all the arguments are evaluated first. In some cases, using
"ifelse" instead of an "if" statement can eliminate the branch
in generated code and provide higher performance in tight loops.

"""
ifelse

doc"""
    ifft(A[, dims])

Multidimensional inverse FFT.

A one-dimensional inverse FFT computes

    \operatorname{IDFT}(A)[k] =
    \frac{1}{\operatorname{length}(A)}
    \sum_{n=1}^{\operatorname{length}(A)}
    \exp\left(+i\frac{2\pi (n-1)(k-1)}
    {\operatorname{length}(A)} \right) A[n].

A multidimensional inverse FFT simply performs this operation along
each transformed dimension of "A".

"""
ifft

doc"""
    ifft!(A[, dims])

Same as "ifft()", but operates in-place on "A".

"""
ifft!

doc"""
    ifftshift(x[, dim])

Undoes the effect of "fftshift".

"""
ifftshift

doc"""
    ignorestatus(command)

Mark a command object so that running it will not throw an error if
the result code is non-zero.

"""
ignorestatus

doc"""
    im

The imaginary unit

"""
im

doc"""
    imag(z)

Return the imaginary part of the complex number "z"

"""
imag

doc"""
    include(path::AbstractString)

Evaluate the contents of a source file in the current context.
During including, a task-local include path is set to the directory
containing the file. Nested calls to "include" will search
relative to that path. All paths refer to files on node 1 when
running in parallel, and files will be fetched from node 1. This
function is typically used to load source interactively, or to
combine files in packages that are broken into multiple source
files.

"""
include

doc"""
    include_string(code::AbstractString)

Like "include", except reads code from the given string rather
than from a file. Since there is no file path involved, no path
processing or fetching from node 1 is done.

"""
include_string

doc"""
    ind2chr(string, i)

Convert a byte index to a character index

"""
ind2chr

doc"""
    ind2sub(dims, index) -> subscripts

Returns a tuple of subscripts into an array with dimensions
"dims", corresponding to the linear index "index"

**Example** "i, j, ... = ind2sub(size(A), indmax(A))" provides
the indices of the maximum element

    ind2sub(a, index) -> subscripts

Returns a tuple of subscripts into array "a" corresponding to the
linear index "index"

"""
ind2sub

doc"""
    indexin(a, b)

Returns a vector containing the highest index in "b" for each
value in "a" that is a member of "b" . The output vector
contains 0 wherever "a" is not a member of "b".

"""
indexin

doc"""
    indexpids(S::SharedArray)

Returns the index of the current worker into the "pids" vector,
i.e., the list of workers mapping the SharedArray

"""
indexpids

doc"""
    indmax(itr) -> Integer

Returns the index of the maximum element in a collection.

"""
indmax

doc"""
    indmin(itr) -> Integer

Returns the index of the minimum element in a collection.

"""
indmin

doc"""
    inf(f)

Returns positive infinity of the floating point type "f" or of
the same floating point type as "f"

"""
inf

doc"""
    info(msg)

Display an informational message.

"""
info

doc"""
    init_worker(manager::FooManager)

Called by cluster managers implementing custom transports. It
initializes a newly launched process as a worker. Command line
argument "--worker" has the effect of initializing a process as a
worker using TCP/IP sockets for transport.

"""
init_worker

doc"""
    insert!(collection, index, item)

Insert an "item" into "collection" at the given "index".
"index" is the index of "item" in the resulting "collection".

    julia> insert!([6, 5, 4, 2, 1], 4, 3)
    6-element Array{Int64,1}:
     6
     5
     4
     3
     2
     1

"""
insert!

doc"""
    instances(T::Type)

Return a collection of all instances of the given type, if
applicable. Mostly used for enumerated types (see "@enum").

"""
instances

doc"""
    interrupt([pids...])

Interrupt the current executing task on the specified workers. This
is equivalent to pressing Ctrl-C on the local machine. If no
arguments are given, all workers are interrupted.

"""
interrupt

doc"""
    intersect(s1, s2...)
∩(s1, s2)

Construct the intersection of two or more sets. Maintains order and
multiplicity of the first argument for arrays and ranges.

"""
intersect

doc"""
    intersect!(s1, s2)

Intersects sets "s1" and "s2" and overwrites the set "s1"
with the result. If needed, "s1" will be expanded to the size of
"s2".

"""
intersect!

doc"""
    inv(M)

Matrix inverse

"""
inv

doc"""
    invdigamma(x)

Compute the inverse digamma function of "x".

"""
invdigamma

doc"""
    invmod(x, m)

Take the inverse of "x" modulo "m": "y" such that xy = 1
\pmod m

"""
invmod

doc"""
    invoke(f, (types...), args...)

Invoke a method for the given generic function matching the
specified types (as a tuple), on the specified arguments. The
arguments must be compatible with the specified types. This allows
invoking a method other than the most specific matching method,
which is useful when the behavior of a more general definition is
explicitly needed (often as part of the implementation of a more
specific method of the same function).

"""
invoke

doc"""
    invperm(v)

Return the inverse permutation of v.

"""
invperm

doc"""
    ipermute!(v, p)

Like permute!, but the inverse of the given permutation is applied.

"""
ipermute!

doc"""
    ipermutedims(A, perm)

Like "permutedims()", except the inverse of the given permutation
is applied.

"""
ipermutedims

doc"""
    irfft(A, d[, dims])

Inverse of "rfft()": for a complex array "A", gives the
corresponding real array whose FFT yields "A" in the first half.
As for "rfft()", "dims" is an optional subset of dimensions to
transform, defaulting to "1:ndims(A)".

"d" is the length of the transformed real array along the
"dims[1]" dimension, which must satisfy "d ==
floor(size(A,dims[1])/2)+1". (This parameter cannot be inferred
from "size(A)" due to the possibility of rounding by the
"floor" function here.)

"""
irfft

doc"""
    is(x, y) -> Bool
===(x, y) -> Bool
≡(x, y) -> Bool

Determine whether "x" and "y" are identical, in the sense that
no program could distinguish them. Compares mutable objects by
address in memory, and compares immutable objects (such as numbers)
by contents at the bit level. This function is sometimes called
"egal".

"""
is

doc"""
    is_assigned_char(c) -> Bool

Returns true if the given char or integer is an assigned Unicode
code point.

"""
is_assigned_char

doc"""
    isa(x, type) -> Bool

Determine whether "x" is of the given "type".

"""
isa

doc"""
    isabspath(path::AbstractString) -> Bool

Determines whether a path is absolute (begins at the root
directory).

"""
isabspath

doc"""
    isalnum(c::Union{Char, AbstractString}) -> Bool

Tests whether a character is alphanumeric, or whether this is true
for all elements of a string.  A character is classified as
alphabetic if it belongs to the Unicode general category Letter or
Number, i.e. a character whose category code begins with 'L' or
'N'.

"""
isalnum

doc"""
    isalpha(c::Union{Char, AbstractString}) -> Bool

Tests whether a character is alphabetic, or whether this is true
for all elements of a string. A character is classified as
alphabetic if it belongs to the Unicode general category Letter,
i.e. a character whose category code begins with 'L'.

"""
isalpha

doc"""
    isapprox(x::Number, y::Number; rtol::Real=cbrt(maxeps), atol::Real=sqrt(maxeps))

Inexact equality comparison - behaves slightly different depending
on types of input args:

* For "FloatingPoint" numbers, "isapprox" returns "true" if
  "abs(x-y) <= atol + rtol*max(abs(x), abs(y))".

* For "Integer" and "Rational" numbers, "isapprox" returns
  "true" if "abs(x-y) <= atol". The *rtol* argument is ignored.
  If one of "x" and "y" is "FloatingPoint", the other is
  promoted, and the method above is called instead.

* For "Complex" numbers, the distance in the complex plane is
  compared, using the same criterion as above.

For default tolerance arguments, "maxeps = max(eps(abs(x)),
eps(abs(y)))".

"""
isapprox

doc"""
    isascii(c::Union{Char, AbstractString}) -> Bool

Tests whether a character belongs to the ASCII character set, or
whether this is true for all elements of a string.

"""
isascii

doc"""
    isbits(T)

True if "T" is a "plain data" type, meaning it is immutable and
contains no references to other values. Typical examples are
numeric types such as "UInt8", "Float64", and
"Complex{Float64}".

    julia> isbits(Complex{Float64})
    true

    julia> isbits(Complex)
    false

"""
isbits

doc"""
    isblockdev(path) -> Bool

Returns "true" if "path" is a block device, "false"
otherwise.

"""
isblockdev

doc"""
    ischardev(path) -> Bool

Returns "true" if "path" is a character device, "false"
otherwise.

"""
ischardev

doc"""
    iscntrl(c::Union{Char, AbstractString}) -> Bool

Tests whether a character is a control character, or whether this
is true for all elements of a string.  Control characters are the
non-printing characters of the Latin-1 subset of Unicode.

"""
iscntrl

doc"""
    isconst([m::Module], s::Symbol) -> Bool

Determine whether a global is declared "const" in a given module.
The default module argument is "current_module()".

"""
isconst

doc"""
    isdefined([object], index | symbol)

Tests whether an assignable location is defined. The arguments can
be an array and index, a composite object and field name (as a
symbol), or a module and a symbol. With a single symbol argument,
tests whether a global variable with that name is defined in
"current_module()".

"""
isdefined

doc"""
    isdiag(A) -> Bool

Test whether a matrix is diagonal.

"""
isdiag

doc"""
    isdigit(c::Union{Char, AbstractString}) -> Bool

Tests whether a character is a numeric digit (0-9), or whether this
is true for all elements of a string.

"""
isdigit

doc"""
    isdir(path) -> Bool

Returns "true" if "path" is a directory, "false" otherwise.

"""
isdir

doc"""
    isdirpath(path::AbstractString) -> Bool

Determines whether a path refers to a directory (for example, ends
with a path separator).

"""
isdirpath

doc"""
    iseltype(A, T)

Tests whether A or its elements are of type T

"""
iseltype

doc"""
    isempty(collection) -> Bool

Determine whether a collection is empty (has no elements).

    julia> isempty([])
    true

    julia> isempty([1 2 3])
    false

"""
isempty

doc"""
    isequal(x, y)

Similar to "==", except treats all floating-point "NaN" values
as equal to each other, and treats "-0.0" as unequal to "0.0".
The default implementation of "isequal" calls "==", so if you
have a type that doesn't have these floating-point subtleties then
you probably only need to define "==".

"isequal" is the comparison function used by hash tables
("Dict"). "isequal(x,y)" must imply that "hash(x) ==
hash(y)".

This typically means that if you define your own "==" function
then you must define a corresponding "hash" (and vice versa).
Collections typically implement "isequal" by calling "isequal"
recursively on all contents.

Scalar types generally do not need to implement "isequal"
separate from "==", unless they represent floating-point numbers
amenable to a more efficient implementation than that provided as a
generic fallback (based on "isnan", "signbit", and "==").

"""
isequal

doc"""
    iseven(x::Integer) -> Bool

Returns "true" is "x" is even (that is, divisible by 2), and
"false" otherwise.

    julia> iseven(9)
    false

    julia> iseven(10)
    true

"""
iseven

doc"""
    isexecutable(path) -> Bool

Returns "true" if the current user has permission to execute
"path", "false" otherwise.

"""
isexecutable

doc"""
    isfifo(path) -> Bool

Returns "true" if "path" is a FIFO, "false" otherwise.

"""
isfifo

doc"""
    isfile(path) -> Bool

Returns "true" if "path" is a regular file, "false"
otherwise.

"""
isfile

doc"""
    isfinite(f) -> Bool

Test whether a number is finite

"""
isfinite

doc"""
    isgeneric(f::Function) -> Bool

Determine whether a function is generic.

"""
isgeneric

doc"""
    isgraph(c::Union{Char, AbstractString}) -> Bool

Tests whether a character is printable, and not a space, or whether
this is true for all elements of a string.  Any character that
would cause a printer to use ink should be classified with
isgraph(c)==true.

"""
isgraph

doc"""
    ishermitian(A) -> Bool

Test whether a matrix is Hermitian.

"""
ishermitian

doc"""
    isimmutable(v)

True if value "v" is immutable.  See *Immutable Composite Types*
for a discussion of immutability. Note that this function works on
values, so if you give it a type, it will tell you that a value of
"DataType" is mutable.

"""
isimmutable

doc"""
    isinf(f) -> Bool

Test whether a number is infinite

"""
isinf

doc"""
    isinteger(x) -> Bool

Test whether "x" or all its elements are numerically equal to
some integer

"""
isinteger

doc"""
    isinteractive() -> Bool

Determine whether Julia is running an interactive session.

"""
isinteractive

doc"""
    isleaftype(T)

Determine whether "T" is a concrete type that can have instances,
meaning its only subtypes are itself and "None" (but "T" itself
is not "None").

"""
isleaftype

doc"""
    isless(x, y)

Test whether "x" is less than "y", according to a canonical
total order. Values that are normally unordered, such as "NaN",
are ordered in an arbitrary but consistent fashion. This is the
default comparison used by "sort". Non-numeric types with a
canonical total order should implement this function. Numeric types
only need to implement it if they have special values such as
"NaN".

"""
isless

doc"""
    islink(path) -> Bool

Returns "true" if "path" is a symbolic link, "false"
otherwise.

"""
islink

doc"""
    islower(c::Union{Char, AbstractString}) -> Bool

Tests whether a character is a lowercase letter, or whether this is
true for all elements of a string.  A character is classified as
lowercase if it belongs to Unicode category Ll, Letter: Lowercase.

"""
islower

doc"""
    ismarked(s)

Returns true if stream "s" is marked.

See also "mark()", "unmark()", "reset()"

"""
ismarked

doc"""
    ismatch(r::Regex, s::AbstractString) -> Bool

Test whether a string contains a match of the given regular
expression.

"""
ismatch

doc"""
    ismount(path) -> Bool

Returns "true" if "path" is a mount point, "false" otherwise.

"""
ismount

doc"""
    isnan(f) -> Bool

Test whether a floating point number is not a number (NaN)

"""
isnan

doc"""
    isnull(x)

Is the "Nullable" object "x" null, i.e. missing a value?

"""
isnull

doc"""
    isnumber(c::Union{Char, AbstractString}) -> Bool

Tests whether a character is numeric, or whether this is true for
all elements of a string.   A character is classified as numeric if
it belongs to the Unicode general category Number, i.e. a character
whose category code begins with 'N'.

"""
isnumber

doc"""
    isodd(x::Integer) -> Bool

Returns "true" if "x" is odd (that is, not divisible by 2), and
"false" otherwise.

    julia> isodd(9)
    true

    julia> isodd(10)
    false

"""
isodd

doc"""
    isopen(stream) -> Bool

Determine whether a stream is open (i.e. has not been closed yet).
If the connection has been closed remotely (in case of e.g. a
socket), "isopen" will return "false" even though buffered data
may still be available. Use "eof" to check if necessary.

"""
isopen

doc"""
    ispath(path) -> Bool

Returns "true" if "path" is a valid filesystem path, "false"
otherwise.

"""
ispath

doc"""
    isperm(v) -> Bool

Returns true if v is a valid permutation.

"""
isperm

doc"""
    isposdef(A) -> Bool

Test whether a matrix is positive definite.

"""
isposdef

doc"""
    isposdef!(A) -> Bool

Test whether a matrix is positive definite, overwriting "A" in
the processes.

"""
isposdef!

doc"""
    ispow2(n) -> Bool

Test whether "n" is a power of two

"""
ispow2

doc"""
    isprime(x::Integer) -> Bool

Returns "true" if "x" is prime, and "false" otherwise.

    julia> isprime(3)
    true

    isprime(x::BigInt[, reps = 25]) -> Bool

Probabilistic primality test. Returns "true" if "x" is prime;
and "false" if "x" is not prime with high probability. The
false positive rate is about "0.25^reps". "reps = 25" is
considered safe for cryptographic applications (Knuth,
Seminumerical Algorithms).

    julia> isprime(big(3))
    true

"""
isprime

doc"""
    isprint(c::Union{Char, AbstractString}) -> Bool

Tests whether a character is printable, including spaces, but not a
control character. For strings, tests whether this is true for all
elements of the string.

"""
isprint

doc"""
    ispunct(c::Union{Char, AbstractString}) -> Bool

Tests whether a character belongs to the Unicode general category
Punctuation, i.e. a character whose category code begins with 'P'.
For strings, tests whether this is true for all elements of the
string.

"""
ispunct

doc"""
    isqrt(n)

Integer square root: the largest integer "m" such that "m*m <=
n".

"""
isqrt

doc"""
    isreadable(path) -> Bool

Returns "true" if the current user has permission to read
"path", "false" otherwise.

"""
isreadable

doc"""
    isreadonly(stream) -> Bool

Determine whether a stream is read-only.

"""
isreadonly

doc"""
    isready(r::RemoteRef)

Determine whether a "RemoteRef" has a value stored to it. Note
that this function can cause race conditions, since by the time you
receive its result it may no longer be true. It is recommended that
this function only be used on a "RemoteRef" that is assigned
once.

If the argument "RemoteRef" is owned by a different node, this
call will block to wait for the answer. It is recommended to wait
for "r" in a separate task instead, or to use a local
"RemoteRef" as a proxy:

    rr = RemoteRef()
    @async put!(rr, remotecall_fetch(p, long_computation))
    isready(rr)  # will not block

"""
isready

doc"""
    isreal(x) -> Bool

Test whether "x" or all its elements are numerically equal to
some real number

"""
isreal

doc"""
    issetgid(path) -> Bool

Returns "true" if "path" has the setgid flag set, "false"
otherwise.

"""
issetgid

doc"""
    issetuid(path) -> Bool

Returns "true" if "path" has the setuid flag set, "false"
otherwise.

"""
issetuid

doc"""
    issocket(path) -> Bool

Returns "true" if "path" is a socket, "false" otherwise.

"""
issocket

doc"""
    issorted(v, [by=<transform>,] [lt=<comparison>,] [rev=false])

Test whether a vector is in sorted order. The "by", "lt" and
"rev" keywords modify what order is considered to be sorted just
as they do for "sort".

"""
issorted

doc"""
    isspace(c::Union{Char, AbstractString}) -> Bool

Tests whether a character is any whitespace character.  Includes
ASCII characters '\t', '\n', '\v', '\f', '\r', and ' ',
Latin-1 character U+0085, and characters in Unicode category Zs.
For strings, tests whether this    is true for all elements of the
string.

"""
isspace

doc"""
    issparse(S)

Returns "true" if "S" is sparse, and "false" otherwise.

"""
issparse

doc"""
    issticky(path) -> Bool

Returns "true" if "path" has the sticky bit set, "false"
otherwise.

"""
issticky

doc"""
    issubnormal(f) -> Bool

Test whether a floating point number is subnormal

"""
issubnormal

doc"""
    issubset(a, b)
⊆(A, S) -> Bool
⊈(A, S) -> Bool
⊊(A, S) -> Bool

Determine whether every element of "a" is also in "b", using
"in()".

    issubset(A, S) -> Bool
⊆(A, S) -> Bool

True if A is a subset of or equal to S.

"""
issubset

doc"""
    issubtype(type1, type2)

True if and only if all values of "type1" are also of "type2".
Can also be written using the "<:" infix operator as "type1 <:
type2".

"""
issubtype

doc"""
    issym(A) -> Bool

Test whether a matrix is symmetric.

"""
issym

doc"""
    istaskdone(task) -> Bool

Tell whether a task has exited.

"""
istaskdone

doc"""
    istaskstarted(task) -> Bool

Tell whether a task has started executing.

"""
istaskstarted

doc"""
    istext(m::MIME)

Determine whether a MIME type is text data.

"""
istext

doc"""
    istril(A) -> Bool

Test whether a matrix is lower triangular.

"""
istril

doc"""
    istriu(A) -> Bool

Test whether a matrix is upper triangular.

"""
istriu

doc"""
    isupper(c::Union{Char, AbstractString}) -> Bool

Tests whether a character is an uppercase letter, or whether this
is true for all elements of a string.    A character is classified
as uppercase if it belongs to Unicode category Lu, Letter:
Uppercase, or Lt, Letter: Titlecase.

"""
isupper

doc"""
    isvalid(value) -> Bool

Returns true if the given value is valid for its type, which
currently can be one of "Char", "ASCIIString", "UTF8String",
"UTF16String", or "UTF32String"

    isvalid(T, value) -> Bool

Returns true if the given value is valid for that type. Types
currently can be "Char", "ASCIIString", "UTF8String",
"UTF16String", or "UTF32String" Values for "Char" can be of
type "Char" or "UInt32" Values for "ASCIIString" and
"UTF8String" can be of that type, or "Vector{UInt8}" Values for
"UTF16String" can be "UTF16String" or "Vector{UInt16}" Values
for "UTF32String" can be "UTF32String", "Vector{Char}" or
"Vector{UInt32}"

    isvalid(str, i)

Tells whether index "i" is valid for the given string

"""
isvalid

doc"""
    iswritable(path) -> Bool

Returns "true" if the current user has permission to write to
"path", "false" otherwise.

"""
iswritable

doc"""
    isxdigit(c::Union{Char, AbstractString}) -> Bool

Tests whether a character is a valid hexadecimal digit, or whether
this is true for all elements of a string.

"""
isxdigit

doc"""
    join(strings, delim[, last])

Join an array of "strings" into a single string, inserting the
given delimiter between adjacent strings. If "last" is given, it
will be used instead of "delim" between the last two strings. For
example, "join(["apples", "bananas", "pineapples"], ", ",
" and ") == "apples, bananas and pineapples"".

"strings" can be any iterable over elements "x" which are
convertible to strings via "print(io::IOBuffer, x)".

"""
join

doc"""
    joinpath(parts...) -> AbstractString

Join path components into a full path. If some argument is an
absolute path, then prior components are dropped.

"""
joinpath

doc"""
    keys(collection)

Return an iterator over all keys in a collection.
"collect(keys(d))" returns an array of keys.

"""
keys

doc"""
    kill(p::Process, signum=SIGTERM)

Send a signal to a process. The default is to terminate the
process.

    kill(manager::FooManager, pid::Int, config::WorkerConfig)

Implemented by cluster managers. It is called on the master
process, by "rmprocs". It should cause the remote worker
specified by "pid" to exit.
"Base.kill(manager::ClusterManager.....)" executes a remote
"exit()" on "pid"

"""
kill

doc"""
    kron(A, B)

Kronecker tensor product of two vectors or two matrices.

"""
kron

doc"""
    last(coll)

Get the last element of an ordered collection, if it can be
computed in O(1) time. This is accomplished by calling "endof()"
to get the last index. Returns the end point of a "Range" even if
it is empty.

"""
last

doc"""
    launch(manager::FooManager, params::Dict, launched::Vector{WorkerConfig}, launch_ntfy::Condition)

Implemented by cluster managers. For every Julia worker launched by
this function, it should append a "WorkerConfig" entry to
"launched" and notify "launch_ntfy". The function MUST exit
once all workers, requested by "manager" have been launched.
"params" is a dictionary of all keyword arguments "addprocs"
was called with.

"""
launch

doc"""
    lbeta(x, y)

Natural logarithm of the absolute value of the beta function
\log(|\operatorname{B}(x,y)|).

"""
lbeta

doc"""
    lcfirst(string)

Returns "string" with the first character converted to lowercase.

"""
lcfirst

doc"""
    lcm(x, y)

Least common (non-negative) multiple.

"""
lcm

doc"""
    ldexp(x, n)

Compute x \times 2^n

"""
ldexp

doc"""
    ldltfact(A) -> LDLtFactorization

Compute a factorization of a positive definite matrix "A" such
that "A=L*Diagonal(d)*L'" where "L" is a unit lower triangular
matrix and "d" is a vector with non-negative elements.

    ldltfact(A; shift=0, perm=Int[]) -> CHOLMOD.Factor

Compute the LDLt factorization of a sparse symmetric or Hermitian
matrix "A". A fill-reducing permutation is used.  "F =
ldltfact(A)" is most frequently used to solve systems of equations
with "F\b", but also the methods "diag", "det", "logdet"
are defined for "F". You can also extract individual factors from
"F", using "F[:L]".  However, since pivoting is on by default,
the factorization is internally represented as "A == P'*L*D*L'*P"
with a permutation matrix "P"; using just "L" without
accounting for "P" will give incorrect answers.  To include the
effects of permutation, it's typically preferable to extact
"combined" factors like "PtL = F[:PtL]" (the equivalent of
"P'*L") and "LtP = F[:UP]" (the equivalent of "L'*P").  The
complete list of supported factors is ":L, :PtL, :D, :UP, :U, :LD,
:DU, :PtLD, :DUP".

Setting optional "shift" keyword argument computes the
factorization of "A+shift*I" instead of "A".  If the "perm"
argument is nonempty, it should be a permutation of *1:size(A,1)*
giving the ordering to use (instead of CHOLMOD's default AMD
ordering).

The function calls the C library CHOLMOD and many other functions
from the library are wrapped but not exported.

"""
ldltfact

doc"""
    leading_ones(x::Integer) -> Integer

Number of ones leading the binary representation of "x".

    julia> leading_ones(UInt32(2 ^ 32 - 2))
    31

"""
leading_ones

doc"""
    leading_zeros(x::Integer) -> Integer

Number of zeros leading the binary representation of "x".

    julia> leading_zeros(Int32(1))
    31

"""
leading_zeros

doc"""
    length(A) -> Integer

Returns the number of elements in A

    length(collection) -> Integer

For ordered, indexable collections, the maximum index "i" for
which "getindex(collection, i)" is valid. For unordered
collections, the number of elements.

    length(s)

The number of characters in string "s".

"""
length

doc"""
    less(file::AbstractString[, line])

Show a file using the default pager, optionally providing a
starting line number. Returns to the julia prompt when you quit the
pager.

    less(function[, types])

Show the definition of a function using the default pager,
optionally specifying a tuple of types to indicate which method to
see.

"""
less

doc"""
    lexcmp(x, y)

Compare "x" and "y" lexicographically and return -1, 0, or 1
depending on whether "x" is less than, equal to, or greater than
"y", respectively. This function should be defined for
lexicographically comparable types, and "lexless" will call
"lexcmp" by default.

"""
lexcmp

doc"""
    lexless(x, y)

Determine whether "x" is lexicographically less than "y".

"""
lexless

doc"""
    lfact(x)

Compute the logarithmic factorial of "x"

"""
lfact

doc"""
    lgamma(x)

Compute the logarithm of the absolute value of "gamma()" for
"Real" "x", while for "Complex" "x" it computes the
logarithm of "gamma(x)".

"""
lgamma

doc"""
    linreg(x, y) -> [a; b]

Linear Regression. Returns "a" and "b" such that "a+b*x" is
the closest line to the given points "(x,y)". In other words,
this function determines parameters "[a, b]" that minimize the
squared error between "y" and "a+b*x".

**Example**:

    using PyPlot;
    x = float([1:12])
    y = [5.5; 6.3; 7.6; 8.8; 10.9; 11.79; 13.48; 15.02; 17.77; 20.81; 22.0; 22.99]
    a, b = linreg(x,y) # Linear regression
    plot(x, y, "o") # Plot (x,y) points
    plot(x, [a+b*i for i in x]) # Plot the line determined by the linear regression

    linreg(x, y, w)

Weighted least-squares linear regression.

"""
linreg

doc"""
    linspace(start, stop, n=100)

Construct a range of "n" linearly spaced elements from "start"
to "stop".

"""
linspace

doc"""
    listen([addr], port) -> TcpServer

Listen on port on the address specified by "addr". By default
this listens on localhost only. To listen on all interfaces pass,
"IPv4(0)" or "IPv6(0)" as appropriate.

    listen(path) -> PipeServer

Listens on/Creates a Named Pipe/Domain Socket

"""
listen

doc"""
    listenany(port_hint) -> (UInt16, TcpServer)

Create a TcpServer on any port, using hint as a starting point.
Returns a tuple of the actual port that the server was created on
and the server itself.

"""
listenany

doc"""
    lock(l::ReentrantLock)

Associates "l" with the current task. If "l" is already locked
by a different task, waits for it to become available. The same
task can acquire the lock multiple times. Each "lock" must be
matched by an "unlock"

"""
lock

doc"""
    log(x)

Compute the natural logarithm of "x". Throws "DomainError" for
negative "Real" arguments. Use complex negative arguments to
obtain complex results.

There is an experimental variant in the "Base.Math.JuliaLibm"
module, which is typically faster and more accurate.

    log(b, x)

Compute the base "b" logarithm of "x". Throws "DomainError"
for negative "Real" arguments.

"""
log

doc"""
    log10(x)

Compute the logarithm of "x" to base 10. Throws "DomainError"
for negative "Real" arguments.

"""
log10

doc"""
    log1p(x)

Accurate natural logarithm of "1+x".  Throws "DomainError" for
"Real" arguments less than -1.

There is an experimental variant in the "Base.Math.JuliaLibm"
module, which is typically faster and more accurate.

"""
log1p

doc"""
    log2(x)

Compute the logarithm of "x" to base 2. Throws "DomainError"
for negative "Real" arguments.

"""
log2

doc"""
    logabsdet(M)

Log of absolute value of determinant of real matrix. Equivalent to
"(log(abs(det(M))), sign(det(M)))", but may provide increased
accuracy and/or speed.

"""
logabsdet

doc"""
    logdet(M)

Log of matrix determinant. Equivalent to "log(det(M))", but may
provide increased accuracy and/or speed.

"""
logdet

doc"""
    logspace(start, stop, n=50)

Construct a vector of "n" logarithmically spaced numbers from
"10^start" to "10^stop".

"""
logspace

doc"""
    lowercase(string)

Returns "string" with all characters converted to lowercase.

"""
lowercase

doc"""
    lpad(string, n, p)

Make a string at least "n" columns wide when printed, by padding
on the left with copies of "p".

"""
lpad

doc"""
    lstat(file)

Like stat, but for symbolic links gets the info for the link itself
rather than the file it refers to. This function must be called on
a file path rather than a file object or a file descriptor.

"""
lstat

doc"""
    lstrip(string[, chars])

Return "string" with any leading whitespace removed. If "chars"
(a character, or vector or set of characters) is provided, instead
remove characters contained in it.

"""
lstrip

doc"""
    ltoh(x)

Converts the endianness of a value from Little-endian to that used
by the Host.

"""
ltoh

doc"""
    lu(A) -> L, U, p

Compute the LU factorization of "A", such that "A[p,:] = L*U".

"""
lu

doc"""
    lufact(A[, pivot=Val{true}]) -> F

Compute the LU factorization of "A". The return type of "F"
depends on the type of "A". In most cases, if "A" is a subtype
"S" of AbstractMatrix with an element type "T`" supporting
"+", "-", "*" and "/" the return type is "LU{T,S{T}}". If
pivoting is chosen (default) the element type should also support
"abs" and "<". When "A" is sparse and have element of type
"Float32", "Float64", "Complex{Float32}", or
"Complex{Float64}" the return type is "UmfpackLU". Some
examples are shown in the table below.

    +-------------------------+---------------------------+----------------------------------------------+
    | Type of input \"A\"     | Type of output \"F\"      | Relationship between \"F\" and \"A\"         |
    +-------------------------+---------------------------+----------------------------------------------+
    | \"Matrix()\"            | \"LU\"                    | \"F[:L]*F[:U] == A[F[:p], :]\"               |
    +-------------------------+---------------------------+----------------------------------------------+
    | \"Tridiagonal()\"       | \"LU{T,Tridiagonal{T}}\"  | N/A                                          |
    +-------------------------+---------------------------+----------------------------------------------+
    | \"SparseMatrixCSC()\"   | \"UmfpackLU\"             | \"F[:L]*F[:U] == F[:Rs] .* A[F[:p], F[:q]]\" |
    +-------------------------+---------------------------+----------------------------------------------+

The individual components of the factorization "F" can be
accessed by indexing:

    +-------------+-----------------------------------------+--------+--------------------------+---------------+
    | Component   | Description                             | \"LU\" | \"LU{T,Tridiagonal{T}}\" | \"UmfpackLU\" |
    +-------------+-----------------------------------------+--------+--------------------------+---------------+
    | \"F[:L]\"   | \"L\" (lower triangular) part of \"LU\" | ✓      |                          | ✓             |
    +-------------+-----------------------------------------+--------+--------------------------+---------------+
    | \"F[:U]\"   | \"U\" (upper triangular) part of \"LU\" | ✓      |                          | ✓             |
    +-------------+-----------------------------------------+--------+--------------------------+---------------+
    | \"F[:p]\"   | (right) permutation \"Vector\"          | ✓      |                          | ✓             |
    +-------------+-----------------------------------------+--------+--------------------------+---------------+
    | \"F[:P]\"   | (right) permutation \"Matrix\"          | ✓      |                          |               |
    +-------------+-----------------------------------------+--------+--------------------------+---------------+
    | \"F[:q]\"   | left permutation \"Vector\"             |        |                          | ✓             |
    +-------------+-----------------------------------------+--------+--------------------------+---------------+
    | \"F[:Rs]\"  | \"Vector\" of scaling factors           |        |                          | ✓             |
    +-------------+-----------------------------------------+--------+--------------------------+---------------+
    | \"F[:(:)]\" | \"(L,U,p,q,Rs)\" components             |        |                          | ✓             |
    +-------------+-----------------------------------------+--------+--------------------------+---------------+

    +--------------------+--------+--------------------------+---------------+
    | Supported function | \"LU\" | \"LU{T,Tridiagonal{T}}\" | \"UmfpackLU\" |
    +--------------------+--------+--------------------------+---------------+
    | \"/\"              | ✓      |                          |               |
    +--------------------+--------+--------------------------+---------------+
    | \"\\\"             | ✓      | ✓                        | ✓             |
    +--------------------+--------+--------------------------+---------------+
    | \"cond\"           | ✓      |                          | ✓             |
    +--------------------+--------+--------------------------+---------------+
    | \"det\"            | ✓      | ✓                        | ✓             |
    +--------------------+--------+--------------------------+---------------+
    | \"logdet\"         | ✓      | ✓                        |               |
    +--------------------+--------+--------------------------+---------------+
    | \"logabsdet\"      | ✓      | ✓                        |               |
    +--------------------+--------+--------------------------+---------------+
    | \"size\"           | ✓      | ✓                        |               |
    +--------------------+--------+--------------------------+---------------+

"""
lufact

doc"""
    lufact!(A) -> LU

"lufact!" is the same as "lufact()", but saves space by
overwriting the input A, instead of creating a copy.  For sparse
"A" the "nzval" field is not overwritten but the index fields,
"colptr" and "rowval" are decremented in place, converting from
1-based indices to 0-based indices.

"""
lufact!

doc"""
    lyap(A, C)

Computes the solution "X" to the continuous Lyapunov equation
"AX + XA' + C = 0", where no eigenvalue of "A" has a zero real
part and no two eigenvalues are negative complex conjugates of each
other.

"""
lyap

doc"""
    macroexpand(x)

Takes the expression x and returns an equivalent expression with
all macros removed (expanded).

"""
macroexpand

doc"""
    manage(manager::FooManager, pid::Int, config::WorkerConfig. op::Symbol)

Implemented by cluster managers. It is called on the master
process, during a worker's lifetime, with appropriate "op"
values:

* with ":register"/":deregister" when a worker is added /
  removed from the Julia worker pool.

* with ":interrupt" when "interrupt(workers)" is called.
  The "ClusterManager" should signal the appropriate worker
  with an interrupt signal.

* with ":finalize" for cleanup purposes.

"""
manage

doc"""
    map(f, c...) -> collection

Transform collection "c" by applying "f" to each element. For
multiple collection arguments, apply "f" elementwise.

    julia> map((x) -> x * 2, [1, 2, 3])
    3-element Array{Int64,1}:
     2
     4
     6

    julia> map(+, [1, 2, 3], [10, 20, 30])
    3-element Array{Int64,1}:
     11
     22
     33

"""
map

doc"""
    map!(function, collection)

In-place version of "map()".

    map!(function, destination, collection...)

Like "map()", but stores the result in "destination" rather
than a new collection. "destination" must be at least as large as
the first collection.

"""
map!

doc"""
    mapfoldl(f, op, v0, itr)

Like "mapreduce()", but with guaranteed left associativity.
"v0" will be used exactly once.

    mapfoldl(f, op, itr)

Like "mapfoldl(f, op, v0, itr)", but using the first element of
"itr" as "v0". In general, this cannot be used with empty
collections (see "reduce(op, itr)").

"""
mapfoldl

doc"""
    mapfoldr(f, op, v0, itr)

Like "mapreduce()", but with guaranteed right associativity.
"v0" will be used exactly once.

    mapfoldr(f, op, itr)

Like "mapfoldr(f, op, v0, itr)", but using the first element of
"itr" as "v0". In general, this cannot be used with empty
collections (see "reduce(op, itr)").

"""
mapfoldr

doc"""
    mapreduce(f, op, v0, itr)

Apply function "f" to each element in "itr", and then reduce
the result using the binary function "op". "v0" must be a
neutral element for "op" that will be returned for empty
collections. It is unspecified whether "v0" is used for non-empty
collections.

"mapreduce()" is functionally equivalent to calling "reduce(op,
v0, map(f, itr))", but will in general execute faster since no
intermediate collection needs to be created. See documentation for
"reduce()" and "map()".

    julia> mapreduce(x->x^2, +, [1:3;]) # == 1 + 4 + 9
    14

The associativity of the reduction is implementation-dependent.
Additionally, some implementations may reuse the return value of
"f" for elements that appear multiple times in "itr". Use
"mapfoldl()" or "mapfoldr()" instead for guaranteed left or
right associativity and invocation of "f" for every value.

    mapreduce(f, op, itr)

Like "mapreduce(f, op, v0, itr)". In general, this cannot be used
with empty collections (see "reduce(op, itr)").

"""
mapreduce

doc"""
    mapreducedim(f, op, A, dims[, initial])

Evaluates to the same as *reducedim(op, map(f, A), dims,
f(initial))*, but is generally faster because the intermediate
array is avoided.

"""
mapreducedim

doc"""
    mapslices(f, A, dims)

Transform the given dimensions of array "A" using function "f".
"f" is called on each slice of "A" of the form
"A[...,:,...,:,...]". "dims" is an integer vector specifying
where the colons go in this expression. The results are
concatenated along the remaining dimensions. For example, if
"dims" is "[1,2]" and A is 4-dimensional, "f" is called on
"A[:,:,i,j]" for all "i" and "j".

"""
mapslices

doc"""
    mark(s)

Add a mark at the current position of stream "s".  Returns the
marked position.

See also "unmark()", "reset()", "ismarked()"

"""
mark

doc"""
    match(r::Regex, s::AbstractString[, idx::Integer[, addopts]])

Search for the first match of the regular expression "r" in "s"
and return a RegexMatch object containing the match, or nothing if
the match failed. The matching substring can be retrieved by
accessing "m.match" and the captured sequences can be retrieved
by accessing "m.captures" The optional "idx" argument specifies
an index at which to start the search.

"""
match

doc"""
    matchall(r::Regex, s::AbstractString[, overlap::Bool=false]) -> Vector{AbstractString}

Return a vector of the matching substrings from eachmatch.

"""
matchall

doc"""
    max(x, y, ...)

Return the maximum of the arguments. Operates elementwise over
arrays.

"""
max

doc"""
    maxabs(itr)

Compute the maximum absolute value of a collection of values.

    maxabs(A, dims)

Compute the maximum absolute values over given dimensions.

"""
maxabs

doc"""
    maxabs!(r, A)

Compute the maximum absolute values over the singleton dimensions
of "r", and write values to "r".

"""
maxabs!

doc"""
    maximum(itr)

Returns the largest element in a collection.

    maximum(A, dims)

Compute the maximum value of an array over the given dimensions.

"""
maximum

doc"""
    maximum!(r, A)

Compute the maximum value of "A" over the singleton dimensions of
"r", and write results to "r".

"""
maximum!

doc"""
    maxintfloat(type)

The largest integer losslessly representable by the given floating-
point type

"""
maxintfloat

doc"""
    mean(v[, region])

Compute the mean of whole array "v", or optionally along the
dimensions in "region". Note: Julia does not ignore "NaN"
values in the computation. For applications requiring the handling
of missing data, the "DataArray" package is recommended.

"""
mean

doc"""
    mean!(r, v)

Compute the mean of "v" over the singleton dimensions of "r",
and write results to "r".

"""
mean!

doc"""
    median(v)

Compute the median of a vector "v". "NaN" is returned if the
data contains any "NaN" values. For applications requiring the
handling of missing data, the "DataArrays" package is
recommended.

"""
median

doc"""
    median!(v)

Like "median", but may overwrite the input vector.

"""
median!

doc"""
    merge(collection, others...)

Construct a merged collection from the given collections. If
necessary, the types of the resulting collection will be promoted
to accommodate the types of the merged collections. If the same key
is present in another collection, the value for that key will be
the value it has in the last collection listed.

    julia> a = Dict("foo" => 0.0, "bar" => 42.0)
    Dict{ASCIIString,Float64} with 2 entries:
      "bar" => 42.0
      "foo" => 0.0

    julia> b = Dict(utf8("baz") => 17, utf8("bar") => 4711)
    Dict{UTF8String,Int64} with 2 entries:
      "bar" => 4711
      "baz" => 17

    julia> merge(a, b)
    Dict{UTF8String,Float64} with 3 entries:
      "bar" => 4711.0
      "baz" => 17.0
      "foo" => 0.0

    julia> merge(b, a)
    Dict{UTF8String,Float64} with 3 entries:
      "bar" => 42.0
      "baz" => 17.0
      "foo" => 0.0

"""
merge

doc"""
    merge!(collection, others...)

Update collection with pairs from the other collections

"""
merge!

doc"""
    method_exists(f, Tuple type) -> Bool

Determine whether the given generic function has a method matching
the given "Tuple" of argument types.

    julia> method_exists(length, Tuple{Array})
    true

"""
method_exists

doc"""
    methods(f[, types])

Returns the method table for "f".

If "types" is specified, returns an array of methods whose types
match.

"""
methods

doc"""
    methodswith(typ[, module or function][, showparents])

Return an array of methods with an argument of type "typ". If
optional "showparents" is "true", also return arguments with a
parent type of "typ", excluding type "Any".

The optional second argument restricts the search to a particular
module or function.

"""
methodswith

doc"""
    middle(x)

Compute the middle of a scalar value, which is equivalent to "x"
itself, but of the type of "middle(x, x)" for consistency.

    middle(x, y)

Compute the middle of two reals "x" and "y", which is
equivalent in both value and type to computing their mean ("(x +
y) / 2").

    middle(range)

Compute the middle of a range, which consists in computing the mean
of its extrema. Since a range is sorted, the mean is performed with
the first and last element.

    middle(array)

Compute the middle of an array, which consists in finding its
extrema and then computing their mean.

"""
middle

doc"""
    midpoints(e)

Compute the midpoints of the bins with edges "e". The result is a
vector/range of length "length(e) - 1". Note: Julia does not
ignore "NaN" values in the computation.

"""
midpoints

doc"""
    mimewritable(mime, x)

Returns a boolean value indicating whether or not the object "x"
can be written as the given "mime" type.  (By default, this is
determined automatically by the existence of the corresponding
"writemime" function for "typeof(x)".)

"""
mimewritable

doc"""
    min(x, y, ...)

Return the minimum of the arguments. Operates elementwise over
arrays.

"""
min

doc"""
    minabs(itr)

Compute the minimum absolute value of a collection of values.

    minabs(A, dims)

Compute the minimum absolute values over given dimensions.

"""
minabs

doc"""
    minabs!(r, A)

Compute the minimum absolute values over the singleton dimensions
of "r", and write values to "r".

"""
minabs!

doc"""
    minimum(itr)

Returns the smallest element in a collection.

    minimum(A, dims)

Compute the minimum value of an array over the given dimensions.

"""
minimum

doc"""
    minimum!(r, A)

Compute the minimum value of "A" over the singleton dimensions of
"r", and write results to "r".

"""
minimum!

doc"""
    minmax(x, y)

Return "(min(x,y), max(x,y))". See also: "extrema()" that
returns "(minimum(x), maximum(x))"

"""
minmax

doc"""
    mkdir(path[, mode])

Make a new directory with name "path" and permissions "mode".
"mode" defaults to 0o777, modified by the current file creation
mask.

"""
mkdir

doc"""
    mkpath(path[, mode])

Create all directories in the given "path", with permissions
"mode". "mode" defaults to 0o777, modified by the current file
creation mask.

"""
mkpath

doc"""
    mktemp([parent=tempdir()])

Returns "(path, io)", where "path" is the path of a new
temporary file in "parent" and "io" is an open file object for
this path.

"""
mktemp

doc"""
    mktempdir([parent=tempdir()])

Create a temporary directory in the "parent" directory and return
its path.

"""
mktempdir

doc"""
    mmap_array(type, dims, stream[, offset])

Create an "Array" whose values are linked to a file, using
memory-mapping. This provides a convenient way of working with data
too large to fit in the computer's memory.

The type determines how the bytes of the array are interpreted.
Note that the file must be stored in binary format, and no format
conversions are possible (this is a limitation of operating
systems, not Julia).

"dims" is a tuple specifying the size of the array.

The file is passed via the stream argument.  When you initialize
the stream, use ""r"" for a "read-only" array, and ""w+""
to create a new array used to write values to disk.

Optionally, you can specify an offset (in bytes) if, for example,
you want to skip over a header in the file. The default value for
the offset is the current stream position.

For example, the following code:

    # Create a file for mmapping
    # (you could alternatively use mmap_array to do this step, too)
    A = rand(1:20, 5, 30)
    s = open("/tmp/mmap.bin", "w+")
    # We'll write the dimensions of the array as the first two Ints in the file
    write(s, size(A,1))
    write(s, size(A,2))
    # Now write the data
    write(s, A)
    close(s)

    # Test by reading it back in
    s = open("/tmp/mmap.bin")   # default is read-only
    m = read(s, Int)
    n = read(s, Int)
    A2 = mmap_array(Int, (m,n), s)

creates a "m"-by-"n" "Matrix{Int}", linked to the file
associated with stream "s".

A more portable file would need to encode the word size---32 bit or
64 bit---and endianness information in the header. In practice,
consider encoding binary data using standard formats like HDF5
(which can be used with memory-mapping).

"""
mmap_array

doc"""
    mmap_bitarray([type], dims, stream[, offset])

Create a "BitArray" whose values are linked to a file, using
memory-mapping; it has the same purpose, works in the same way, and
has the same arguments, as "mmap_array()", but the byte
representation is different. The "type" parameter is optional,
and must be "Bool" if given.

**Example**:  "B = mmap_bitarray((25,30000), s)"

This would create a 25-by-30000 "BitArray", linked to the file
associated with stream "s".

"""
mmap_bitarray

doc"""
    mod(x, y)

Modulus after division, returning in the range [0,``y``), if "y"
is positive, or ("y",0] if "y" is negative.

"""
mod

doc"""
    mod1(x, m)

Modulus after division, returning in the range (0,m]

"""
mod1

doc"""
    mod2pi(x)

Modulus after division by 2pi, returning in the range [0,2pi).

This function computes a floating point representation of the
modulus after division by numerically exact 2pi, and is therefore
not exactly the same as mod(x,2pi), which would compute the modulus
of x relative to division by the floating-point number 2pi.

"""
mod2pi

doc"""
    modf(x)

Return a tuple (fpart,ipart) of the fractional and integral parts
of a number. Both parts have the same sign as the argument.

"""
modf

doc"""
    module_name(m::Module) -> Symbol

Get the name of a module as a symbol.

"""
module_name

doc"""
    module_parent(m::Module) -> Module

Get a module's enclosing module. "Main" is its own parent.

"""
module_parent

doc"""
    msync(array)

Forces synchronization between the in-memory version of a memory-
mapped "Array" or "BitArray" and the on-disk version.

"""
msync

doc"""
    mtime(file)

Equivalent to stat(file).mtime

"""
mtime

doc"""
    muladd(x, y, z)

Combined multiply-add, computes "x*y+z" in an efficient manner.
This may on some systems be equivalent to "x*y+z", or to
"fma(x,y,z)". "muladd" is used to improve performance. See
"fma".

"""
muladd

doc"""
    mv(src::AbstractString, dst::AbstractString; remove_destination::Bool=false)

Move the file, link, or directory from *src* to *dest*.
"remove_destination=true" will first remove an existing *dst*.

"""
mv

doc"""
    myid()

Get the id of the current process.

"""
myid

doc"""
    names(x::Module[, all=false[, imported=false]])

Get an array of the names exported by a module, with optionally
more module globals according to the additional parameters.

"""
names

doc"""
    nan(f)

Returns NaN (not-a-number) of the floating point type "f" or of
the same floating point type as "f"

"""
nan

doc"""
    nb_available(stream)

Returns the number of bytes available for reading before a read
from this stream or buffer will block.

"""
nb_available

doc"""
    ndigits(n, b)

Compute the number of digits in number "n" written in base "b".

"""
ndigits

doc"""
    ndims(A) -> Integer

Returns the number of dimensions of A

"""
ndims

doc"""
    next(iter, state) -> item, state

For a given iterable object and iteration state, return the current
item and the next iteration state

"""
next

doc"""
    nextfloat(f)

Get the next floating point number in lexicographic order

"""
nextfloat

doc"""
    nextind(str, i)

Get the next valid string index after "i". Returns a value
greater than "endof(str)" at or after the end of the string.

"""
nextind

doc"""
    nextpow(a, x)

The smallest "a^n" not less than "x", where "n" is a non-
negative integer. "a" must be greater than 1, and "x" must be
greater than 0.

"""
nextpow

doc"""
    nextpow2(n)

The smallest power of two not less than "n". Returns 0 for
"n==0", and returns "-nextpow2(-n)" for negative arguments.

"""
nextpow2

doc"""
    nextprod([k_1, k_2, ...], n)

Next integer not less than "n" that can be written as \prod
k_i^{p_i} for integers p_1, p_2, etc.

"""
nextprod

doc"""
    nfields(x::DataType) -> Int

Get the number of fields of a data type.

"""
nfields

doc"""
    nnz(A)

Returns the number of stored (filled) elements in a sparse matrix.

"""
nnz

doc"""
    nonzeros(A)

Return a vector of the structural nonzero values in sparse matrix
"A". This includes zeros that are explicitly stored in the sparse
matrix. The returned vector points directly to the internal nonzero
storage of "A", and any modifications to the returned vector will
mutate "A" as well. See "rowvals(A)" and "nzrange(A, col)".

"""
nonzeros

doc"""
    norm(A[, p])

Compute the "p"-norm of a vector or the operator norm of a matrix
"A", defaulting to the "p=2"-norm.

For vectors, "p" can assume any numeric value (even though not
all values produce a mathematically valid vector norm). In
particular, "norm(A, Inf)" returns the largest value in
"abs(A)", whereas "norm(A, -Inf)" returns the smallest.

For matrices, valid values of "p" are "1", "2", or "Inf".
(Note that for sparse matrices, "p=2" is currently not
implemented.) Use "vecnorm()" to compute the Frobenius norm.

"""
norm

doc"""
    normalize_string(s, normalform::Symbol)

Normalize the string "s" according to one of the four "normal
forms" of the Unicode standard: "normalform" can be ":NFC",
":NFD", ":NFKC", or ":NFKD".  Normal forms C (canonical
composition) and D (canonical decomposition) convert different
visually identical representations of the same abstract string into
a single canonical form, with form C being more compact.  Normal
forms KC and KD additionally canonicalize "compatibility
equivalents": they convert characters that are abstractly similar
but visually distinct into a single canonical choice (e.g. they
expand ligatures into the individual characters), with form KC
being more compact.

Alternatively, finer control and additional transformations may be
be obtained by calling *normalize_string(s; keywords...)*, where
any number of the following boolean keywords options (which all
default to "false" except for "compose") are specified:

* "compose=false": do not perform canonical composition

* "decompose=true": do canonical decomposition instead of
  canonical composition ("compose=true" is ignored if present)

* "compat=true": compatibility equivalents are canonicalized

* "casefold=true": perform Unicode case folding, e.g. for case-
  insensitive string comparison

* "newline2lf=true", "newline2ls=true", or
  "newline2ps=true": convert various newline sequences (LF, CRLF,
  CR, NEL) into a linefeed (LF), line-separation (LS), or
  paragraph-separation (PS) character, respectively

* "stripmark=true": strip diacritical marks (e.g. accents)

* "stripignore=true": strip Unicode's "default ignorable"
  characters (e.g. the soft hyphen or the left-to-right marker)

* "stripcc=true": strip control characters; horizontal tabs and
  form feeds are converted to spaces; newlines are also converted
  to spaces unless a newline-conversion flag was specified

* "rejectna=true": throw an error if unassigned code points are
  found

* "stable=true": enforce Unicode Versioning Stability

For example, NFKC corresponds to the options "compose=true,
compat=true, stable=true".

"""
normalize_string

doc"""
    normpath(path::AbstractString) -> AbstractString

Normalize a path, removing "." and ".." entries.

"""
normpath

doc"""
    nothing

The singleton instance of type "Void", used by convention when
there is no value to return (as in a C "void" function). Can be
converted to an empty "Nullable" value.

"""
nothing

doc"""
    notify(condition, val=nothing; all=true, error=false)

Wake up tasks waiting for a condition, passing them "val". If
"all" is true (the default), all waiting tasks are woken,
otherwise only one is. If "error" is true, the passed value is
raised as an exception in the woken tasks.

"""
notify

doc"""
    nprocs()

Get the number of available processes.

"""
nprocs

doc"""
    nthperm(v, k)

Compute the kth lexicographic permutation of a vector.

    nthperm(p)

Return the "k" that generated permutation "p". Note that
"nthperm(nthperm([1:n], k)) == k" for "1 <= k <= factorial(n)".

"""
nthperm

doc"""
    nthperm!(v, k)

In-place version of "nthperm()".

"""
nthperm!

doc"""
    ntoh(x)

Converts the endianness of a value from Network byte order (big-
endian) to that used by the Host.

"""
ntoh

doc"""
    ntuple(f::Function, n)

Create a tuple of length "n", computing each element as "f(i)",
where "i" is the index of the element.

"""
ntuple

doc"""
    nullspace(M)

Basis for nullspace of "M".

"""
nullspace

doc"""
    num(x)

Numerator of the rational representation of "x"

"""
num

doc"""
    num2hex(f)

Get a hexadecimal string of the binary representation of a floating
point number

"""
num2hex

doc"""
    nworkers()

Get the number of available worker processes. This is one less than
nprocs(). Equal to nprocs() if nprocs() == 1.

"""
nworkers

doc"""
    nzrange(A, col)

Return the range of indices to the structural nonzero values of a
sparse matrix column. In conjunction with "nonzeros(A)" and
"rowvals(A)", this allows for convenient iterating over a sparse
matrix

    A = sparse(I,J,V)
    rows = rowvals(A)
    vals = nonzeros(A)
    m, n = size(A)
    for i = 1:n
       for j in nzrange(A, i)
          row = rows[j]
          val = vals[j]
          # perform sparse wizardry...
       end
    end

"""
nzrange

doc"""
    object_id(x)

Get a unique integer id for "x". "object_id(x)==object_id(y)"
if and only if "is(x,y)".

"""
object_id

doc"""
    oct(n[, pad])

Convert an integer to an octal string, optionally specifying a
number of digits to pad to.

"""
oct

doc"""
    oftype(x, y)

Convert "y" to the type of "x" ("convert(typeof(x), y)").

"""
oftype

doc"""
    one(x)

Get the multiplicative identity element for the type of x (x can
also specify the type itself). For matrices, returns an identity
matrix of the appropriate size and type.

"""
one

doc"""
    ones(type, dims)

Create an array of all ones of specified type. The type defaults to
Float64 if not specified.

    ones(A)

Create an array of all ones with the same element type and shape as
A.

"""
ones

doc"""
    open(command, mode::AbstractString="r", stdio=DevNull)

Start running "command" asynchronously, and return a tuple
"(stream,process)".  If "mode" is ""r"", then "stream"
reads from the process's standard output and "stdio" optionally
specifies the process's standard input stream.  If "mode" is
""w"", then "stream" writes to the process's standard input
and "stdio" optionally specifies the process's standard output
stream.

    open(f::Function, command, mode::AbstractString="r", stdio=DevNull)

Similar to "open(command, mode, stdio)", but calls "f(stream)"
on the resulting read or write stream, then closes the stream and
waits for the process to complete.  Returns the value returned by
"f".

    open(file_name[, read, write, create, truncate, append]) -> IOStream

Open a file in a mode specified by five boolean arguments. The
default is to open files for reading only. Returns a stream for
accessing the file.

    open(file_name[, mode]) -> IOStream

Alternate syntax for open, where a string-based mode specifier is
used instead of the five booleans. The values of "mode"
correspond to those from "fopen(3)" or Perl "open", and are
equivalent to setting the following boolean groups:

    +------+-----------------------------------+
    | r    | read                              |
    +------+-----------------------------------+
    | r+   | read, write                       |
    +------+-----------------------------------+
    | w    | write, create, truncate           |
    +------+-----------------------------------+
    | w+   | read, write, create, truncate     |
    +------+-----------------------------------+
    | a    | write, create, append             |
    +------+-----------------------------------+
    | a+   | read, write, create, append       |
    +------+-----------------------------------+

    open(f::function, args...)

Apply the function "f" to the result of "open(args...)" and
close the resulting file descriptor upon completion.

**Example**: "open(readall, "file.txt")"

"""
open

doc"""
    operm(file)

Like uperm but gets the permissions for people who neither own the
file nor are a member of the group owning the file

"""
operm

doc"""
    ordschur(Q, T, select) -> Schur

Reorders the Schur factorization of a real matrix "A=Q*T*Q'"
according to the logical array "select" returning a Schur object
"F". The selected eigenvalues appear in the leading diagonal of
"F[:Schur]" and the the corresponding leading columns of
"F[:vectors]" form an orthonormal basis of the corresponding
right invariant subspace. A complex conjugate pair of eigenvalues
must be either both included or excluded via "select".

    ordschur(S, select) -> Schur

Reorders the Schur factorization "S" of type "Schur".

    ordschur(S, T, Q, Z, select) -> GeneralizedSchur

Reorders the Generalized Schur factorization of a matrix "(A, B) =
(Q*S*Z^{H}, Q*T*Z^{H})" according to the logical array "select"
and returns a GeneralizedSchur object "GS".  The selected
eigenvalues appear in the leading diagonal of both``(GS[:S],
GS[:T])`` and the left and right unitary/orthogonal Schur vectors
are also reordered such that "(A, B) = GS[:Q]*(GS[:S],
GS[:T])*GS[:Z]^{H}" still holds and the generalized eigenvalues of
"A" and "B" can still be obtained with
"GS[:alpha]./GS[:beta]".

    ordschur(GS, select) -> GeneralizedSchur

Reorders the Generalized Schur factorization of a Generalized Schur
object.  See "ordschur()".

"""
ordschur

doc"""
    ordschur!(Q, T, select) -> Schur

Reorders the Schur factorization of a real matrix "A=Q*T*Q'",
overwriting "Q" and "T" in the process. See "ordschur()"

    ordschur!(S, select) -> Schur

Reorders the Schur factorization "S" of type "Schur",
overwriting "S" in the process. See "ordschur()"

    ordschur!(S, T, Q, Z, select) -> GeneralizedSchur

Reorders the Generalized Schur factorization of a matrix by
overwriting the matrices "(S, T, Q, Z)" in the process.  See
"ordschur()".

    ordschur!(GS, select) -> GeneralizedSchur

Reorders the Generalized Schur factorization of a Generalized Schur
object by overwriting the object with the new factorization.  See
"ordschur()".

"""
ordschur!

doc"""
    parent(A)

Returns the "parent array" of an array view type (e.g.,
SubArray), or the array itself if it is not a view

"""
parent

doc"""
    parentindexes(A)

From an array view "A", returns the corresponding indexes in the
parent

"""
parentindexes

doc"""
    parse(str, start; greedy=true, raise=true)

Parse the expression string and return an expression (which could
later be passed to eval for execution). Start is the index of the
first character to start parsing. If "greedy" is true (default),
"parse" will try to consume as much input as it can; otherwise,
it will stop as soon as it has parsed a valid expression.
Incomplete but otherwise syntactically valid expressions will
return "Expr(:incomplete, "(error message)")". If "raise" is
true (default), syntax errors other than incomplete expressions
will raise an error. If "raise" is false, "parse" will return
an expression that will raise an error upon evaluation.

    parse(str; raise=true)

Parse the whole string greedily, returning a single expression.  An
error is thrown if there are additional characters after the first
expression. If "raise" is true (default), syntax errors will
raise an error; otherwise, "parse" will return an expression that
will raise an error upon evaluation.

    parse(type, str[, base])

Parse a string as a number. If the type is an integer type, then a
base can be specified (the default is 10). If the type is a
floating point type, the string is parsed as a decimal floating
point number. If the string does not contain a valid number, an
error is raised.

"""
parse

doc"""
    parseip(addr)

Parse a string specifying an IPv4 or IPv6 ip address.

"""
parseip

doc"""
    partitions(n)

Generate all integer arrays that sum to "n". Because the number
of partitions can be very large, this function returns an iterator
object. Use "collect(partitions(n))" to get an array of all
partitions. The number of partitions to generate can be efficiently
computed using "length(partitions(n))".

    partitions(n, m)

Generate all arrays of "m" integers that sum to "n". Because
the number of partitions can be very large, this function returns
an iterator object. Use "collect(partitions(n,m))" to get an
array of all partitions. The number of partitions to generate can
be efficiently computed using "length(partitions(n,m))".

    partitions(array)

Generate all set partitions of the elements of an array,
represented as arrays of arrays. Because the number of partitions
can be very large, this function returns an iterator object. Use
"collect(partitions(array))" to get an array of all partitions.
The number of partitions to generate can be efficiently computed
using "length(partitions(array))".

    partitions(array, m)

Generate all set partitions of the elements of an array into
exactly m subsets, represented as arrays of arrays. Because the
number of partitions can be very large, this function returns an
iterator object. Use "collect(partitions(array,m))" to get an
array of all partitions. The number of partitions into m subsets is
equal to the Stirling number of the second kind and can be
efficiently computed using "length(partitions(array,m))".

"""
partitions

doc"""
    peakflops(n; parallel=false)

"peakflops" computes the peak flop rate of the computer by using
double precision "Base.LinAlg.BLAS.gemm!()". By default, if no
arguments are specified, it multiplies a matrix of size "n x n",
where "n = 2000". If the underlying BLAS is using multiple
threads, higher flop rates are realized. The number of BLAS threads
can be set with "blas_set_num_threads(n)".

If the keyword argument "parallel" is set to "true",
"peakflops" is run in parallel on all the worker processors. The
flop rate of the entire parallel computer is returned. When running
in parallel, only 1 BLAS thread is used. The argument "n" still
refers to the size of the problem that is solved on each processor.

"""
peakflops

doc"""
    permutations(array)

Generate all permutations of an indexable object.  Because the
number of permutations can be very large, this function returns an
iterator object. Use "collect(permutations(array))" to get an
array of all permutations.

"""
permutations

doc"""
    permute!(v, p)

Permute vector "v" in-place, according to permutation "p".  No
checking is done to verify that "p" is a permutation.

To return a new permutation, use "v[p]".  Note that this is
generally faster than "permute!(v,p)" for large vectors.

"""
permute!

doc"""
    permutedims(A, perm)

Permute the dimensions of array "A". "perm" is a vector
specifying a permutation of length "ndims(A)". This is a
generalization of transpose for multi-dimensional arrays. Transpose
is equivalent to "permutedims(A, [2,1])".

"""
permutedims

doc"""
    permutedims!(dest, src, perm)

Permute the dimensions of array "src" and store the result in the
array "dest". "perm" is a vector specifying a permutation of
length "ndims(src)". The preallocated array "dest" should have
"size(dest) == size(src)[perm]" and is completely overwritten. No
in-place permutation is supported and unexpected results will
happen if *src* and *dest* have overlapping memory regions.

"""
permutedims!

doc"""
    pi
π

The constant pi

"""
pi

doc"""
    pinv(M[, tol])

Computes the Moore-Penrose pseudoinverse.

For matrices "M" with floating point elements, it is convenient
to compute the pseudoinverse by inverting only singular values
above a given threshold, "tol".

The optimal choice of "tol" varies both with the value of "M"
and the intended application of the pseudoinverse. The default
value of "tol" is
"eps(real(float(one(eltype(M)))))*maximum(size(A))", which is
essentially machine epsilon for the real part of a matrix element
multiplied by the larger matrix dimension. For inverting dense ill-
conditioned matrices in a least-squares sense, "tol =
sqrt(eps(real(float(one(eltype(M))))))" is recommended.

For more information, see [8859], [B96], [S84], [KY88].

[8859] Issue 8859, "Fix least squares",
        https://github.com/JuliaLang/julia/pull/8859

[B96] Åke Björck, "Numerical Methods for Least Squares
       Problems", SIAM Press, Philadelphia, 1996, "Other Titles in
       Applied Mathematics", Vol. 51. doi:10.1137/1.9781611971484

[S84] G. W. Stewart, "Rank Degeneracy", SIAM Journal on
       Scientific and Statistical Computing, 5(2), 1984, 403-413.
       doi:10.1137/0905030

[KY88] Konstantinos Konstantinides and Kung Yao,
        "Statistical analysis of effective singular values in
        matrix rank determination", IEEE Transactions on Acoustics,
        Speech and Signal Processing, 36(5), 1988, 757-763.
        doi:10.1109/29.1585

"""
pinv

doc"""
    pipe(from, to, ...)

Create a pipeline from a data source to a destination. The source
and destination can be commands, I/O streams, strings, or results
of other "pipe" calls. At least one argument must be a command.
Strings refer to filenames. When called with more than two
arguments, they are chained together from left to right. For
example "pipe(a,b,c)" is equivalent to "pipe(pipe(a,b),c)".
This provides a more concise way to specify multi-stage pipelines.

**Examples**:
    * "run(pipe(`ls`, `grep xyz`))"

    * "run(pipe(`ls`, "out.txt"))"

    * "run(pipe("out.txt", `grep xyz`))"

    pipe(command; stdin, stdout, stderr, append=false)

Redirect I/O to or from the given "command". Keyword arguments
specify which of the command's streams should be redirected.
"append" controls whether file output appends to the file. This
is a more general version of the 2-argument "pipe" function.
"pipe(from, to)" is equivalent to "pipe(from, stdout=to)" when
"from" is a command, and to "pipe(to, stdin=from)" when
"from" is another kind of data source.

**Examples**:
    * "run(pipe(`dothings`, stdout="out.txt",
      stderr="errs.txt"))"

    * "run(pipe(`update`, stdout="log.txt", append=true))"

"""
pipe

doc"""
    plan_bfft(A[, dims[, flags[, timelimit]]])

Same as "plan_fft()", but produces a plan that performs an
unnormalized backwards transform "bfft()".

"""
plan_bfft

doc"""
    plan_bfft!(A[, dims[, flags[, timelimit]]])

Same as "plan_bfft()", but operates in-place on "A".

"""
plan_bfft!

doc"""
    plan_brfft(A, d[, dims[, flags[, timelimit]]])

Pre-plan an optimized real-input unnormalized transform, similar to
"plan_rfft()" except for "brfft()" instead of "rfft()". The
first two arguments and the size of the transformed result, are the
same as for "brfft()".

"""
plan_brfft

doc"""
    plan_dct(A[, dims[, flags[, timelimit]]])

Pre-plan an optimized discrete cosine transform (DCT), similar to
"plan_fft()" except producing a function that computes "dct()".
The first two arguments have the same meaning as for "dct()".

"""
plan_dct

doc"""
    plan_dct!(A[, dims[, flags[, timelimit]]])

Same as "plan_dct()", but operates in-place on "A".

"""
plan_dct!

doc"""
    plan_fft(A[, dims[, flags[, timelimit]]])

Pre-plan an optimized FFT along given dimensions ("dims") of
arrays matching the shape and type of "A".  (The first two
arguments have the same meaning as for "fft()".)  Returns a
function "plan(A)" that computes "fft(A, dims)" quickly.

The "flags" argument is a bitwise-or of FFTW planner flags,
defaulting to "FFTW.ESTIMATE".  e.g. passing "FFTW.MEASURE" or
"FFTW.PATIENT" will instead spend several seconds (or more)
benchmarking different possible FFT algorithms and picking the
fastest one; see the FFTW manual for more information on planner
flags.  The optional "timelimit" argument specifies a rough upper
bound on the allowed planning time, in seconds. Passing
"FFTW.MEASURE" or "FFTW.PATIENT" may cause the input array
"A" to be overwritten with zeros during plan creation.

"plan_fft!()" is the same as "plan_fft()" but creates a plan
that operates in-place on its argument (which must be an array of
complex floating-point numbers).  "plan_ifft()" and so on are
similar but produce plans that perform the equivalent of the
inverse transforms "ifft()" and so on.

"""
plan_fft

doc"""
    plan_fft!(A[, dims[, flags[, timelimit]]])

Same as "plan_fft()", but operates in-place on "A".

"""
plan_fft!

doc"""
    plan_idct(A[, dims[, flags[, timelimit]]])

Pre-plan an optimized inverse discrete cosine transform (DCT),
similar to "plan_fft()" except producing a function that computes
"idct()". The first two arguments have the same meaning as for
"idct()".

"""
plan_idct

doc"""
    plan_idct!(A[, dims[, flags[, timelimit]]])

Same as "plan_idct()", but operates in-place on "A".

"""
plan_idct!

doc"""
    plan_ifft(A[, dims[, flags[, timelimit]]])

Same as "plan_fft()", but produces a plan that performs inverse
transforms "ifft()".

"""
plan_ifft

doc"""
    plan_ifft!(A[, dims[, flags[, timelimit]]])

Same as "plan_ifft()", but operates in-place on "A".

"""
plan_ifft!

doc"""
    plan_irfft(A, d[, dims[, flags[, timelimit]]])

Pre-plan an optimized inverse real-input FFT, similar to
"plan_rfft()" except for "irfft()" and "brfft()",
respectively.  The first three arguments have the same meaning as
for "irfft()".

"""
plan_irfft

doc"""
    plan_rfft(A[, dims[, flags[, timelimit]]])

Pre-plan an optimized real-input FFT, similar to "plan_fft()"
except for "rfft()" instead of "fft()".  The first two
arguments, and the size of the transformed result, are the same as
for "rfft()".

"""
plan_rfft

doc"""
    pmap(f, lsts...; err_retry=true, err_stop=false, pids=workers())

Transform collections "lsts" by applying "f" to each element in
parallel. If "nprocs() > 1", the calling process will be
dedicated to assigning tasks. All other available processes will be
used as parallel workers, or on the processes specified by
"pids".

If "err_retry" is true, it retries a failed application of "f"
on a different worker. If "err_stop" is true, it takes precedence
over the value of "err_retry" and "pmap" stops execution on the
first error.

"""
pmap

doc"""
    pointer(array[, index])

Get the native address of an array or string element. Be careful to
ensure that a julia reference to "a" exists as long as this
pointer will be used. This function is "unsafe" like
"unsafe_convert".

Calling "Ref(array[, index])" is generally preferable to this
function.

"""
pointer

doc"""
    pointer_from_objref(object_instance)

Get the memory address of a Julia object as a "Ptr". The
existence of the resulting "Ptr" will not protect the object from
garbage collection, so you must ensure that the object remains
referenced for the whole time that the "Ptr" will be used.

"""
pointer_from_objref

doc"""
    pointer_to_array(pointer, dims[, take_ownership::Bool])

Wrap a native pointer as a Julia Array object. The pointer element
type determines the array element type. "own" optionally
specifies whether Julia should take ownership of the memory,
calling "free" on the pointer when the array is no longer
referenced.

"""
pointer_to_array

doc"""
    poll_fd(fd, seconds::Real; readable=false, writable=false)

Poll a file descriptor fd for changes in the read or write
availability and with a timeout given by the second argument. If
the timeout is not needed, use "wait(fd)" instead. The keyword
arguments determine which of read and/or write status should be
monitored and at least one of them needs to be set to true. The
returned value is an object with boolean fields "readable",
"writable", and "timedout", giving the result of the polling.

"""
poll_fd

doc"""
    poll_file(s, interval_seconds::Real, seconds::Real)

Monitor a file for changes by polling every *interval_seconds*
seconds for *seconds* seconds. A return value of true indicates the
file changed, a return value of false indicates a timeout.

"""
poll_file

doc"""
    polygamma(m, x)

Compute the polygamma function of order "m" of argument "x"
(the "(m+1)th" derivative of the logarithm of "gamma(x)")

"""
polygamma

doc"""
    pop!(collection, key[, default])

Delete and return the mapping for "key" if it exists in
"collection", otherwise return "default", or throw an error if
default is not specified.

    pop!(collection) -> item

Remove the last item in "collection" and return it.

    julia> A=[1, 2, 3, 4, 5, 6]
    6-element Array{Int64,1}:
     1
     2
     3
     4
     5
     6

    julia> pop!(A)
    6

    julia> A
    5-element Array{Int64,1}:
     1
     2
     3
     4
     5

"""
pop!

doc"""
    popdisplay()
popdisplay(d::Display)

Pop the topmost backend off of the display-backend stack, or the
topmost copy of "d" in the second variant.

"""
popdisplay

doc"""
    position(s)

Get the current position of a stream.

"""
position

doc"""
    powermod(x, p, m)

Compute x^p \pmod m

"""
powermod

doc"""
    precision(num::FloatingPoint)

Get the precision of a floating point number, as defined by the
effective number of bits in the mantissa.

"""
precision

doc"""
    precompile(f, args::Tuple{Vararg{Any}})

Compile the given function "f" for the argument tuple (of types)
"args", but do not execute it.

"""
precompile

doc"""
    prepend!(collection, items) -> collection

Insert the elements of "items" to the beginning of
"collection".

    julia> prepend!([3],[1,2])
    3-element Array{Int64,1}:
     1
     2
     3

"""
prepend!

doc"""
    prevfloat(f) -> FloatingPoint

Get the previous floating point number in lexicographic order

"""
prevfloat

doc"""
    prevind(str, i)

Get the previous valid string index before "i". Returns a value
less than "1" at the beginning of the string.

"""
prevind

doc"""
    prevpow(a, x)

The largest "a^n" not greater than "x", where "n" is a non-
negative integer. "a" must be greater than 1, and "x" must not
be less than 1.

"""
prevpow

doc"""
    prevpow2(n)

The largest power of two not greater than "n". Returns 0 for
"n==0", and returns "-prevpow2(-n)" for negative arguments.

"""
prevpow2

doc"""
    prevprod([k_1, k_2, ...], n)

Previous integer not greater than "n" that can be written as
\prod k_i^{p_i} for integers p_1, p_2, etc.

"""
prevprod

doc"""
    primes(n)

Returns a collection of the prime numbers <= "n".

"""
primes

doc"""
    print(x)

Write (to the default output stream) a canonical (un-decorated)
text representation of a value if there is one, otherwise call
"show". The representation used by "print" includes minimal
formatting and tries to avoid Julia-specific details.

"""
print

doc"""
    print_escaped(io, str::AbstractString, esc::AbstractString)

General escaping of traditional C and Unicode escape sequences,
plus any characters in esc are also escaped (with a backslash).

"""
print_escaped

doc"""
    print_joined(io, items, delim[, last])

Print elements of "items" to "io" with "delim" between them.
If "last" is specified, it is used as the final delimiter instead
of "delim".

"""
print_joined

doc"""
    print_shortest(io, x)

Print the shortest possible representation, with the minimum number
of consecutive non-zero digits, of number "x", ensuring that it
would parse to the exact same number.

"""
print_shortest

doc"""
    print_unescaped(io, s::AbstractString)

General unescaping of traditional C and Unicode escape sequences.
Reverse of "print_escaped()".

"""
print_unescaped

doc"""
    print_with_color(color::Symbol[, io], strings...)

Print strings in a color specified as a symbol, for example
":red" or ":blue".

"""
print_with_color

doc"""
    println(x)

Print (using "print()") "x" followed by a newline.

"""
println

doc"""
    process_exited(p::Process)

Determine whether a process has exited.

"""
process_exited

doc"""
    process_running(p::Process)

Determine whether a process is currently running.

"""
process_running

doc"""
    procs()

Returns a list of all process identifiers.

    procs(S::SharedArray)

Get the vector of processes that have mapped the shared array

"""
procs

doc"""
    prod(itr)

Returns the product of all elements of a collection.

    prod(A, dims)

Multiply elements of an array over the given dimensions.

"""
prod

doc"""
    prod!(r, A)

Multiply elements of "A" over the singleton dimensions of "r",
and write results to "r".

"""
prod!

doc"""
    produce(value)

Send the given value to the last "consume" call, switching to the
consumer task. If the next "consume" call passes any values, they
are returned by "produce".

"""
produce

doc"""
    promote(xs...)

Convert all arguments to their common promotion type (if any), and
return them all (as a tuple).

"""
promote

doc"""
    promote_rule(type1, type2)

Specifies what type should be used by "promote" when given values
of types "type1" and "type2". This function should not be
called directly, but should have definitions added to it for new
types as appropriate.

"""
promote_rule

doc"""
    promote_shape(s1, s2)

Check two array shapes for compatibility, allowing trailing
singleton dimensions, and return whichever shape has more
dimensions.

"""
promote_shape

doc"""
    promote_type(type1, type2)

Determine a type big enough to hold values of each argument type
without loss, whenever possible. In some cases, where no type
exists to which both types can be promoted losslessly, some loss is
tolerated; for example, "promote_type(Int64,Float64)" returns
"Float64" even though strictly, not all "Int64" values can be
represented exactly as "Float64" values.

"""
promote_type

doc"""
    push!(collection, items...) -> collection

Insert one or more "items" at the end of "collection".

    julia> push!([1, 2, 3], 4, 5, 6)
    6-element Array{Int64,1}:
     1
     2
     3
     4
     5
     6

Use "append!()" to add all the elements of another collection to
"collection". The result of the preceding example is equivalent
to "append!([1, 2, 3], [4, 5, 6])".

"""
push!

doc"""
    pushdisplay(d::Display)

Pushes a new display "d" on top of the global display-backend
stack.  Calling "display(x)" or "display(mime, x)" will display
"x" on the topmost compatible backend in the stack (i.e., the
topmost backend that does not throw a "MethodError").

"""
pushdisplay

doc"""
    put!(RemoteRef, value)

Store a value to a remote reference. Implements "shared queue of
length 1" semantics: if a value is already present, blocks until
the value is removed with "take!". Returns its first argument.

"""
put!

doc"""
    pwd() -> AbstractString

Get the current working directory.

"""
pwd

doc"""
    qr(A[, pivot=Val{false}][;thin=true]) -> Q, R, [p]

Compute the (pivoted) QR factorization of "A" such that either
"A = Q*R" or "A[:,p] = Q*R". Also see "qrfact". The default
is to compute a thin factorization. Note that "R" is not extended
with zeros when the full "Q" is requested.

"""
qr

doc"""
    qrfact(A[, pivot=Val{false}]) -> F

Computes the QR factorization of "A". The return type of "F"
depends on the element type of "A" and whether pivoting is
specified (with "pivot==Val{true}").

    +------------------+-------------------+----------------+---------------------------------------+
    | Return type      | \"eltype(A)\"     | \"pivot\"      | Relationship between \"F\" and \"A\"  |
    +------------------+-------------------+----------------+---------------------------------------+
    | \"QR\"           | not \"BlasFloat\" | either         | \"A==F[:Q]*F[:R]\"                    |
    +------------------+-------------------+----------------+---------------------------------------+
    | \"QRCompactWY\"  | \"BlasFloat\"     | \"Val{false}\" | \"A==F[:Q]*F[:R]\"                    |
    +------------------+-------------------+----------------+---------------------------------------+
    | \"QRPivoted\"    | \"BlasFloat\"     | \"Val{true}\"  | \"A[:,F[:p]]==F[:Q]*F[:R]\"           |
    +------------------+-------------------+----------------+---------------------------------------+

"BlasFloat" refers to any of: "Float32", "Float64",
"Complex64" or "Complex128".

The individual components of the factorization "F" can be
accessed by indexing:

    +-------------+-----------------------------------------------+--------------------+-----------------------+--------------------+
    | Component   | Description                                   | \"QR\"             | \"QRCompactWY\"       | \"QRPivoted\"      |
    +-------------+-----------------------------------------------+--------------------+-----------------------+--------------------+
    | \"F[:Q]\"   | \"Q\" (orthogonal/unitary) part of \"QR\"     | ✓ (\"QRPackedQ\")  | ✓ (\"QRCompactWYQ\")  | ✓ (\"QRPackedQ\")  |
    +-------------+-----------------------------------------------+--------------------+-----------------------+--------------------+
    | \"F[:R]\"   | \"R\" (upper right triangular) part of \"QR\" | ✓                  | ✓                     | ✓                  |
    +-------------+-----------------------------------------------+--------------------+-----------------------+--------------------+
    | \"F[:p]\"   | pivot \"Vector\"                              |                    |                       | ✓                  |
    +-------------+-----------------------------------------------+--------------------+-----------------------+--------------------+
    | \"F[:P]\"   | (pivot) permutation \"Matrix\"                |                    |                       | ✓                  |
    +-------------+-----------------------------------------------+--------------------+-----------------------+--------------------+

The following functions are available for the "QR" objects:
"size", "\". When "A" is rectangular, "\" will return a
least squares solution and if the solution is not unique, the one
with smallest norm is returned.

Multiplication with respect to either thin or full "Q" is
allowed, i.e. both "F[:Q]*F[:R]" and "F[:Q]*A" are supported. A
"Q" matrix can be converted into a regular matrix with "full()"
which has a named argument "thin".

Note: "qrfact" returns multiple types because LAPACK uses
  several representations that minimize the memory storage
  requirements of products of Householder elementary reflectors, so
  that the "Q" and "R" matrices can be stored compactly rather
  as two separate dense matrices.The data contained in "QR" or
  "QRPivoted" can be used to construct the "QRPackedQ" type,
  which is a compact representation of the rotation matrix:

         Q = \prod_{i=1}^{\min(m,n)} (I - \tau_i v_i v_i^T)

  where \tau_i is the scale factor and v_i is the projection
  vector associated with the i^{th} Householder elementary
  reflector.The data contained in "QRCompactWY" can be used to
  construct the "QRCompactWYQ" type, which is a compact
  representation of the rotation matrix

         Q = I + Y T Y^T

  where "Y" is m \times r lower trapezoidal and "T" is r
  \times r upper triangular. The *compact WY* representation
  [Schreiber1989] is not to be confused with the older, *WY*
  representation [Bischof1987]. (The LAPACK documentation uses
  "V" in lieu of "Y".)

[Bischof1987] C Bischof and C Van Loan, The WY
               representation for products of Householder matrices,
               SIAM J Sci Stat Comput 8 (1987), s2-s13.
               doi:10.1137/0908009

[Schreiber1989] R Schreiber and C Van Loan, A
                 storage-efficient WY representation for products of
                 Householder transformations, SIAM J Sci Stat Comput
                 10 (1989), 53-57. doi:10.1137/0910005

    qrfact(A) -> SPQR.Factorization

Compute the QR factorization of a sparse matrix "A". A fill-
reducing permutation is used. The main application of this type is
to solve least squares problems with "\". The function calls the
C library SPQR and a few additional functions from the library are
wrapped but not exported.

"""
qrfact

doc"""
    qrfact!(A[, pivot=Val{false}])

"qrfact!" is the same as "qrfact()" when A is a subtype of
"StridedMatrix", but saves space by overwriting the input "A",
instead of creating a copy.

"""
qrfact!

doc"""
    quadgk(f, a, b, c...; reltol=sqrt(eps), abstol=0, maxevals=10^7, order=7, norm=vecnorm)

Numerically integrate the function "f(x)" from "a" to "b",
and optionally over additional intervals "b" to "c" and so on.
Keyword options include a relative error tolerance "reltol"
(defaults to "sqrt(eps)" in the precision of the endpoints), an
absolute error tolerance "abstol" (defaults to 0), a maximum
number of function evaluations "maxevals" (defaults to "10^7"),
and the "order" of the integration rule (defaults to 7).

Returns a pair "(I,E)" of the estimated integral "I" and an
estimated upper bound on the absolute error "E".  If "maxevals"
is not exceeded then "E <= max(abstol, reltol*norm(I))" will
hold. (Note that it is useful to specify a positive "abstol" in
cases where "norm(I)" may be zero.)

The endpoints "a" etcetera can also be complex (in which case the
integral is performed over straight-line segments in the complex
plane).  If the endpoints are "BigFloat", then the integration
will be performed in "BigFloat" precision as well (note: it is
advisable to increase the integration "order" in rough proportion
to the precision, for smooth integrands).  More generally, the
precision is set by the precision of the integration endpoints
(promoted to floating-point types).

The integrand "f(x)" can return any numeric scalar, vector, or
matrix type, or in fact any type supporting "+", "-",
multiplication by real values, and a "norm" (i.e., any normed
vector space). Alternatively, a different norm can be specified by
passing a *norm*-like function as the *norm* keyword argument
(which defaults to *vecnorm*).

[Only one-dimensional integrals are provided by this function.  For
multi-dimensional integration (cubature), there are many different
algorithms (often much better than simple nested 1d integrals) and
the optimal choice tends to be very problem-dependent.  See the
Julia external-package listing for available algorithms for
multidimensional integration or other specialized tasks (such as
integrals of highly oscillatory or singular functions).]

The algorithm is an adaptive Gauss-Kronrod integration technique:
the integral in each interval is estimated using a Kronrod rule
("2*order+1" points) and the error is estimated using an embedded
Gauss rule ("order" points).   The interval with the largest
error is then subdivided into two intervals and the process is
repeated until the desired error tolerance is achieved.

These quadrature rules work best for smooth functions within each
interval, so if your function has a known discontinuity or other
singularity, it is best to subdivide your interval to put the
singularity at an endpoint.  For example, if "f" has a
discontinuity at "x=0.7" and you want to integrate from 0 to 1,
you should use "quadgk(f, 0,0.7,1)" to subdivide the interval at
the point of discontinuity.  The integrand is never evaluated
exactly at the endpoints of the intervals, so it is possible to
integrate functions that diverge at the endpoints as long as the
singularity is integrable (for example, a "log(x)" or
"1/sqrt(x)" singularity).

For real-valued endpoints, the starting and/or ending points may be
infinite.  (A coordinate transformation is performed internally to
map the infinite interval to a finite one.)

"""
quadgk

doc"""
    quantile(v, p)

Compute the quantiles of a vector "v" at a specified set of
probability values "p". Note: Julia does not ignore "NaN"
values in the computation.

    quantile(v, p)

Compute the quantile of a vector "v" at the probability "p".
Note: Julia does not ignore "NaN" values in the computation.

"""
quantile

doc"""
    quantile!(v, p)

Like "quantile", but overwrites the input vector.

"""
quantile!

doc"""
    quit()

Quit the program indicating that the processes completed
successfully. This function calls "exit(0)" (see "exit()").

"""
quit

doc"""
    rad2deg(x)

Convert "x" from radians to degrees

"""
rad2deg

doc"""
    rand([rng][, S][, dims...])

Pick a random element or array of random elements from the set of
values specified by "S"; "S" can be

* an indexable collection (for example "1:n" or
  "['x','y','z']"), or

* a type: the set of values to pick from is then equivalent to
  "typemin(S):typemax(S)" for integers (this is not applicable to
  "BigInt"), and to [0,1) for floating point numbers;

"S" defaults to "Float64".

"""
rand

doc"""
    rand!([rng], A[, coll])

Populate the array A with random values. If the indexable
collection "coll" is specified, the values are picked randomly
from "coll". This is equivalent to "copy!(A, rand(rng, coll,
size(A)))" or "copy!(A, rand(rng, eltype(A), size(A)))" but
without allocating a new array.

"""
rand!

doc"""
    randcycle([rng], n)

Construct a random cyclic permutation of length "n". The optional
"rng" argument specifies a random number generator, see *Random
Numbers*.

"""
randcycle

doc"""
    randexp([rng][, dims...])

Generate a random number according to the exponential distribution
with scale 1. Optionally generate an array of such random numbers.

"""
randexp

doc"""
    randexp!([rng], A::Array{Float64, N})

Fill the array A with random numbers following the exponential
distribution (with scale 1).

"""
randexp!

doc"""
    randn([rng][, dims...])

Generate a normally-distributed random number with mean 0 and
standard deviation 1. Optionally generate an array of normally-
distributed random numbers.

"""
randn

doc"""
    randn!([rng], A::Array{Float64, N})

Fill the array A with normally-distributed (mean 0, standard
deviation 1) random numbers. Also see the rand function.

"""
randn!

doc"""
    randperm([rng], n)

Construct a random permutation of length "n". The optional
"rng" argument specifies a random number generator, see *Random
Numbers*.

"""
randperm

doc"""
    randstring([rng], len=8)

Create a random ASCII string of length "len", consisting of
upper- and lower-case letters and the digits 0-9. The optional
"rng" argument specifies a random number generator, see *Random
Numbers*.

"""
randstring

doc"""
    randsubseq(A, p) -> Vector

Return a vector consisting of a random subsequence of the given
array "A", where each element of "A" is included (in order)
with independent probability "p".   (Complexity is linear in
"p*length(A)", so this function is efficient even if "p" is
small and "A" is large.)  Technically, this process is known as
"Bernoulli sampling" of "A".

"""
randsubseq

doc"""
    randsubseq!(S, A, p)

Like "randsubseq", but the results are stored in "S" (which is
resized as needed).

"""
randsubseq!

doc"""
    range(start[, step], length)

Construct a range by length, given a starting value and optional
step (defaults to 1).

"""
range

doc"""
    rank(M)

Compute the rank of a matrix.

"""
rank

doc"""
    rationalize([Type=Int], x; tol=eps(x))

Approximate floating point number "x" as a Rational number with
components of the given integer type. The result will differ from
"x" by no more than "tol".

"""
rationalize

doc"""
    read(stream, type)

Read a value of the given type from a stream, in canonical binary
representation.

    read(stream, type, dims)

Read a series of values of the given type from a stream, in
canonical binary representation. "dims" is either a tuple or a
series of integer arguments specifying the size of "Array" to
return.

"""
read

doc"""
    read!(stream, array::Array)

Read binary data from a stream, filling in the argument "array".

"""
read!

doc"""
    readall(stream::IO)

Read the entire contents of an I/O stream as a string.

    readall(filename::AbstractString)

Open "filename", read the entire contents as a string, then close
the file. Equivalent to "open(readall, filename)".

"""
readall

doc"""
    readandwrite(command)

Starts running a command asynchronously, and returns a tuple
(stdout,stdin,process) of the output stream and input stream of the
process, and the process object itself.

"""
readandwrite

doc"""
    readavailable(stream)

Read all available data on the stream, blocking the task only if no
data is available. The result is a "Vector{UInt8,1}".

"""
readavailable

doc"""
    readbytes(stream, nb=typemax(Int))

Read at most "nb" bytes from the stream, returning a
"Vector{UInt8}" of the bytes read.

"""
readbytes

doc"""
    readbytes!(stream, b::Vector{UInt8}, nb=length(b))

Read at most "nb" bytes from the stream into "b", returning the
number of bytes read (increasing the size of "b" as needed).

"""
readbytes!

doc"""
    readchomp(x)

Read the entirety of x as a string but remove trailing newlines.
Equivalent to chomp(readall(x)).

"""
readchomp

doc"""
    readcsv(source, [T::Type]; options...)

Equivalent to "readdlm" with "delim" set to comma.

"""
readcsv

doc"""
    readdir([dir]) -> Vector{ByteString}

Returns the files and directories in the directory *dir* (or the
current working directory if not given).

"""
readdir

doc"""
    readdlm(source, delim::Char, T::Type, eol::Char; header=false, skipstart=0, skipblanks=true, use_mmap, ignore_invalid_chars=false, quotes=true, dims, comments=true, comment_char='#')

Read a matrix from the source where each line (separated by
"eol") gives one row, with elements separated by the given
delimeter. The source can be a text file, stream or byte array.
Memory mapped files can be used by passing the byte array
representation of the mapped segment as source.

If "T" is a numeric type, the result is an array of that type,
with any non-numeric elements as "NaN" for floating-point types,
or zero. Other useful values of "T" include "ASCIIString",
"AbstractString", and "Any".

If "header" is "true", the first row of data will be read as
header and the tuple "(data_cells, header_cells)" is returned
instead of only "data_cells".

Specifying "skipstart" will ignore the corresponding number of
initial lines from the input.

If "skipblanks" is "true", blank lines in the input will be
ignored.

If "use_mmap" is "true", the file specified by "source" is
memory mapped for potential speedups. Default is "true" except on
Windows. On Windows, you may want to specify "true" if the file
is large, and is only read once and not written to.

If "ignore_invalid_chars" is "true", bytes in "source" with
invalid character encoding will be ignored. Otherwise an error is
thrown indicating the offending character position.

If "quotes" is "true", column enclosed within double-quote (``)
characters are allowed to contain new lines and column delimiters.
Double-quote characters within a quoted field must be escaped with
another double-quote.

Specifying "dims" as a tuple of the expected rows and columns
(including header, if any) may speed up reading of large files.

If "comments" is "true", lines beginning with "comment_char"
and text following "comment_char" in any line are ignored.

    readdlm(source, delim::Char, eol::Char; options...)

If all data is numeric, the result will be a numeric array. If some
elements cannot be parsed as numbers, a cell array of numbers and
strings is returned.

    readdlm(source, delim::Char, T::Type; options...)

The end of line delimiter is taken as "\n".

    readdlm(source, delim::Char; options...)

The end of line delimiter is taken as "\n". If all data is
numeric, the result will be a numeric array. If some elements
cannot be parsed as numbers, a cell array of numbers and strings is
returned.

    readdlm(source, T::Type; options...)

The columns are assumed to be separated by one or more whitespaces.
The end of line delimiter is taken as "\n".

    readdlm(source; options...)

The columns are assumed to be separated by one or more whitespaces.
The end of line delimiter is taken as "\n". If all data is
numeric, the result will be a numeric array. If some elements
cannot be parsed as numbers, a cell array of numbers and strings is
returned.

"""
readdlm

doc"""
    readline(stream=STDIN)

Read a single line of text, including a trailing newline character
(if one is reached before the end of the input), from the given
"stream" (defaults to "STDIN"),

"""
readline

doc"""
    readlines(stream)

Read all lines as an array.

"""
readlines

doc"""
    readlink(path) -> AbstractString

Returns the value of a symbolic link "path".

"""
readlink

doc"""
    readuntil(stream, delim)

Read a string, up to and including the given delimiter byte.

"""
readuntil

doc"""
    real(z)

Return the real part of the complex number "z"

"""
real

doc"""
    realmax(type)

The highest finite value representable by the given floating-point
type

"""
realmax

doc"""
    realmin(type)

The smallest in absolute value non-subnormal value representable by
the given floating-point type

"""
realmin

doc"""
    realpath(path::AbstractString) -> AbstractString

Canonicalize a path by expanding symbolic links and removing "."
and ".." entries.

"""
realpath

doc"""
    recv(socket::UDPSocket)

Read a UDP packet from the specified socket, and return the bytes
received. This call blocks.

"""
recv

doc"""
    recvfrom(socket::UDPSocket) -> (address, data)

Read a UDP packet from the specified socket, returning a tuple of
(address, data), where address will be either IPv4 or IPv6 as
appropriate.

"""
recvfrom

doc"""
    redirect_stderr([stream])

Like redirect_stdout, but for STDERR

"""
redirect_stderr

doc"""
    redirect_stdin([stream])

Like redirect_stdout, but for STDIN. Note that the order of the
return tuple is still (rd,wr), i.e. data to be read from STDIN, may
be written to wr.

"""
redirect_stdin

doc"""
    redirect_stdout()

Create a pipe to which all C and Julia level STDOUT output will be
redirected. Returns a tuple (rd,wr) representing the pipe ends.
Data written to STDOUT may now be read from the rd end of the pipe.
The wr end is given for convenience in case the old STDOUT object
was cached by the user and needs to be replaced elsewhere.

    redirect_stdout(stream)

Replace STDOUT by stream for all C and julia level output to
STDOUT. Note that *stream* must be a TTY, a Pipe or a TcpSocket.

"""
redirect_stdout

doc"""
    redisplay(x)
redisplay(d::Display, x)
redisplay(mime, x)
redisplay(d::Display, mime, x)

By default, the "redisplay" functions simply call "display".
However, some display backends may override "redisplay" to modify
an existing display of "x" (if any).   Using "redisplay" is
also a hint to the backend that "x" may be redisplayed several
times, and the backend may choose to defer the display until (for
example) the next interactive prompt.

"""
redisplay

doc"""
    reduce(op, v0, itr)

Reduce the given collection "ìtr" with the given binary operator
"op". "v0" must be a neutral element for "op" that will be
returned for empty collections. It is unspecified whether "v0" is
used for non-empty collections.

Reductions for certain commonly-used operators have special
implementations which should be used instead: "maximum(itr)",
"minimum(itr)", "sum(itr)", "prod(itr)", "any(itr)",
"all(itr)".

The associativity of the reduction is implementation dependent.
This means that you can't use non-associative operations like "-"
because it is undefined whether "reduce(-,[1,2,3])" should be
evaluated as "(1-2)-3" or "1-(2-3)". Use "foldl" or "foldr"
instead for guaranteed left or right associativity.

Some operations accumulate error, and parallelism will also be
easier if the reduction can be executed in groups. Future versions
of Julia might change the algorithm. Note that the elements are not
reordered if you use an ordered collection.

    reduce(op, itr)

Like "reduce(op, v0, itr)". This cannot be used with empty
collections, except for some special cases (e.g. when "op" is one
of "+", "*", "max", "min", "&", "|") when Julia can
determine the neutral element of "op".

"""
reduce

doc"""
    reducedim(f, A, dims[, initial])

Reduce 2-argument function "f" along dimensions of "A".
"dims" is a vector specifying the dimensions to reduce, and
"initial" is the initial value to use in the reductions. For *+*,
***, *max* and *min* the *initial* argument is optional.

The associativity of the reduction is implementation-dependent; if
you need a particular associativity, e.g. left-to-right, you should
write your own loop. See documentation for "reduce".

"""
reducedim

doc"""
    reenable_sigint(f::Function)

Re-enable Ctrl-C handler during execution of a function.
Temporarily reverses the effect of "disable_sigint".

"""
reenable_sigint

doc"""
    reim(z)

Return both the real and imaginary parts of the complex number
"z"

"""
reim

doc"""
    reinterpret(type, A)

Change the type-interpretation of a block of memory. For example,
"reinterpret(Float32, UInt32(7))" interprets the 4 bytes
corresponding to "UInt32(7)" as a "Float32". For arrays, this
constructs an array with the same binary data as the given array,
but with the specified element type.

"""
reinterpret

doc"""
    reload(file::AbstractString)

Like "require", except forces loading of files regardless of
whether they have been loaded before. Typically used when
interactively developing libraries.

"""
reload

doc"""
    relpath(path::AbstractString, startpath::AbstractString = ".") -> AbstractString

Return a relative filepath to path either from the current
directory or from an optional start directory. This is a path
computation: the filesystem is not accessed to confirm the
existence or nature of path or startpath.

"""
relpath

doc"""
    rem(x, y)
%(x, y)

Remainder from Euclidean division, returning a value of the same
sign as``x``, and smaller in magnitude than "y". This value is
always exact.

"""
rem

doc"""
    rem1(x, m)

Remainder after division, returning in the range (0,m]

"""
rem1

doc"""
    remotecall(id, func, args...)

Call a function asynchronously on the given arguments on the
specified process. Returns a "RemoteRef".

"""
remotecall

doc"""
    remotecall_fetch(id, func, args...)

Perform "fetch(remotecall(...))" in one message.

"""
remotecall_fetch

doc"""
    remotecall_wait(id, func, args...)

Perform "wait(remotecall(...))" in one message.

"""
remotecall_wait

doc"""
    repeat(A, inner = Int[], outer = Int[])

Construct an array by repeating the entries of "A". The i-th
element of "inner" specifies the number of times that the
individual entries of the i-th dimension of "A" should be
repeated. The i-th element of "outer" specifies the number of
times that a slice along the i-th dimension of "A" should be
repeated.

"""
repeat

doc"""
    repeated(x[, n::Int])

An iterator that generates the value "x" forever. If "n" is
specified, generates "x" that many times (equivalent to
"take(repeated(x), n)").

"""
repeated

doc"""
    replace(string, pat, r[, n])

Search for the given pattern "pat", and replace each occurrence
with "r". If "n" is provided, replace at most "n"
occurrences.  As with search, the second argument may be a single
character, a vector or a set of characters, a string, or a regular
expression. If "r" is a function, each occurrence is replaced
with "r(s)" where "s" is the matched substring.

"""
replace

doc"""
    repmat(A, n, m)

Construct a matrix by repeating the given matrix "n" times in
dimension 1 and "m" times in dimension 2.

"""
repmat

doc"""
    repr(x)

Create a string from any value using the "showall" function.

"""
repr

doc"""
    reprmime(mime, x)

Returns an "AbstractString" or "Vector{UInt8}" containing the
representation of "x" in the requested "mime" type, as written
by "writemime" (throwing a "MethodError" if no appropriate
"writemime" is available).  An "AbstractString" is returned for
MIME types with textual representations (such as ""text/html""
or ""application/postscript""), whereas binary data is returned
as "Vector{UInt8}".  (The function "istext(mime)" returns
whether or not Julia treats a given "mime" type as text.)

As a special case, if "x" is an "AbstractString" (for textual
MIME types) or a "Vector{UInt8}" (for binary MIME types), the
"reprmime" function assumes that "x" is already in the
requested "mime" format and simply returns "x".

"""
reprmime

doc"""
    require(file::AbstractString...)

Load source files once, in the context of the "Main" module, on
every active node, searching standard locations for files.
"require" is considered a top-level operation, so it sets the
current "include" path but does not use it to search for files
(see help for "include"). This function is typically used to load
library code, and is implicitly called by "using" to load
packages.

When searching for files, "require" first looks in the current
working directory, then looks for package code under "Pkg.dir()",
then tries paths in the global array "LOAD_PATH".

"""
require

doc"""
    reset(s)

Reset a stream "s" to a previously marked position, and remove
the mark. Returns the previously marked position. Throws an error
if the stream is not marked.

See also "mark()", "unmark()", "ismarked()"

"""
reset

doc"""
    reshape(A, dims)

Create an array with the same data as the given array, but with
different dimensions. An implementation for a particular type of
array may choose whether the data is copied or shared.

"""
reshape

doc"""
    resize!(collection, n) -> collection

Resize "collection" to contain "n" elements. If "n" is
smaller than the current collection length, the first "n"
elements will be retained. If "n" is larger, the new elements are
not guaranteed to be initialized.

    julia> resize!([6, 5, 4, 3, 2, 1], 3)
    3-element Array{Int64,1}:
     6
     5
     4

    julia> resize!([6, 5, 4, 3, 2, 1], 8)
    8-element Array{Int64,1}:
     6
     5
     4
     3
     2
     1
     0
     0

"""
resize!

doc"""
    rest(iter, state)

An iterator that yields the same elements as "iter", but starting
at the given "state".

"""
rest

doc"""
    rethrow([e])

Throw an object without changing the current exception backtrace.
The default argument is the current exception (if called within a
"catch" block).

"""
rethrow

doc"""
    reverse(v[, start=1[, stop=length(v)]])

Return a copy of "v" reversed from start to stop.

"""
reverse

doc"""
    reverse!(v[, start=1[, stop=length(v)]]) -> v

In-place version of "reverse()".

"""
reverse!

doc"""
    reverseind(v, i)

Given an index "i" in "reverse(v)", return the corresponding
index in "v" so that "v[reverseind(v,i)] == reverse(v)[i]".
(This can be nontrivial in the case where "v" is a Unicode
string.)

"""
reverseind

doc"""
    rfft(A[, dims])

Multidimensional FFT of a real array A, exploiting the fact that
the transform has conjugate symmetry in order to save roughly half
the computational time and storage costs compared with "fft()".
If "A" has size "(n_1, ..., n_d)", the result has size
"(floor(n_1/2)+1, ..., n_d)".

The optional "dims" argument specifies an iterable subset of one
or more dimensions of "A" to transform, similar to "fft()".
Instead of (roughly) halving the first dimension of "A" in the
result, the "dims[1]" dimension is (roughly) halved in the same
way.

"""
rfft

doc"""
    rm(path::AbstractString; recursive=false)

Delete the file, link, or empty directory at the given path. If
"recursive=true" is passed and the path is a directory, then all
contents are removed recursively.

"""
rm

doc"""
    rmprocs(pids...)

Removes the specified workers.

"""
rmprocs

doc"""
    rol(B::BitArray{1}, i::Integer) -> BitArray{1}

Performs a left rotation operation.

"""
rol

doc"""
    rol!(dest::BitArray{1}, src::BitArray{1}, i::Integer) -> BitArray{1}

Performs a left rotation operation on "src" and put the result
into "dest".

    rol!(B::BitArray{1}, i::Integer) -> BitArray{1}

Performs a left rotation operation on B.

"""
rol!

doc"""
    ror(B::BitArray{1}, i::Integer) -> BitArray{1}

Performs a right rotation operation.

"""
ror

doc"""
    ror!(dest::BitArray{1}, src::BitArray{1}, i::Integer) -> BitArray{1}

Performs a right rotation operation on "src" and put the result
into "dest".

    ror!(B::BitArray{1}, i::Integer) -> BitArray{1}

Performs a right rotation operation on B.

"""
ror!

doc"""
    rot180(A)

Rotate matrix "A" 180 degrees.

    rot180(A, k)

Rotate matrix "A" 180 degrees an integer "k" number of times.
If "k" is even, this is equivalent to a "copy".

"""
rot180

doc"""
    rotl90(A)

Rotate matrix "A" left 90 degrees.

    rotl90(A, k)

Rotate matrix "A" left 90 degrees an integer "k" number of
times. If "k" is zero or a multiple of four, this is equivalent
to a "copy".

"""
rotl90

doc"""
    rotr90(A)

Rotate matrix "A" right 90 degrees.

    rotr90(A, k)

Rotate matrix "A" right 90 degrees an integer "k" number of
times. If "k" is zero or a multiple of four, this is equivalent
to a "copy".

"""
rotr90

doc"""
    round([T], x[, digits[, base]][, r::RoundingMode])

"round(x)" rounds "x" to an integer value according to the
default rounding mode (see "get_rounding()"), returning a value
of the same type as "x". By default ("RoundNearest"), this will
round to the nearest integer, with ties (fractional values of 0.5)
being rounded to the even integer.

    julia> round(1.7)
    2.0

    julia> round(1.5)
    2.0

    julia> round(2.5)
    2.0

The optional "RoundingMode" argument will change how the number
gets rounded.

"round(T, x, [r::RoundingMode])" converts the result to type
"T", throwing an "InexactError" if the value is not
representable.

"round(x, digits)" rounds to the specified number of digits after
the decimal place (or before if negative). "round(x, digits,
base)" rounds using a base other than 10.

       julia> round(pi, 2)
       3.14

       julia> round(pi, 3, 2)
       3.125

Note: Rounding to specified digits in bases other than 2 can be
  inexact when operating on binary floating point numbers. For
  example, the "Float64" value represented by "1.15" is
  actually *less* than 1.15, yet will be rounded to 1.2.

      julia> x = 1.15
      1.15

      julia> @sprintf "%.20f" x
      "1.14999999999999991118"

      julia> x < 115//100
      true

      julia> round(x, 1)
      1.2

    round(z, RoundingModeReal, RoundingModeImaginary)

Returns the nearest integral value of the same type as the complex-
valued "z" to "z", breaking ties using the specified
"RoundingMode"s. The first "RoundingMode" is used for rounding
the real components while the second is used for rounding the
imaginary components.

"""
round

doc"""
    rowvals(A)

Return a vector of the row indices of "A", and any modifications
to the returned vector will mutate "A" as well. Given the
internal storage format of sparse matrices, providing access to how
the row indices are stored internally can be useful in conjuction
with iterating over structural nonzero values. See "nonzeros(A)"
and "nzrange(A, col)".

"""
rowvals

doc"""
    rpad(string, n, p)

Make a string at least "n" columns wide when printed, by padding
on the right with copies of "p".

"""
rpad

doc"""
    rsearch(string, chars[, start])

Similar to "search", but returning the last occurrence of the
given characters within the given string, searching in reverse from
"start".

"""
rsearch

doc"""
    rsearchindex(string, substring[, start])

Similar to "rsearch", but return only the start index at which
the substring is found, or 0 if it is not.

"""
rsearchindex

doc"""
    rsplit(string, [chars]; limit=0, keep=true)

Similar to "split", but starting from the end of the string.

"""
rsplit

doc"""
    rstrip(string[, chars])

Return "string" with any trailing whitespace removed. If
"chars" (a character, or vector or set of characters) is
provided, instead remove characters contained in it.

"""
rstrip

doc"""
    run(command)

Run a command object, constructed with backticks. Throws an error
if anything goes wrong, including the process exiting with a non-
zero status.

"""
run

doc"""
    runtests([tests=["all"][, numcores=iceil(CPU_CORES/2)]])

Run the Julia unit tests listed in "tests", which can be either a
string or an array of strings, using "numcores" processors. (not
exported)

"""
runtests

doc"""
    scale(A, b)

    scale(b, A)

Scale an array "A" by a scalar "b", returning a new array.

If "A" is a matrix and "b" is a vector, then "scale(A,b)"
scales each column "i" of "A" by "b[i]" (similar to
"A*diagm(b)"), while "scale(b,A)" scales each row "i" of
"A" by "b[i]" (similar to "diagm(b)*A"), returning a new
array.

Note: for large "A", "scale" can be much faster than "A .* b"
or "b .* A", due to the use of BLAS.

"""
scale

doc"""
    scale!(A, b)

    scale!(b, A)

Scale an array "A" by a scalar "b", similar to "scale()" but
overwriting "A" in-place.

If "A" is a matrix and "b" is a vector, then "scale!(A,b)"
scales each column "i" of "A" by "b[i]" (similar to
"A*diagm(b)"), while "scale!(b,A)" scales each row "i" of
"A" by "b[i]" (similar to "diagm(b)*A"), again operating in-
place on "A".

"""
scale!

doc"""
    schedule(t::Task, [val]; error=false)

Add a task to the scheduler's queue. This causes the task to run
constantly when the system is otherwise idle, unless the task
performs a blocking operation such as "wait".

If a second argument is provided, it will be passed to the task
(via the return value of "yieldto") when it runs again. If
"error" is true, the value is raised as an exception in the woken
task.

"""
schedule

doc"""
    schur(A) -> Schur[:T], Schur[:Z], Schur[:values]

See "schurfact()"

    schur(A, B) -> GeneralizedSchur[:S], GeneralizedSchur[:T], GeneralizedSchur[:Q], GeneralizedSchur[:Z]

See "schurfact()"

"""
schur

doc"""
    schurfact(A) -> Schur

Computes the Schur factorization of the matrix "A". The (quasi)
triangular Schur factor can be obtained from the "Schur" object
"F" with either "F[:Schur]" or "F[:T]" and the
unitary/orthogonal Schur vectors can be obtained with
"F[:vectors]" or "F[:Z]" such that
"A=F[:vectors]*F[:Schur]*F[:vectors]'". The eigenvalues of "A"
can be obtained with "F[:values]".

    schurfact(A, B) -> GeneralizedSchur

Computes the Generalized Schur (or QZ) factorization of the
matrices "A" and "B". The (quasi) triangular Schur factors can
be obtained from the "Schur" object "F" with "F[:S]" and
"F[:T]", the left unitary/orthogonal Schur vectors can be
obtained with "F[:left]" or "F[:Q]" and the right
unitary/orthogonal Schur vectors can be obtained with "F[:right]"
or "F[:Z]" such that "A=F[:left]*F[:S]*F[:right]'" and
"B=F[:left]*F[:T]*F[:right]'". The generalized eigenvalues of
"A" and "B" can be obtained with "F[:alpha]./F[:beta]".

"""
schurfact

doc"""
    schurfact!(A)

Computes the Schur factorization of "A", overwriting "A" in the
process. See "schurfact()"

"""
schurfact!

doc"""
    sdata(S::SharedArray)

Returns the actual "Array" object backing "S"

"""
sdata

doc"""
    search(string, chars[, start])

Search for the first occurrence of the given characters within the
given string. The second argument may be a single character, a
vector or a set of characters, a string, or a regular expression
(though regular expressions are only allowed on contiguous strings,
such as ASCII or UTF-8 strings). The third argument optionally
specifies a starting index. The return value is a range of indexes
where the matching sequence is found, such that "s[search(s,x)] ==
x":

"search(string, "substring")" = "start:end" such that
"string[start:end] == "substring"", or "0:-1" if unmatched.

"search(string, 'c')"         = "index" such that
"string[index] == 'c'", or "0" if unmatched.

"""
search

doc"""
    searchindex(string, substring[, start])

Similar to "search", but return only the start index at which the
substring is found, or 0 if it is not.

"""
searchindex

doc"""
    searchsorted(a, x, [by=<transform>,] [lt=<comparison>,] [rev=false])

Returns the range of indices of "a" which compare as equal to
"x" according to the order specified by the "by", "lt" and
"rev" keywords, assuming that "a" is already sorted in that
order. Returns an empty range located at the insertion point if
"a" does not contain values equal to "x".

"""
searchsorted

doc"""
    searchsortedfirst(a, x, [by=<transform>,] [lt=<comparison>,] [rev=false])

Returns the index of the first value in "a" greater than or equal
to "x", according to the specified order. Returns "length(a)+1"
if "x" is greater than all values in "a".

"""
searchsortedfirst

doc"""
    searchsortedlast(a, x, [by=<transform>,] [lt=<comparison>,] [rev=false])

Returns the index of the last value in "a" less than or equal to
"x", according to the specified order. Returns "0" if "x" is
less than all values in "a".

"""
searchsortedlast

doc"""
    sec(x)

Compute the secant of "x", where "x" is in radians

"""
sec

doc"""
    secd(x)

Compute the secant of "x", where "x" is in degrees

"""
secd

doc"""
    sech(x)

Compute the hyperbolic secant of "x"

"""
sech

doc"""
    seek(s, pos)

Seek a stream to the given position.

"""
seek

doc"""
    seekend(s)

Seek a stream to its end.

"""
seekend

doc"""
    seekstart(s)

Seek a stream to its beginning.

"""
seekstart

doc"""
    select(v, k, [by=<transform>,] [lt=<comparison>,] [rev=false])

Variant of "select!" which copies "v" before partially sorting
it, thereby returning the same thing as "select!" but leaving
"v" unmodified.

"""
select

doc"""
    select!(v, k, [by=<transform>,] [lt=<comparison>,] [rev=false])

Partially sort the vector "v" in place, according to the order
specified by "by", "lt" and "rev" so that the value at index
"k" (or range of adjacent values if "k" is a range) occurs at
the position where it would appear if the array were fully sorted
via a non-stable algorithm. If "k" is a single index, that value
is returned; if "k" is a range, an array of values at those
indices is returned. Note that "select!" does not fully sort the
input array.

"""
select!

doc"""
    send(socket::UDPSocket, host::IPv4, port::Integer, msg)

Send "msg" over "socket to ``host:port".

"""
send

doc"""
    serialize(stream, value)

Write an arbitrary value to a stream in an opaque format, such that
it can be read back by "deserialize". The read-back value will be
as identical as possible to the original. In general, this process
will not work if the reading and writing are done by different
versions of Julia, or an instance of Julia with a different system
image.

"""
serialize

doc"""
    set_bigfloat_precision(x::Int64)

Set the precision (in bits) to be used to BigFloat arithmetic.

"""
set_bigfloat_precision

doc"""
    set_rounding(T, mode)

Set the rounding mode of floating point type "T", controlling the
rounding of basic arithmetic functions ("+()", "-()", "*()",
"/()" and "sqrt()") and type conversion.

Note that this may affect other types, for instance changing the
rounding mode of "Float64" will change the rounding mode of
"Float32". See "get_rounding" for available modes

"""
set_rounding

doc"""
    setdiff(s1, s2)

Construct the set of elements in "s1" but not "s2". Maintains
order with arrays. Note that both arguments must be collections,
and both will be iterated over. In particular,
"setdiff(set,element)" where "element" is a potential member of
"set", will not work in general.

"""
setdiff

doc"""
    setdiff!(s, iterable)

Remove each element of "iterable" from set "s" in-place.

"""
setdiff!

doc"""
    setenv(command, env; dir=working_dir)

Set environment variables to use when running the given command.
"env" is either a dictionary mapping strings to strings, an array
of strings of the form ""var=val"", or zero or more
""var"=>val" pair arguments.  In order to modify (rather than
replace) the existing environment, create "env" by "copy(ENV)"
and then setting "env["var"]=val" as desired, or use
"withenv".

The "dir" keyword argument can be used to specify a working
directory for the command.

"""
setenv

doc"""
    setfield!(value, name::Symbol, x)

Assign "x" to a named field in "value" of composite type. The
syntax "a.b = c" calls "setfield!(a, :b, c)", and the syntax
"a.(b) = c" calls "setfield!(a, b, c)".

"""
setfield!

doc"""
    setindex!(A, X, inds...)

Store values from array "X" within some subset of "A" as
specified by "inds".

    setindex!(collection, value, key...)

Store the given value at the given key or index within a
collection. The syntax "a[i,j,...] = x" is converted by the
compiler to "setindex!(a, x, i, j, ...)".

"""
setindex!

doc"""
    setopt(sock::UDPSocket; multicast_loop = nothing, multicast_ttl=nothing, enable_broadcast=nothing, ttl=nothing)

Set UDP socket options. "multicast_loop": loopback for multicast
packets (default: true). "multicast_ttl": TTL for multicast
packets. "enable_broadcast": flag must be set to true if socket
will be used for broadcast messages, or else the UDP system will
return an access error (default: false). "ttl": Time-to-live of
packets sent on the socket.

"""
setopt

doc"""
    shift!(collection) -> item

Remove the first "item" from "collection".

    julia> A = [1, 2, 3, 4, 5, 6]
    6-element Array{Int64,1}:
     1
     2
     3
     4
     5
     6

    julia> shift!(A)
    1

    julia> A
    5-element Array{Int64,1}:
     2
     3
     4
     5
     6

"""
shift!

doc"""
    show(x)

Write an informative text representation of a value to the current
output stream. New types should overload "show(io, x)" where the
first argument is a stream. The representation used by "show"
generally includes Julia-specific formatting and type information.

"""
show

doc"""
    showall(x)

Similar to "show", except shows all elements of arrays.

"""
showall

doc"""
    showcompact(x)

Show a more compact representation of a value. This is used for
printing array elements. If a new type has a different compact
representation, it should overload "showcompact(io, x)" where the
first argument is a stream.

"""
showcompact

doc"""
    showerror(io, e)

Show a descriptive representation of an exception object.

"""
showerror

doc"""
    shuffle([rng], v)

Return a randomly permuted copy of "v". The optional "rng"
argument specifies a random number generator, see *Random Numbers*.

"""
shuffle

doc"""
    shuffle!([rng], v)

In-place version of "shuffle()".

"""
shuffle!

doc"""
    sign(x)

Return "+1" if "x" is positive, "0" if "x == 0", and "-1"
if "x" is negative.

"""
sign

doc"""
    signbit(x)

Returns "true" if the value of the sign of "x" is negative,
otherwise "false".

"""
signbit

doc"""
    signed(x)

Convert a number to a signed integer. If the argument is unsigned,
it is reinterpreted as signed without checking for overflow.

"""
signed

doc"""
    signif(x, digits[, base])

Rounds (in the sense of "round") "x" so that there are
"digits" significant digits, under a base "base"
representation, default 10. E.g., "signif(123.456, 2)" is
"120.0", and "signif(357.913, 4, 2)" is "352.0".

"""
signif

doc"""
    significand(x)

Extract the significand(s) (a.k.a. mantissa), in binary
representation, of a floating-point number or array. If "x" is a
non-zero finite number, than the result will be a number of the
same type on the interval [1,2). Otherwise "x" is returned.

    julia> significand(15.2)/15.2
    0.125

    julia> significand(15.2)*8
    15.2

"""
significand

doc"""
    similar(array, element_type, dims)

Create an uninitialized array of the same type as the given array,
but with the specified element type and dimensions. The second and
third arguments are both optional. The "dims" argument may be a
tuple or a series of integer arguments. For some special
"AbstractArray" objects which are not real containers (like
ranges), this function returns a standard "Array" to allow
operating on elements.

"""
similar

doc"""
    sin(x)

Compute sine of "x", where "x" is in radians

"""
sin

doc"""
    sinc(x)

Compute \sin(\pi x) / (\pi x) if x \neq 0, and 1 if x = 0.

"""
sinc

doc"""
    sind(x)

Compute sine of "x", where "x" is in degrees

"""
sind

doc"""
    sinh(x)

Compute hyperbolic sine of "x"

"""
sinh

doc"""
    sinpi(x)

Compute \sin(\pi x) more accurately than "sin(pi*x)",
especially for large "x".

"""
sinpi

doc"""
    size(A[, dim...])

Returns a tuple containing the dimensions of A. Optionally you can
specify the dimension(s) you want the length of, and get the length
of that dimension, or a tuple of the lengths of dimensions you
asked for.:

    julia> A = rand(2,3,4);

    julia> size(A, 2)
    3

    julia> size(A,3,2)
    (4,3)

"""
size

doc"""
    sizehint!(s, n)

Suggest that collection "s" reserve capacity for at least "n"
elements. This can improve performance.

"""
sizehint!

doc"""
    sizeof(type)

Size, in bytes, of the canonical binary representation of the given
type, if any.

    sizeof(s::AbstractString)

The number of bytes in string "s".

"""
sizeof

doc"""
    skip(s, offset)

Seek a stream relative to the current position.

"""
skip

doc"""
    skipchars(stream, predicate; linecomment::Char)

Advance the stream until before the first character for which
"predicate" returns false. For example "skipchars(stream,
isspace)" will skip all whitespace. If keyword argument
"linecomment" is specified, characters from that character
through the end of a line will also be skipped.

"""
skipchars

doc"""
    sleep(seconds)

Block the current task for a specified number of seconds. The
minimum sleep time is 1 millisecond or input of "0.001".

"""
sleep

doc"""
    slice(A, inds...)

Returns a view of array "A" with the given indices like
"sub()", but drops all dimensions indexed with scalars.

"""
slice

doc"""
    slicedim(A, d, i)

Return all the data of "A" where the index for dimension "d"
equals "i". Equivalent to "A[:,:,...,i,:,:,...]" where "i" is
in position "d".

"""
slicedim

doc"""
    sort(v, [alg=<algorithm>,] [by=<transform>,] [lt=<comparison>,] [rev=false])

Variant of "sort!" that returns a sorted copy of "v" leaving
"v" itself unmodified.

    sort(A, dim, [alg=<algorithm>,] [by=<transform>,] [lt=<comparison>,] [rev=false])

Sort a multidimensional array "A" along the given dimension.

"""
sort

doc"""
    sort!(v, [alg=<algorithm>,] [by=<transform>,] [lt=<comparison>,] [rev=false])

Sort the vector "v" in place. "QuickSort" is used by default
for numeric arrays while "MergeSort" is used for other arrays.
You can specify an algorithm to use via the "alg" keyword (see
Sorting Algorithms for available algorithms). The "by" keyword
lets you provide a function that will be applied to each element
before comparison; the "lt" keyword allows providing a custom
"less than" function; use "rev=true" to reverse the sorting
order. These options are independent and can be used together in
all possible combinations: if both "by" and "lt" are specified,
the "lt" function is applied to the result of the "by"
function; "rev=true" reverses whatever ordering specified via the
"by" and "lt" keywords.

"""
sort!

doc"""
    sortcols(A, [alg=<algorithm>,] [by=<transform>,] [lt=<comparison>,] [rev=false])

Sort the columns of matrix "A" lexicographically.

"""
sortcols

doc"""
    sortperm(v, [alg=<algorithm>,] [by=<transform>,] [lt=<comparison>,] [rev=false])

Return a permutation vector of indices of "v" that puts it in
sorted order. Specify "alg" to choose a particular sorting
algorithm (see Sorting Algorithms). "MergeSort" is used by
default, and since it is stable, the resulting permutation will be
the lexicographically first one that puts the input array into
sorted order – i.e. indices of equal elements appear in ascending
order. If you choose a non-stable sorting algorithm such as
"QuickSort", a different permutation that puts the array into
order may be returned. The order is specified using the same
keywords as "sort!".

See also "sortperm!()"

"""
sortperm

doc"""
    sortperm!(ix, v, [alg=<algorithm>,] [by=<transform>,] [lt=<comparison>,] [rev=false,] [initialized=false])

Like "sortperm", but accepts a preallocated index vector "ix".
If "initialized" is "false" (the default), ix is initialized to
contain the values "1:length(v)".

See also "sortperm()"

"""
sortperm!

doc"""
    sortrows(A, [alg=<algorithm>,] [by=<transform>,] [lt=<comparison>,] [rev=false])

Sort the rows of matrix "A" lexicographically.

"""
sortrows

doc"""
    sparse(I, J, V[, m, n, combine])

Create a sparse matrix "S" of dimensions "m x n" such that
"S[I[k], J[k]] = V[k]". The "combine" function is used to
combine duplicates. If "m" and "n" are not specified, they are
set to "max(I)" and "max(J)" respectively. If the "combine"
function is not supplied, duplicates are added by default.

    sparse(A)

Convert an AbstractMatrix "A" into a sparse matrix.

"""
sparse

doc"""
    sparsevec(I, V[, m, combine])

Create a sparse matrix "S" of size "m x 1" such that "S[I[k]]
= V[k]". Duplicates are combined using the "combine" function,
which defaults to "+" if it is not provided. In julia, sparse
vectors are really just sparse matrices with one column. Given
Julia's Compressed Sparse Columns (CSC) storage format, a sparse
column matrix with one column is sparse, whereas a sparse row
matrix with one row ends up being dense.

    sparsevec(D::Dict[, m])

Create a sparse matrix of size "m x 1" where the row values are
keys from the dictionary, and the nonzero values are the values
from the dictionary.

    sparsevec(A)

Convert a dense vector "A" into a sparse matrix of size "m x
1". In julia, sparse vectors are really just sparse matrices with
one column.

"""
sparsevec

doc"""
    spawn(command)

Run a command object asynchronously, returning the resulting
"Process" object.

"""
spawn

doc"""
    spdiagm(B, d[, m, n])

Construct a sparse diagonal matrix. "B" is a tuple of vectors
containing the diagonals and "d" is a tuple containing the
positions of the diagonals. In the case the input contains only one
diagonaly, "B" can be a vector (instead of a tuple) and "d" can
be the diagonal position (instead of a tuple), defaulting to 0
(diagonal). Optionally, "m" and "n" specify the size of the
resulting sparse matrix.

"""
spdiagm

doc"""
    speye(type, m[, n])

Create a sparse identity matrix of specified type of size "m x
m". In case "n" is supplied, create a sparse identity matrix of
size "m x n".

"""
speye

doc"""
    splice!(collection, index[, replacement]) -> item

Remove the item at the given index, and return the removed item.
Subsequent items are shifted down to fill the resulting gap. If
specified, replacement values from an ordered collection will be
spliced in place of the removed item.

    julia> A = [6, 5, 4, 3, 2, 1]; splice!(A, 5)
    2

    julia> A
    5-element Array{Int64,1}:
     6
     5
     4
     3
     1

    julia> splice!(A, 5, -1)
    1

    julia> A
    5-element Array{Int64,1}:
      6
      5
      4
      3
     -1

    julia> splice!(A, 1, [-1, -2, -3])
    6

    julia> A
    7-element Array{Int64,1}:
     -1
     -2
     -3
      5
      4
      3
     -1

To insert "replacement" before an index "n" without removing
any items, use "splice!(collection, n:n-1, replacement)".

    splice!(collection, range[, replacement]) -> items

Remove items in the specified index range, and return a collection
containing the removed items. Subsequent items are shifted down to
fill the resulting gap. If specified, replacement values from an
ordered collection will be spliced in place of the removed items.

To insert "replacement" before an index "n" without removing
any items, use "splice!(collection, n:n-1, replacement)".

    julia> splice!(A, 4:3, 2)
    0-element Array{Int64,1}

    julia> A
    8-element Array{Int64,1}:
     -1
     -2
     -3
      2
      5
      4
      3
     -1

"""
splice!

doc"""
    split(string, [chars]; limit=0, keep=true)

Return an array of substrings by splitting the given string on
occurrences of the given character delimiters, which may be
specified in any of the formats allowed by "search"'s second
argument (i.e. a single character, collection of characters,
string, or regular expression). If "chars" is omitted, it
defaults to the set of all space characters, and "keep" is taken
to be false. The two keyword arguments are optional: they are are a
maximum size for the result and a flag determining whether empty
fields should be kept in the result.

"""
split

doc"""
    splitdir(path::AbstractString) -> (AbstractString, AbstractString)

Split a path into a tuple of the directory name and file name.

"""
splitdir

doc"""
    splitdrive(path::AbstractString) -> (AbstractString, AbstractString)

On Windows, split a path into the drive letter part and the path
part. On Unix systems, the first component is always the empty
string.

"""
splitdrive

doc"""
    splitext(path::AbstractString) -> (AbstractString, AbstractString)

If the last component of a path contains a dot, split the path into
everything before the dot and everything including and after the
dot. Otherwise, return a tuple of the argument unmodified and the
empty string.

"""
splitext

doc"""
    spones(S)

Create a sparse matrix with the same structure as that of "S",
but with every nonzero element having the value "1.0".

"""
spones

doc"""
    sprand([rng], m, n, p[, rfn])

Create a random "m" by "n" sparse matrix, in which the
probability of any element being nonzero is independently given by
"p" (and hence the mean density of nonzeros is also exactly
"p"). Nonzero values are sampled from the distribution specified
by "rfn". The uniform distribution is used in case "rfn" is not
specified. The optional "rng" argument specifies a random number
generator, see *Random Numbers*.

"""
sprand

doc"""
    sprandbool(m, n, p)

Create a random "m" by "n" sparse boolean matrix with the
specified (independent) probability "p" of any entry being
"true".

"""
sprandbool

doc"""
    sprandn(m, n, p)

Create a random "m" by "n" sparse matrix with the specified
(independent) probability "p" of any entry being nonzero, where
nonzero values are sampled from the normal distribution.

"""
sprandn

doc"""
    sprint(f::Function, args...)

Call the given function with an I/O stream and the supplied extra
arguments. Everything written to this I/O stream is returned as a
string.

"""
sprint

doc"""
    spzeros(m, n)

Create a sparse matrix of size "m x n". This sparse matrix will
not contain any nonzero values. No storage will be allocated for
nonzero values during construction.

"""
spzeros

doc"""
    sqrt(x)

Return \sqrt{x}. Throws "DomainError" for negative "Real"
arguments. Use complex negative arguments instead.  The prefix
operator "√" is equivalent to "sqrt".

"""
sqrt

doc"""
    sqrtm(A)

Compute the matrix square root of "A". If "B = sqrtm(A)", then
"B*B == A" within roundoff error.

"sqrtm" uses a polyalgorithm, computing the matrix square root
using Schur factorizations ("schurfact()") unless it detects the
matrix to be Hermitian or real symmetric, in which case it computes
the matrix square root from an eigendecomposition ("eigfact()").
In the latter situation for positive definite matrices, the matrix
square root has "Real" elements, otherwise it has "Complex"
elements.

"""
sqrtm

doc"""
    squeeze(A, dims)

Remove the dimensions specified by "dims" from array "A".
Elements of "dims" must be unique and within the range
"1:ndims(A)".

"""
squeeze

doc"""
    srand([rng][, seed])

Reseed the random number generator. If a "seed" is provided, the
RNG will give a reproducible sequence of numbers, otherwise Julia
will get entropy from the system. For "MersenneTwister", the
"seed" may be a non-negative integer, a vector of "UInt32"
integers or a filename, in which case the seed is read from a file.
"RandomDevice" does not support seeding.

"""
srand

doc"""
    start(iter) -> state

Get initial iteration state for an iterable object

"""
start

doc"""
    startswith(string, prefix | chars)

Returns "true" if "string" starts with "prefix". If the
second argument is a vector or set of characters, tests whether the
first character of "string" belongs to that set.

"""
startswith

doc"""
    stat(file)

Returns a structure whose fields contain information about the
file. The fields of the structure are:

    +-----------+------------------------------------------------------------------------+
    | size      | The size (in bytes) of the file                                        |
    +-----------+------------------------------------------------------------------------+
    | device    | ID of the device that contains the file                                |
    +-----------+------------------------------------------------------------------------+
    | inode     | The inode number of the file                                           |
    +-----------+------------------------------------------------------------------------+
    | mode      | The protection mode of the file                                        |
    +-----------+------------------------------------------------------------------------+
    | nlink     | The number of hard links to the file                                   |
    +-----------+------------------------------------------------------------------------+
    | uid       | The user id of the owner of the file                                   |
    +-----------+------------------------------------------------------------------------+
    | gid       | The group id of the file owner                                         |
    +-----------+------------------------------------------------------------------------+
    | rdev      | If this file refers to a device, the ID of the device it refers to     |
    +-----------+------------------------------------------------------------------------+
    | blksize   | The file-system preferred block size for the file                      |
    +-----------+------------------------------------------------------------------------+
    | blocks    | The number of such blocks allocated                                    |
    +-----------+------------------------------------------------------------------------+
    | mtime     | Unix timestamp of when the file was last modified                      |
    +-----------+------------------------------------------------------------------------+
    | ctime     | Unix timestamp of when the file was created                            |
    +-----------+------------------------------------------------------------------------+

"""
stat

doc"""
    std(v[, region])

Compute the sample standard deviation of a vector or array "v",
optionally along dimensions in "region". The algorithm returns an
estimator of the generative distribution's standard deviation under
the assumption that each entry of "v" is an IID drawn from that
generative distribution. This computation is equivalent to
calculating "sqrt(sum((v - mean(v)).^2) / (length(v) - 1))".
Note: Julia does not ignore "NaN" values in the computation. For
applications requiring the handling of missing data, the
"DataArray" package is recommended.

"""
std

doc"""
    stdm(v, m)

Compute the sample standard deviation of a vector "v" with known
mean "m". Note: Julia does not ignore "NaN" values in the
computation.

"""
stdm

doc"""
    step(r)

Get the step size of a "Range" object.

"""
step

doc"""
    stride(A, k)

Returns the distance in memory (in number of elements) between
adjacent elements in dimension k

"""
stride

doc"""
    strides(A)

Returns a tuple of the memory strides in each dimension

"""
strides

doc"""
    string(xs...)

Create a string from any values using the "print" function.

"""
string

doc"""
    stringmime(mime, x)

Returns an "AbstractString" containing the representation of
"x" in the requested "mime" type.  This is similar to
"reprmime" except that binary data is base64-encoded as an ASCII
string.

"""
stringmime

doc"""
    strip(string[, chars])

Return "string" with any leading and trailing whitespace removed.
If "chars" (a character, or vector or set of characters) is
provided, instead remove characters contained in it.

"""
strip

doc"""
    strwidth(s)

Gives the number of columns needed to print a string.

"""
strwidth

doc"""
    sub(A, inds...)

Like "getindex()", but returns a view into the parent array "A"
with the given indices instead of making a copy.  Calling
"getindex()" or "setindex!()" on the returned "SubArray"
computes the indices to the parent array on the fly without
checking bounds.

"""
sub

doc"""
    sub2ind(dims, i, j, k...) -> index

The inverse of "ind2sub", returns the linear index corresponding
to the provided subscripts

"""
sub2ind

doc"""
    subtypes(T::DataType)

Return a list of immediate subtypes of DataType T.  Note that all
currently loaded subtypes are included, including those not visible
in the current module.

"""
subtypes

doc"""
    success(command)

Run a command object, constructed with backticks, and tell whether
it was successful (exited with a code of 0). An exception is raised
if the process cannot be started.

"""
success

doc"""
    sum(itr)

Returns the sum of all elements in a collection.

    sum(A, dims)

Sum elements of an array over the given dimensions.

    sum(f, itr)

Sum the results of calling function "f" on each element of
"itr".

"""
sum

doc"""
    sum!(r, A)

Sum elements of "A" over the singleton dimensions of "r", and
write results to "r".

"""
sum!

doc"""
    sum_kbn(A)

Returns the sum of all array elements, using the Kahan-Babuska-
Neumaier compensated summation algorithm for additional accuracy.

"""
sum_kbn

doc"""
    sumabs(itr)

Sum absolute values of all elements in a collection. This is
equivalent to *sum(abs(itr))* but faster.

    sumabs(A, dims)

Sum absolute values of elements of an array over the given
dimensions.

"""
sumabs

doc"""
    sumabs!(r, A)

Sum absolute values of elements of "A" over the singleton
dimensions of "r", and write results to "r".

"""
sumabs!

doc"""
    sumabs2(itr)

Sum squared absolute values of all elements in a collection. This
is equivalent to *sum(abs2(itr))* but faster.

    sumabs2(A, dims)

Sum squared absolute values of elements of an array over the given
dimensions.

"""
sumabs2

doc"""
    sumabs2!(r, A)

Sum squared absolute values of elements of "A" over the singleton
dimensions of "r", and write results to "r".

"""
sumabs2!

doc"""
    summary(x)

Return a string giving a brief description of a value. By default
returns "string(typeof(x))". For arrays, returns strings like
"2x2 Float64 Array".

"""
summary

doc"""
    super(T::DataType)

Return the supertype of DataType T

"""
super

doc"""
    svd(A[, thin=true]) -> U, S, V

Wrapper around "svdfact" extracting all parts the factorization
to a tuple. Direct use of "svdfact" is therefore generally more
efficient. Computes the SVD of A, returning "U", vector "S",
and "V" such that "A == U*diagm(S)*V'". If "thin" is
"true", an economy mode decomposition is returned. The default is
to produce a thin decomposition.

    svd(A, B) -> U, V, Q, D1, D2, R0

Wrapper around "svdfact" extracting all parts the factorization
to a tuple. Direct use of "svdfact" is therefore generally more
efficient. The function returns the generalized SVD of "A" and
"B", returning "U", "V", "Q", "D1", "D2", and "R0"
such that "A = U*D1*R0*Q'" and "B = V*D2*R0*Q'".

"""
svd

doc"""
    svdfact(A[, thin=true]) -> SVD

Compute the Singular Value Decomposition (SVD) of "A" and return
an "SVD" object. "U", "S", "V" and "Vt" can be obtained
from the factorization "F" with "F[:U]", "F[:S]", "F[:V]"
and "F[:Vt]", such that "A = U*diagm(S)*Vt". If "thin" is
"true", an economy mode decomposition is returned. The algorithm
produces "Vt" and hence "Vt" is more efficient to extract than
"V". The default is to produce a thin decomposition.

    svdfact(A, B) -> GeneralizedSVD

Compute the generalized SVD of "A" and "B", returning a
"GeneralizedSVD" Factorization object "F", such that "A =
F[:U]*F[:D1]*F[:R0]*F[:Q]'" and "B =
F[:V]*F[:D2]*F[:R0]*F[:Q]'".

"""
svdfact

doc"""
    svdfact!(A[, thin=true]) -> SVD

"svdfact!" is the same as "svdfact()", but saves space by
overwriting the input A, instead of creating a copy. If "thin" is
"true", an economy mode decomposition is returned. The default is
to produce a thin decomposition.

"""
svdfact!

doc"""
    svds(A; nsv=6, ritzvec=true, tol=0.0, maxiter=1000) -> (left_sv, s, right_sv, nconv, niter, nmult, resid)

"svds" computes largest singular values "s" of "A" using
Lanczos or Arnoldi iterations. Uses "eigs()" underneath.

Inputs are:
    * "A": Linear operator. It can either subtype of
      "AbstractArray" (e.g., sparse matrix) or duck typed. For
      duck typing "A" has to support "size(A)", "eltype(A)",
      "A * vector" and "A' * vector".

    * "nsv": Number of singular values.

    * "ritzvec": Whether to return the left and right singular
      vectors "left_sv" and "right_sv", default is "true". If
      "false" the singular vectors are omitted from the output.

    * "tol": tolerance, see "eigs()".

    * "maxiter": Maximum number of iterations, see "eigs()".

**Example**:

    X = sprand(10, 5, 0.2)
    svds(X, nsv = 2)

"""
svds

doc"""
    svdvals(A)

Returns the singular values of "A".

    svdvals(A, B)

Return only the singular values from the generalized singular value
decomposition of "A" and "B".

"""
svdvals

doc"""
    svdvals!(A)

Returns the singular values of "A", while saving space by
overwriting the input.

"""
svdvals!

doc"""
    sylvester(A, B, C)

Computes the solution "X" to the Sylvester equation "AX + XB + C
= 0", where "A", "B" and "C" have compatible dimensions and
"A" and "-B" have no eigenvalues with equal real part.

"""
sylvester

doc"""
    symbol(x...) -> Symbol

Create a "Symbol" by concatenating the string representations of
the arguments together.

"""
symbol

doc"""
    symdiff(s1, s2...)

Construct the symmetric difference of elements in the passed in
sets or arrays. Maintains order with arrays.

"""
symdiff

doc"""
    symdiff!(s, n)

The set "s" is destructively modified to toggle the inclusion of
integer "n".

    symdiff!(s, itr)

For each element in "itr", destructively toggle its inclusion in
set "s".

    symdiff!(s1, s2)

Construct the symmetric difference of sets "s1" and "s2",
storing the result in "s1".

"""
symdiff!

doc"""
    symlink(target, link)

Creates a symbolic link to "target" with the name "link".

Note: This function raises an error under operating systems that
  do not support soft symbolic links, such as Windows XP.

"""
symlink

doc"""
    symperm(A, p)

Return the symmetric permutation of A, which is "A[p,p]". A
should be symmetric and sparse, where only the upper triangular
part of the matrix is stored. This algorithm ignores the lower
triangular part of the matrix. Only the upper triangular part of
the result is returned as well.

"""
symperm

doc"""
    systemerror(sysfunc, iftrue)

Raises a "SystemError" for "errno" with the descriptive string
"sysfunc" if "bool" is true

"""
systemerror

doc"""
    take(iter, n)

An iterator that generates at most the first "n" elements of
"iter".

"""
take

doc"""
    take!(RemoteRef)

Fetch the value of a remote reference, removing it so that the
reference is empty again.

"""
take!

doc"""
    takebuf_array(b::IOBuffer)

Obtain the contents of an "IOBuffer" as an array, without
copying. Afterwards, the IOBuffer is reset to its initial state.

"""
takebuf_array

doc"""
    takebuf_string(b::IOBuffer)

Obtain the contents of an "IOBuffer" as a string, without
copying. Afterwards, the IOBuffer is reset to its initial state.

"""
takebuf_string

doc"""
    tan(x)

Compute tangent of "x", where "x" is in radians

"""
tan

doc"""
    tand(x)

Compute tangent of "x", where "x" is in degrees

"""
tand

doc"""
    tanh(x)

Compute hyperbolic tangent of "x"

"""
tanh

doc"""
    task_local_storage(symbol)

Look up the value of a symbol in the current task's task-local
storage.

    task_local_storage(symbol, value)

Assign a value to a symbol in the current task's task-local
storage.

    task_local_storage(body, symbol, value)

Call the function "body" with a modified task-local storage, in
which "value" is assigned to "symbol"; the previous value of
"symbol", or lack thereof, is restored afterwards. Useful for
emulating dynamic scoping.

"""
task_local_storage

doc"""
    tempdir()

Obtain the path of a temporary directory (possibly shared with
other processes).

"""
tempdir

doc"""
    tempname()

Generate a unique temporary file path.

"""
tempname

doc"""
    throw(e)

Throw an object as an exception

"""
throw

doc"""
    tic()

Set a timer to be read by the next call to "toc()" or "toq()".
The macro call "@time expr" can also be used to time evaluation.

"""
tic

doc"""
    time()

Get the system time in seconds since the epoch, with fairly high
(typically, microsecond) resolution.

"""
time

doc"""
    time_ns()

Get the time in nanoseconds. The time corresponding to 0 is
undefined, and wraps every 5.8 years.

"""
time_ns

doc"""
    timedwait(testcb::Function, secs::Float64; pollint::Float64=0.1)

Waits till "testcb" returns "true" or for "secs`" seconds,
whichever is earlier. "testcb" is polled every "pollint"
seconds.

"""
timedwait

doc"""
    toc()

Print and return the time elapsed since the last "tic()".

"""
toc

doc"""
    toq()

Return, but do not print, the time elapsed since the last
"tic()".

"""
toq

doc"""
    touch(path::AbstractString)

Update the last-modified timestamp on a file to the current time.

"""
touch

doc"""
    trace(M)

Matrix trace

"""
trace

doc"""
    trailing_ones(x::Integer) -> Integer

Number of ones trailing the binary representation of "x".

    julia> trailing_ones(3)
    2

"""
trailing_ones

doc"""
    trailing_zeros(x::Integer) -> Integer

Number of zeros trailing the binary representation of "x".

    julia> trailing_zeros(2)
    1

"""
trailing_zeros

doc"""
    transpose(A)

The transposition operator (".'").

"""
transpose

doc"""
    transpose!(dest, src)

Transpose array "src" and store the result in the preallocated
array "dest", which should have a size corresponding to
"(size(src,2),size(src,1))". No in-place transposition is
supported and unexpected results will happen if *src* and *dest*
have overlapping memory regions.

"""
transpose!

doc"""
    trigamma(x)

Compute the trigamma function of "x" (the logarithmic second
derivative of "gamma(x)")

"""
trigamma

doc"""
    tril(M)

Lower triangle of a matrix.

    tril(M, k)

Returns the lower triangle of "M" starting from the "k"th
subdiagonal.

"""
tril

doc"""
    tril!(M)

Lower triangle of a matrix, overwriting "M" in the process.

    tril!(M, k)

Returns the lower triangle of "M" starting from the "k"th
subdiagonal, overwriting "M" in the process.

"""
tril!

doc"""
    triu(M)

Upper triangle of a matrix.

    triu(M, k)

Returns the upper triangle of "M" starting from the "k"th
superdiagonal.

"""
triu

doc"""
    triu!(M)

Upper triangle of a matrix, overwriting "M" in the process.

    triu!(M, k)

Returns the upper triangle of "M" starting from the "k"th
superdiagonal, overwriting "M" in the process.

"""
triu!

doc"""
    trues(dims)

Create a "BitArray" with all values set to true

"""
trues

doc"""
    trunc([T], x[, digits[, base]])

"trunc(x)" returns the nearest integral value of the same type as
"x" whose absolute value is less than or equal to "x".

"trunc(T, x)" converts the result to type "T", throwing an
"InexactError" if the value is not representable.

"digits" and "base" work as for "round()".

"""
trunc

doc"""
    truncate(file, n)

Resize the file or buffer given by the first argument to exactly
*n* bytes, filling previously unallocated space with '\0' if the
file or buffer is grown

"""
truncate

doc"""
    tryparse(type, str[, base])

Like "parse", but returns a "Nullable" of the requested type.
The result will be null if the string does not contain a valid
number.

"""
tryparse

doc"""
    tuple(xs...)

Construct a tuple of the given objects.

"""
tuple

doc"""
    typeintersect(T, S)

Compute a type that contains the intersection of "T" and "S".
Usually this will be the smallest such type or one close to it.

"""
typeintersect

doc"""
    typejoin(T, S)

Compute a type that contains both "T" and "S".

"""
typejoin

doc"""
    typemax(type)

The highest value representable by the given (real) numeric type.

"""
typemax

doc"""
    typemin(type)

The lowest value representable by the given (real) numeric type.

"""
typemin

doc"""
    typeof(x)

Get the concrete type of "x".

"""
typeof

doc"""
    ucfirst(string)

Returns "string" with the first character converted to uppercase.

"""
ucfirst

doc"""
    unescape_string(s::AbstractString) -> AbstractString

General unescaping of traditional C and Unicode escape sequences.
Reverse of "escape_string()". See also "print_unescaped()".

"""
unescape_string

doc"""
    union(s1, s2...)
∪(s1, s2)

Construct the union of two or more sets. Maintains order with
arrays.

"""
union

doc"""
    union!(s, iterable)

Union each element of "iterable" into set "s" in-place.

"""
union!

doc"""
    unique(itr[, dim])

Returns an array containing only the unique elements of the
iterable "itr", in the order that the first of each set of
equivalent elements originally appears. If "dim" is specified,
returns unique regions of the array "itr" along "dim".

"""
unique

doc"""
    unlock(l::ReentrantLock)

Releases ownership of the lock by the current task. If the lock had
been acquired before, it just decrements an internal counter and
returns immediately.

"""
unlock

doc"""
    unmark(s)

Remove a mark from stream "s". Returns "true" if the stream was
marked, "false" otherwise.

See also "mark()", "reset()", "ismarked()"

"""
unmark

doc"""
    unsafe_convert(T, x)

Convert "x" to a value of type "T"

In cases where "convert" would need to take a Julia object and
turn it into a "Ptr", this function should be used to define and
perform that conversion.

Be careful to ensure that a julia reference to "x" exists as long
as the result of this function will be used. Accordingly, the
argument "x" to this function should never be an expression, only
a variable name or field reference. For example, "x=a.b.c" is
acceptable, but "x=[a,b,c]" is not.

The "unsafe" prefix on this function indicates that using the
result of this function after the "x" argument to this function
is no longer accessible to the program may cause undefined
behavior, including program corruption or segfaults, at any later
time.

"""
unsafe_convert

doc"""
    unsafe_copy!(dest::Ptr{T}, src::Ptr{T}, N)

Copy "N" elements from a source pointer to a destination, with no
checking. The size of an element is determined by the type of the
pointers.

The "unsafe" prefix on this function indicates that no validation
is performed on the pointers "dest" and "src" to ensure that
they are valid. Incorrect usage may corrupt or segfault your
program, in the same manner as C.

    unsafe_copy!(dest::Array, do, src::Array, so, N)

Copy "N" elements from a source array to a destination, starting
at offset "so" in the source and "do" in the destination
(1-indexed).

The "unsafe" prefix on this function indicates that no validation
is performed to ensure that N is inbounds on either array.
Incorrect usage may corrupt or segfault your program, in the same
manner as C.

"""
unsafe_copy!

doc"""
    unsafe_load(p::Ptr{T}, i::Integer)

Load a value of type "T" from the address of the ith element
(1-indexed) starting at "p". This is equivalent to the C
expression "p[i-1]".

The "unsafe" prefix on this function indicates that no validation
is performed on the pointer "p" to ensure that it is valid.
Incorrect usage may segfault your program or return garbage
answers, in the same manner as C.

"""
unsafe_load

doc"""
    unsafe_pointer_to_objref(p::Ptr)

Convert a "Ptr" to an object reference. Assumes the pointer
refers to a valid heap-allocated Julia object. If this is not the
case, undefined behavior results, hence this function is considered
"unsafe" and should be used with care.

"""
unsafe_pointer_to_objref

doc"""
    unsafe_store!(p::Ptr{T}, x, i::Integer)

Store a value of type "T" to the address of the ith element
(1-indexed) starting at "p". This is equivalent to the C
expression "p[i-1] = x".

The "unsafe" prefix on this function indicates that no validation
is performed on the pointer "p" to ensure that it is valid.
Incorrect usage may corrupt or segfault your program, in the same
manner as C.

"""
unsafe_store!

doc"""
    unsafe_trunc(T, x)

"unsafe_trunc(T, x)" returns the nearest integral value of type
"T" whose absolute value is less than or equal to "x". If the
value is not representable by "T", an arbitrary value will be
returned.

"""
unsafe_trunc

doc"""
    unshift!(collection, items...) -> collection

Insert one or more "items" at the beginning of "collection".

    julia> unshift!([1, 2, 3, 4], 5, 6)
    6-element Array{Int64,1}:
     5
     6
     1
     2
     3
     4

"""
unshift!

doc"""
    unsigned(x) -> Unsigned

Convert a number to an unsigned integer. If the argument is signed,
it is reinterpreted as unsigned without checking for negative
values.

"""
unsigned

doc"""
    uperm(file)

Gets the permissions of the owner of the file as a bitfield of

    +------+-----------------------+
    | 01   | Execute Permission    |
    +------+-----------------------+
    | 02   | Write Permission      |
    +------+-----------------------+
    | 04   | Read Permission       |
    +------+-----------------------+

For allowed arguments, see "stat".

"""
uperm

doc"""
    uppercase(string)

Returns "string" with all characters converted to uppercase.

"""
uppercase

doc"""
    utf16(s)

Create a UTF-16 string from a byte array, array of "UInt16", or
any other string type.  (Data must be valid UTF-16.  Conversions of
byte arrays check for a byte-order marker in the first two bytes,
and do not include it in the resulting string.)

Note that the resulting "UTF16String" data is terminated by the
NUL codepoint (16-bit zero), which is not treated as a character in
the string (so that it is mostly invisible in Julia); this allows
the string to be passed directly to external functions requiring
NUL-terminated data.  This NUL is appended automatically by the
*utf16(s)* conversion function.  If you have a "UInt16" array
"A" that is already NUL-terminated valid UTF-16 data, then you
can instead use *UTF16String(A)`* to construct the string without
making a copy of the data and treating the NUL as a terminator
rather than as part of the string.

    utf16(::Union{Ptr{UInt16}, Ptr{Int16}}[, length])

Create a string from the address of a NUL-terminated UTF-16 string.
A copy is made; the pointer can be safely freed. If "length" is
specified, the string does not have to be NUL-terminated.

"""
utf16

doc"""
    utf32(s)

Create a UTF-32 string from a byte array, array of "Char" or
"UInt32", or any other string type.  (Conversions of byte arrays
check for a byte-order marker in the first four bytes, and do not
include it in the resulting string.)

Note that the resulting "UTF32String" data is terminated by the
NUL codepoint (32-bit zero), which is not treated as a character in
the string (so that it is mostly invisible in Julia); this allows
the string to be passed directly to external functions requiring
NUL-terminated data.  This NUL is appended automatically by the
*utf32(s)* conversion function.  If you have a "Char" or
"UInt32" array "A" that is already NUL-terminated UTF-32 data,
then you can instead use *UTF32String(A)`* to construct the string
without making a copy of the data and treating the NUL as a
terminator rather than as part of the string.

    utf32(::Union{Ptr{Char}, Ptr{UInt32}, Ptr{Int32}}[, length])

Create a string from the address of a NUL-terminated UTF-32 string.
A copy is made; the pointer can be safely freed. If "length" is
specified, the string does not have to be NUL-terminated.

"""
utf32

doc"""
    utf8(::Array{UInt8, 1})

Create a UTF-8 string from a byte array.

    utf8(::Ptr{UInt8}[, length])

Create a UTF-8 string from the address of a C (0-terminated) string
encoded in UTF-8. A copy is made; the ptr can be safely freed. If
"length" is specified, the string does not have to be
0-terminated.

    utf8(s)

Convert a string to a contiguous UTF-8 string (all characters must
be valid UTF-8 characters).

"""
utf8

doc"""
    values(collection)

Return an iterator over all values in a collection.
"collect(values(d))" returns an array of values.

"""
values

doc"""
    var(v[, region])

Compute the sample variance of a vector or array "v", optionally
along dimensions in "region". The algorithm will return an
estimator of the generative distribution's variance under the
assumption that each entry of "v" is an IID drawn from that
generative distribution. This computation is equivalent to
calculating "sum((v - mean(v)).^2) / (length(v) - 1)". Note:
Julia does not ignore "NaN" values in the computation. For
applications requiring the handling of missing data, the
"DataArray" package is recommended.

"""
var

doc"""
    varm(v, m)

Compute the sample variance of a vector "v" with known mean
"m". Note: Julia does not ignore "NaN" values in the
computation.

"""
varm

doc"""
    vcat(A...)

Concatenate along dimension 1

"""
vcat

doc"""
    vec(Array) -> Vector

Vectorize an array using column-major convention.

"""
vec

doc"""
    vecdot(x, y)

For any iterable containers "x" and "y" (including arrays of
any dimension) of numbers (or any element type for which "dot" is
defined), compute the Euclidean dot product (the sum of
"dot(x[i],y[i])") as if they were vectors.

"""
vecdot

doc"""
    vecnorm(A[, p])

For any iterable container "A" (including arrays of any
dimension) of numbers (or any element type for which "norm" is
defined), compute the "p"-norm (defaulting to "p=2") as if
"A" were a vector of the corresponding length.

For example, if "A" is a matrix and "p=2", then this is
equivalent to the Frobenius norm.

"""
vecnorm

doc"""
    versioninfo([verbose::Bool])

Print information about the version of Julia in use. If the
"verbose" argument is true, detailed system information is shown
as well.

"""
versioninfo

doc"""
    wait([x])

Block the current task until some event occurs, depending on the
type of the argument:

* "RemoteRef": Wait for a value to become available for the
  specified remote reference.

* "Condition": Wait for "notify" on a condition.

* "Process": Wait for a process or process chain to exit. The
  "exitcode" field of a process can be used to determine success
  or failure.

* "Task": Wait for a "Task" to finish, returning its result
  value. If the task fails with an exception, the exception is
  propagated (re-thrown in the task that called "wait").

* "RawFD": Wait for changes on a file descriptor (see *poll_fd*
  for keyword arguments and return code)

If no argument is passed, the task blocks for an undefined period.
If the task's state is set to ":waiting", it can only be
restarted by an explicit call to "schedule" or "yieldto". If
the task's state is ":runnable", it might be restarted
unpredictably.

Often "wait" is called within a "while" loop to ensure a
waited-for condition is met before proceeding.

"""
wait

doc"""
    warn(msg)

Display a warning.

"""
warn

doc"""
    watch_file(cb=false, s; poll=false)

Watch file or directory "s" and run callback "cb" when "s" is
modified. The "poll" parameter specifies whether to use file
system event monitoring or polling. The callback function "cb"
should accept 3 arguments: "(filename, events, status)" where
"filename" is the name of file that was modified, "events" is
an object with boolean fields "changed" and "renamed" when
using file system event monitoring, or "readable" and
"writable" when using polling, and "status" is always 0. Pass
"false" for "cb" to not use a callback function.

"""
watch_file

doc"""
    which(f, types)

Returns the method of "f" (a "Method" object) that would be
called for arguments of the given types.

If "types" is an abstract type, then the method that would be
called by "invoke" is returned.

    which(symbol)

Return the module in which the binding for the variable referenced
by "symbol" was created.

"""
which

doc"""
    whos([Module,] [pattern::Regex])

Print information about exported global variables in a module,
optionally restricted to those matching "pattern".

"""
whos

doc"""
    widemul(x, y)

Multiply "x" and "y", giving the result as a larger type.

"""
widemul

doc"""
    widen(type | x)

If the argument is a type, return a "larger" type (for numeric
types, this will be a type with at least as much range and
precision as the argument, and usually more). Otherwise the
argument "x" is converted to "widen(typeof(x))".

    julia> widen(Int32)
    Int64

    julia> widen(1.5f0)
    1.5

"""
widen

doc"""
    with_bigfloat_precision(f::Function, precision::Integer)

Change the BigFloat arithmetic precision (in bits) for the duration
of "f". It is logically equivalent to:

    old = get_bigfloat_precision()
    set_bigfloat_precision(precision)
    f()
    set_bigfloat_precision(old)

"""
with_bigfloat_precision

doc"""
    with_rounding(f::Function, T, mode)

Change the rounding mode of floating point type "T" for the
duration of "f". It is logically equivalent to:

    old = get_rounding(T)
    set_rounding(T, mode)
    f()
    set_rounding(T, old)

See "get_rounding" for available rounding modes.

"""
with_rounding

doc"""
    withenv(f::Function, kv::Pair...)

Execute "f()" in an environment that is temporarily modified (not
replaced as in "setenv") by zero or more ""var"=>val"
arguments "kv".  "withenv" is generally used via the
"withenv(kv...) do ... end" syntax.  A value of "nothing" can
be used to temporarily unset an environment variable (if it is
set).  When "withenv" returns, the original environment has been
restored.

"""
withenv

doc"""
    workers()

Returns a list of all worker process identifiers.

"""
workers

doc"""
    workspace()

Replace the top-level module ("Main") with a new one, providing a
clean workspace. The previous "Main" module is made available as
"LastMain". A previously-loaded package can be accessed using a
statement such as "using LastMain.Package".

This function should only be used interactively.

"""
workspace

doc"""
    write(stream, x)

Write the canonical binary representation of a value to the given
stream.

"""
write

doc"""
    writecsv(filename, A)

Equivalent to "writedlm" with "delim" set to comma.

"""
writecsv

doc"""
    writedlm(f, A, delim='\t')

Write "A" (a vector, matrix or an iterable collection of iterable
rows) as text to "f" (either a filename string or an "IO"
stream) using the given delimeter "delim" (which defaults to tab,
but can be any printable Julia object, typically a "Char" or
"AbstractString").

For example, two vectors "x" and "y" of the same length can be
written as two columns of tab-delimited text to "f" by either
"writedlm(f, [x y])" or by "writedlm(f, zip(x, y))".

"""
writedlm

doc"""
    writemime(stream, mime, x)

The "display" functions ultimately call "writemime" in order to
write an object "x" as a given "mime" type to a given I/O
"stream" (usually a memory buffer), if possible.  In order to
provide a rich multimedia representation of a user-defined type
"T", it is only necessary to define a new "writemime" method
for "T", via: "writemime(stream, ::MIME"mime", x::T) = ...",
where "mime" is a MIME-type string and the function body calls
"write" (or similar) to write that representation of "x" to
"stream". (Note that the "MIME\""" notation only supports
literal strings; to construct "MIME" types in a more flexible
manner use "MIME{symbol("")}".)

For example, if you define a "MyImage" type and know how to write
it to a PNG file, you could define a function "writemime(stream,
::MIME"image/png", x::MyImage) = ...`" to allow your images to
be displayed on any PNG-capable "Display" (such as IJulia). As
usual, be sure to "import Base.writemime" in order to add new
methods to the built-in Julia function "writemime".

Technically, the "MIME"mime"" macro defines a singleton type
for the given "mime" string, which allows us to exploit Julia's
dispatch mechanisms in determining how to display objects of any
given type.

"""
writemime

doc"""
    wstring(s)

This is a synonym for either "utf32(s)" or "utf16(s)",
depending on whether "Cwchar_t" is 32 or 16 bits, respectively.
The synonym "WString" for "UTF32String" or "UTF16String" is
also provided.

"""
wstring

doc"""
    xcorr(u, v)

Compute the cross-correlation of two vectors.

"""
xcorr

doc"""
    xdump(x)

Show all structure of a value, including all fields of objects.

"""
xdump

doc"""
    yield()

Switch to the scheduler to allow another scheduled task to run. A
task that calls this function is still runnable, and will be
restarted immediately if there are no other runnable tasks.

"""
yield

doc"""
    yieldto(task, arg = nothing)

Switch to the given task. The first time a task is switched to, the
task's function is called with no arguments. On subsequent
switches, "arg" is returned from the task's last call to
"yieldto". This is a low-level call that only switches tasks, not
considering states or scheduling in any way. Its use is
discouraged.

"""
yieldto

doc"""
    zero(x)

Get the additive identity element for the type of x (x can also
specify the type itself).

"""
zero

doc"""
    zeros(type, dims)

Create an array of all zeros of specified type. The type defaults
to Float64 if not specified.

    zeros(A)

Create an array of all zeros with the same element type and shape
as A.

"""
zeros

doc"""
    zeta(s)

Riemann zeta function \zeta(s).

    zeta(s, z)

Hurwitz zeta function \zeta(s, z).  (This is equivalent to the
Riemann zeta function \zeta(s) for the case of "z=1".)

"""
zeta

doc"""
    zip(iters...)

For a set of iterable objects, returns an iterable of tuples, where
the "i"th tuple contains the "i"th component of each input
iterable.

Note that "zip()" is its own inverse:
"collect(zip(zip(a...)...)) == collect(a)".

"""
zip

doc"""
    ~(x)

Bitwise not

"""
~

doc"""
    γ
eulergamma

Euler's constant

"""
γ

doc"""
    φ
golden

The golden ratio

"""
φ

