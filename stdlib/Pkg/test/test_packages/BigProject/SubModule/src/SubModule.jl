# This file is a part of Julia. License is MIT: https://julialang.org/license

module SubModule

buildfile = joinpath(@__DIR__, "..", "deps", "buildartifact")
if filetype(buildfile) != :file
    error("Package built incorrectly")
else
    include(buildfile)
end

f() = 1

end # module
