# This file is a part of Julia. License is MIT: https://julialang.org/license

# tests the output of the embedding example is correct
using Test
using Pkg

if Sys.iswindows()
    # libjulia needs to be in the same directory as the embedding executable or in path
    ENV["PATH"] = string(Sys.BINDIR, ";", ENV["PATH"])
end

function checknum(s, rx, cond)
    m = match(rx, s)
    if m === nothing
        return false
    else
        num = m[1]
        return cond(parse(UInt, num))
    end
end

@test length(ARGS) == 1
@testset "gcext example" begin
    out = Pipe()
    err = Pipe()
    p = run(pipeline(Cmd(ARGS), stdin=devnull, stdout=out, stderr=err), wait=false)
    close(out.in)
    close(err.in)
    out_task = @async readlines(out)
    err_task = @async readlines(err)
    # @test success(p)
    errlines = fetch(err_task)
    lines = fetch(out_task)
    @test length(errlines) == 0
    # @test length(lines) == 6
    @test length(lines) == 5
    @test checknum(lines[2], r"([0-9]+) full collections", n -> n >= 10)
    @test checknum(lines[3], r"([0-9]+) partial collections", n -> n > 0)
    @test checknum(lines[4], r"([0-9]+) object sweeps", n -> n > 0)
    # @test checknum(lines[5], r"([0-9]+) internal object scan failures",
    #     n -> n == 0)
    # @test checknum(lines[6], r"([0-9]+) corrupted auxiliary roots",
    #    n -> n == 0)
    @test checknum(lines[5], r"([0-9]+) corrupted auxiliary roots",
        n -> n == 0)
end

@testset "Package with foreign type" begin
    load_path = copy(LOAD_PATH)
    push!(LOAD_PATH, joinpath(@__DIR__, "Foreign"))
    push!(LOAD_PATH, joinpath(@__DIR__, "DependsOnForeign"))
    try
        # Force recaching
        Base.compilecache(Base.identify_package("Foreign"))
        Base.compilecache(Base.identify_package("DependsOnForeign"))

        push!(LOAD_PATH, joinpath(@__DIR__, "ForeignObjSerialization"))
        @test_throws ErrorException  Base.compilecache(Base.identify_package("ForeignObjSerialization"), Base.DevNull())
        pop!(LOAD_PATH)

        (@eval (using Foreign))
        @test Base.invokelatest(Foreign.get_nmark)  == 0
        @test Base.invokelatest(Foreign.get_nsweep) == 0

        obj = Base.invokelatest(Foreign.FObj)
        GC.@preserve obj begin
            GC.gc(true)
        end
        @test Base.invokelatest(Foreign.get_nmark)  > 0
        @time Base.invokelatest(Foreign.test, 10)
        GC.gc(true)
        @test Base.invokelatest(Foreign.get_nsweep) > 0
        (@eval (using DependsOnForeign))
        Base.invokelatest(DependsOnForeign.f, obj)
    finally
        copy!(LOAD_PATH, load_path)
    end
end
