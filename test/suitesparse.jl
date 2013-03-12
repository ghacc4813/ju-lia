se33 = speye(3)
do33 = ones(3)
@test isequal(se33 \ do33, do33)

using Base.LinAlg.SuiteSparse

# based on deps/Suitesparse-4.0.2/UMFPACK/Demo/umfpack_di_demo.c

A = sparse(increment!([0,4,1,1,2,2,0,1,2,3,4,4]),
           increment!([0,4,0,2,1,2,1,4,3,2,1,2]),
           [2.,1.,3.,4.,-1.,-3.,3.,6.,2.,1.,4.,2.], 5, 5)
lua = lu(A)
umf_lunz(lua)
@test_approx_eq det(lua) det(full(A))

b = [8., 45., -3., 3., 19.]
x = lua\b
@test_approx_eq x float([1:5])

@test norm(A*x-b,1) < eps(1e4)

L,U,P,Q,Rs = umf_extract(lua)
@test_approx_eq diagmm(Rs,A)[P,Q] L*U

# based on deps/SuiteSparse-4.0.2/CHOLMOD/Demo/

# use inline values instead of
# chm_rdsp(joinpath(JULIA_HOME, "../../deps/SuiteSparse-4.0.2/CHOLMOD/Demo/Matrix/bcsstk01.tri"))
# because the file may not exist in binary distributions and when a system suitesparse library
# is used

## Result from C program
## ---------------------------------- cholmod_demo:
## norm (A,inf) = 3.57095e+09
## norm (A,1)   = 3.57095e+09
## CHOLMOD sparse:  A:  48-by-48, nz 224, upper.  OK
## CHOLMOD dense:   B:  48-by-1,   OK
## bnorm 1.97917
## Analyze: flop 6009 lnz 489
## Factorizing A
## CHOLMOD factor:  L:  48-by-48  simplicial, LDL'. nzmax 489.  nz 489  OK
## Ordering: AMD     fl/lnz       12.3  lnz/anz        2.2
## ints in L: 782, doubles in L: 489
## factor flops 6009 nnz(L)             489 (w/no amalgamation)
## nnz(A*A'):             224
## flops / nnz(L):      12.3
## nnz(L) / nnz(A):      2.2
## analyze cputime:        0.0000
## factor  cputime:         0.0000 mflop:      0.0
## solve   cputime:         0.0000 mflop:      0.0
## overall cputime:         0.0000 mflop:      0.0
## peak memory usage:            0 (MB)
## residual  2.5e-19 (|Ax-b|/(|A||x|+|b|))
## residual  1.3e-19 (|Ax-b|/(|A||x|+|b|)) after iterative refinement
## rcond     9.5e-06

nzval = 
    [2.83226851852e6,1.63544753086e6,1.72436728395e6,-2.0e6,-2.08333333333e6,1.00333333333e9,1.0e6,
     -2.77777777778e6,1.0675e9,2.08333333333e6,5.55555555555e6,1.53533333333e9,-3333.33333333,-1.0e6,
     2.83226851852e6,-6666.66666667,2.0e6,1.63544753086e6,-1.68e6,1.72436728395e6,-2.0e6,4.0e8,2.0e6,
     -2.08333333333e6,1.00333333333e9,1.0e6,2.0e8,-1.0e6,-2.77777777778e6,1.0675e9,-2.0e6,
     2.08333333333e6,5.55555555555e6,1.53533333333e9,-2.8e6,2.8360994695e6,-30864.1975309,
     -5.55555555555e6,1.76741074446e6,-15432.0987654,2.77777777778e6,517922.131816,3.89003806848e6,
     -3.33333333333e6,4.29857058902e6,-2.6349902747e6,1.97572063531e9,-2.77777777778e6,3.33333333333e8,
     -2.14928529451e6,2.77777777778e6,1.52734651547e9,5.55555555555e6,6.66666666667e8,2.35916180402e6,
     -5.55555555555e6,-1.09779731332e8,1.56411143711e9,-2.8e6,-3333.33333333,1.0e6,2.83226851852e6,
     -30864.1975309,-5.55555555555e6,-6666.66666667,-2.0e6,1.63544753086e6,-15432.0987654,
     2.77777777778e6,-1.68e6,1.72436728395e6,-3.33333333333e6,2.0e6,4.0e8,-2.0e6,-2.08333333333e6,
     1.00333333333e9,-2.77777777778e6,3.33333333333e8,-1.0e6,2.0e8,1.0e6,2.77777777778e6,1.0675e9,
     5.55555555555e6,6.66666666667e8,-2.0e6,2.08333333333e6,-5.55555555555e6,1.53533333333e9,
     -28935.1851852,-2.08333333333e6,60879.6296296,-1.59791666667e6,3.37291666667e6,-28935.1851852,
     2.08333333333e6,2.41171296296e6,-2.08333333333e6,1.0e8,-2.5e6,-416666.666667,1.5e9,-833333.333333,
     1.25e6,5.01833333333e8,2.08333333333e6,1.0e8,416666.666667,5.025e8,-28935.1851852,-2.08333333333e6,
     -4166.66666667,-1.25e6,3.98587962963e6,-1.59791666667e6,-8333.33333333,2.5e6,3.41149691358e6,
     -28935.1851852,2.08333333333e6,-2.355e6,2.43100308642e6,-2.08333333333e6,1.0e8,-2.5e6,5.0e8,2.5e6,
     -416666.666667,1.50416666667e9,-833333.333333,1.25e6,2.5e8,-1.25e6,-3.47222222222e6,1.33516666667e9,
     2.08333333333e6,1.0e8,-2.5e6,416666.666667,6.94444444444e6,2.16916666667e9,-28935.1851852,
     -2.08333333333e6,-3.925e6,3.98587962963e6,-1.59791666667e6,-38580.2469136,-6.94444444444e6,
     3.41149691358e6,-28935.1851852,2.08333333333e6,-19290.1234568,3.47222222222e6,2.43100308642e6,
     -2.08333333333e6,1.0e8,-4.16666666667e6,2.5e6,-416666.666667,1.50416666667e9,-833333.333333,
     -3.47222222222e6,4.16666666667e8,-1.25e6,3.47222222222e6,1.33516666667e9,2.08333333333e6,1.0e8,
     6.94444444445e6,8.33333333333e8,416666.666667,-6.94444444445e6,2.16916666667e9,-3830.95098171,
     1.14928529451e6,-275828.470683,-28935.1851852,-2.08333333333e6,-4166.66666667,1.25e6,64710.5806113,
     -131963.213599,-517922.131816,-2.29857058902e6,-1.59791666667e6,-8333.33333333,-2.5e6,
     3.50487988027e6,-517922.131816,-2.16567078453e6,551656.941366,-28935.1851852,2.08333333333e6,
     -2.355e6,517922.131816,4.57738374749e6,2.29857058902e6,-551656.941367,4.8619365099e8,
     -2.08333333333e6,1.0e8,2.5e6,5.0e8,-4.79857058902e6,134990.2747,2.47238730198e9,-1.14928529451e6,
     2.29724661236e8,-5.57173510779e7,-833333.333333,-1.25e6,2.5e8,2.39928529451e6,9.61679848804e8,
     275828.470683,-5.57173510779e7,1.09411960038e7,2.08333333333e6,1.0e8,-2.5e6,140838.195984,
     -1.09779731332e8,5.31278103775e8]
colptr0 = int32([0,1,2,3,6,9,12,15,18,20,25,30,34,36,39,43,47,52,58,62,67,71,77,84,90,93,95,
                 98,103,106,110,115,119,123,130,136,142,146,150,155,161,167,174,182,189,197,
                 207,215,224])
rowval0 = int32([0,1,2,1,2,3,0,2,4,0,1,5,0,4,6,1,3,7,2,8,1,3,7,8,9,0,4,6,8,10,5,6,7,11,6,12,
                 7,11,13,8,10,13,14,9,13,14,15,8,10,12,14,16,7,11,12,13,16,17,0,12,16,18,1,5,
                 13,15,19,2,4,14,20,3,13,15,19,20,21,2,4,12,16,18,20,22,1,5,17,18,19,23,0,5,
                 24,1,25,2,3,26,2,3,25,26,27,4,24,28,0,5,24,29,6,11,24,28,30,7,25,27,31,8,9,
                 26,32,8,9,25,27,31,32,33,10,24,28,30,32,34,6,11,29,30,31,35,12,17,30,36,13,
                 31,35,37,14,15,32,34,38,14,15,33,37,38,39,16,32,34,36,38,40,12,17,31,35,36,
                 37,41,12,16,17,18,23,36,40,42,13,14,15,19,37,39,43,13,14,15,20,21,38,43,44,
                 13,14,15,20,21,37,39,43,44,45,12,16,17,22,36,40,42,46,12,16,17,18,23,41,42,46,47])
A = CholmodSparse{Float64,Int32}(Base.LinAlg.SuiteSparse.c_CholmodSparse{Float64,Int32}(48,48,224,
                                                                     convert(Ptr{Int32}, colptr0),
                                                                     convert(Ptr{Int32}, rowval0),
                                                                     C_NULL,
                                                                     convert(Ptr{Float64}, nzval),
                                                                     C_NULL,
                                                                     one(Int32), zero(Int32),
                                                                     one(Int32), zero(Int32),
                                                                     one(Int32), one(Int32)),
                                 colptr0, rowval0, nzval)
@test_approx_eq chm_norm(A,0) 3.570948074697437e9
@test_approx_eq chm_norm(A,1) 3.570948074697437e9
chm_print(A,3)
B = chm_sdmult(A.c, false, 1., 0., CholmodDense(ones(size(A,2))).c)
chm_print(B,3)

#lp_afiro example

nzval = [1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,
         -1.0,-1.06,1.0,0.301,1.0,-1.0,1.0,-1.0,1.0,1.0,-1.0,-1.06,1.0,0.301,-1.0,-1.06,
         1.0,0.313,-1.0,-0.96,1.0,0.313,-1.0,-0.86,1.0,0.326,-1.0,2.364,-1.0,2.386,-1.0,
         2.408,-1.0,2.429,1.4,1.0,1.0,-1.0,1.0,1.0,-1.0,-0.43,1.0,0.109,1.0,-1.0,1.0,
         -1.0,1.0,-1.0,1.0,1.0,-0.43,1.0,1.0,0.109,-0.43,1.0,1.0,0.108,-0.39,1.0,1.0,
         0.108,-0.37,1.0,1.0,0.107,-1.0,2.191,-1.0,2.219,-1.0,2.249,-1.0,2.279,1.4,
         -1.0,1.0,-1.0,1.0,1.0,1.0]
colptr0 = int32([0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,23,25,27,29,33,37,41,45,47,
                 49,51,53,55,57,59,63,65,67,69,71,75,79,83,87,89,91,93,95,97,99,101,102])
rowval0 = int32([2,3,6,7,8,9,12,13,16,17,18,19,20,21,22,23,24,25,26,0,1,2,23,0,3,0,21,1,25,4,5,
                 6,24,4,5,7,24,4,5,8,24,4,5,9,24,6,20,7,20,8,20,9,20,3,4,4,22,5,26,10,11,12,21,
                 10,13,10,23,10,20,11,25,14,15,16,22,14,15,17,22,14,15,18,22,14,15,19,22,16,20,
                 17,20,18,20,19,20,13,15,15,24,14,26,15])
afiro = CholmodSparse{Float64,Int32}(Base.LinAlg.SuiteSparse.c_CholmodSparse{Float64,Int32}(27,51,102,
                                                                     convert(Ptr{Int32}, colptr0),
                                                                     convert(Ptr{Int32}, rowval0),
                                                                     C_NULL,
                                                                     convert(Ptr{Float64}, nzval),
                                                                     C_NULL,
                                                                     zero(Int32), zero(Int32),
                                                                     one(Int32), zero(Int32),
                                                                     one(Int32), one(Int32)),
                                     colptr0, rowval0, nzval)
                                     
