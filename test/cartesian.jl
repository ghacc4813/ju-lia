# This file is a part of Julia. License is MIT: https://julialang.org/license

@test Base.Cartesian.exprresolve(:(1 + 3)) == 4
ex = Base.Cartesian.exprresolve(:(if 5 > 4; :x; else :y; end))
@test ex.args[2] == QuoteNode(:x)

@test Base.Cartesian.lreplace!("val_col", Base.Cartesian.LReplace{String}(:col, "col", 1)) == "val_1"
@test Base.setindex(CartesianIndex(1,5,4),3,2) == CartesianIndex(1, 3, 4)

@testset "CartesianIndices constructions" begin
    @testset "AbstractUnitRange" begin
        for oinds in [
            (2, 3),
            (UInt8(2), 3),
            (2, UInt8(3)),
            (2, 1:3),
            (Base.OneTo(2), 1:3)
        ]
            R = CartesianIndices(oinds)
            @test size(R) == (2, 3)
            @test axes(R) == (Base.OneTo(2), Base.OneTo(3))
            @test step.(R.indices) == (1, 1)

            @test R[begin] == CartesianIndex(1, 1)
            @test R[2] == CartesianIndex(2, 1)
            @test R[1, 2] == CartesianIndex(1, 2)
            @test R[end] == CartesianIndex(2, 3)
        end
        @test CartesianIndices((2, 3)) == CartesianIndex(1, 1):CartesianIndex(2, 3)

        R = CartesianIndices((0:5, 0:5))
        @test R[begin] == R[1] == first(R) == CartesianIndex(0, 0)
        @test R[2, 1] == R[2] == CartesianIndex(1, 0)
        @test R[1, 2] == R[7] == CartesianIndex(0, 1)
        @test R[end] == R[length(R)] == last(R) == CartesianIndex(5, 5)

        for oinds in [(2, ), (2, 3), (2, 3, 4)]
            R = CartesianIndices(oinds)
            @test eltype(R) == CartesianIndex{length(oinds)}
            @test ndims(R) == length(oinds)
            @test size(R) == oinds
        end

        # generic iterators doesn't have axes interface
        iter = Iterators.repeated([1 2], 4)
        @test_throws MethodError CartesianIndices(iter)
    end

    @testset "Step Range" begin
        for oinds in [
            (2, 1:2:6),
            (Base.OneTo(2), 1:2:6),
            (UInt8(2), 1:2:6),
            (2, UInt8(1):UInt8(2):UInt8(6))
        ]
            R = CartesianIndices(oinds)
            @test size(R) == (2, 3)
            @test axes(R) == (Base.OneTo(2), Base.OneTo(3))
            @test step.(R.indices) == (1, 2)

            @test R[begin] == CartesianIndex(1, 1)
            @test R[2] == CartesianIndex(2, 1)
            @test R[1, 2] == CartesianIndex(1, 3)
            @test R[end] == CartesianIndex(2, 5)
        end

        @test CartesianIndices((1:2:5, 1:3:7)) == CartesianIndex(1, 1):CartesianIndex(2,3):CartesianIndex(5,7)

        R = CartesianIndex(0, 0):CartesianIndex(2, 3):CartesianIndex(5, 7)
        @test R[begin] == R[1] == first(R) == CartesianIndex(0, 0)
        @test R[2, 1] == R[2] == CartesianIndex(2, 0)
        @test R[1, 2] == R[4] == CartesianIndex(0, 3)
        @test R[end] == R[length(R)] == last(R) == CartesianIndex(4, 6)

        for oinds in [(1:2:5, ), (1:2:5, 1:3:7), (1:2:5, 1:3:7, 1:4:11)]
            R = CartesianIndices(oinds)
            @test eltype(R) == CartesianIndex{length(oinds)}
            @test ndims(R) == length(oinds)
            @test size(R) == length.(oinds)
        end

        R = CartesianIndices((1:2:5, 7:-3:1))
        @test R == CartesianIndex(1, 7):CartesianIndex(2,-3):CartesianIndex(5, 1)
        @test step.(R.indices) == (2, -3)
        @test R[begin] == R[1] == first(R) == CartesianIndex(1, 7)
        @test R[2, 1] == R[2] == CartesianIndex(3, 7)
        @test R[1, 2] == R[4] == CartesianIndex(1, 4)
        @test R[end] == R[length(R)] == last(R) == CartesianIndex(5, 1)
    end
end

module TestOffsetArray
    isdefined(Main, :OffsetArrays) || @eval Main include("testhelpers/OffsetArrays.jl")
    using .Main.OffsetArrays
    using Test

    A = OffsetArray(rand(2, 3), -1, -1)
    R = CartesianIndices(A)
    @test R == CartesianIndices((0:1, 0:2))
    @test axes(R) == (0:1, 0:2)
    for i in eachindex(A)
        @test A[i] == A[R[i]]
    end
    for i in R
        @test A[i] == A[Tuple(i)...]
    end
end

@testset "CartesianIndices getindex" begin
    @testset "AbstractUnitRange" begin
        for oinds in [(2, ), (2, 3), (2, 3, 4)]
            A = rand(1:10, oinds)
            R = CartesianIndices(A)
            @test R == CartesianIndices(oinds)

            @test A[R] == A
            @test axes(A) == axes(R)
            @test all(i->A[i]==A[R[i]], eachindex(A))
            @test all(i->A[i]==A[R[i]], R)
            @test all(i->A[i]==A[R[i]], collect(R))
            @test all(i->i in R, collect(R))
        end
    end

    @testset "StepRange" begin
        for oinds in [(1:2:5, ), (1:2:5, 1:3:7), (1:2:5, 1:3:7, 1:4:11)]
            A = rand(1:10, last.(oinds))
            R = CartesianIndices(A)

            SR = CartesianIndex(first.(oinds)):CartesianIndex(step.(oinds)):CartesianIndex(last.(oinds))
            @test A[oinds...] == A[SR]
            @test A[SR] == A[R[SR]]
        end
    end
end

@testset "Cartesian simd" begin
    @testset "AbstractUnitRange" begin
        A = rand(-5:5, 64, 64)
        @test abs.(A) == map(abs, A)

        function test_simd(f, @nospecialize(A); init=zero(eltype(A)))
            val_simd = init
            @simd for i in CartesianIndices(A)
                val_simd = f(val_simd, A[i])
            end

            val_iter = init
            for i in CartesianIndices(A)
                val_iter = f(val_iter, A[i])
            end

            @test val_iter == reduce(f, A, init=init)
            @test val_iter ≈ val_simd
        end

        test_simd(+, A)
    end
end

@testset "Iterators" begin
    @testset "Reverse" begin
        R = CartesianIndices((0:5, 0:5))
        RR = Iterators.Reverse(R)
        rR = reverse(R)
        @test rR == collect(RR)

        @test eltype(RR) == CartesianIndex{2}
        @test size(RR) == size(R)
        @test axes(RR) == axes(R) # might change

        @test first(RR) == last(R) == CartesianIndex(5, 5)
        @test last(RR) == first(R) == CartesianIndex(0, 0)
        RRR = collect(Iterators.Reverse(collect(RR)))
        @test R == RRR
    end
end

@testset "set operations" begin
    R1 = CartesianIndices((3, 4, 5))
    R2 = CartesianIndices((-2:2, -3:3, -4:4))
    R = CartesianIndices((2, 3, 4))
    @test intersect(R1, R2) == R
end

# test conversions for CartesianIndex

@testset "CartesianIndex Conversions" begin
    @test convert(Int, CartesianIndex(42)) === 42
    @test convert(Float64, CartesianIndex(42)) === 42.0
    @test convert(Tuple, CartesianIndex(42, 1)) === (42, 1)

    # can't convert higher-dimensional indices to Int
    @test_throws MethodError convert(Int, CartesianIndex(42, 1))
end

@testset "CartesianIndices overflow" begin
    I = CartesianIndices((1:typemax(Int),))
    i = last(I)
    @test iterate(I, i) === nothing

    I = CartesianIndices((1:(typemax(Int)-1),))
    i = CartesianIndex(typemax(Int))
    @test iterate(I, i) === nothing

    I = CartesianIndices((1:typemax(Int), 1:typemax(Int)))
    i = last(I)
    @test iterate(I, i) === nothing

    i = CartesianIndex(typemax(Int), 1)
    @test iterate(I, i) === (CartesianIndex(1, 2), CartesianIndex(1,2))

    # reverse cartesian indices
    I = CartesianIndices((typemin(Int):(typemin(Int)+3),))
    i = last(I)
    @test iterate(I, i) === nothing
end

@testset "CartesianIndices iteration" begin
    I = CartesianIndices((2:4, 0:1, 1:1, 3:5))
    indices = Vector{eltype(I)}()
    for i in I
        push!(indices, i)
    end
    @test length(I) == length(indices)
    @test vec(I) == indices

    empty!(indices)
    I = Iterators.reverse(I)
    for i in I
        push!(indices, i)
    end
    @test length(I) == length(indices)
    @test vec(collect(I)) == indices

    # test invalid state
    I = CartesianIndices((2:4, 3:5))
    @test iterate(I, CartesianIndex(typemax(Int), 3))[1] == CartesianIndex(2,4)
    @test iterate(I, CartesianIndex(typemax(Int), 4))[1] == CartesianIndex(2,5)
    @test iterate(I, CartesianIndex(typemax(Int), 5))    === nothing

    @test iterate(I, CartesianIndex(3, typemax(Int)))[1] == CartesianIndex(4,typemax(Int))
    @test iterate(I, CartesianIndex(4, typemax(Int)))    === nothing
end

@testset "CartesianIndices operations" begin
    I = CartesianIndices((1:3, 4:6))
    J = CartesianIndices((2:4, 3:5))

    @test @inferred(intersect(I, J)) == CartesianIndices((2:3, 4:5))
end
