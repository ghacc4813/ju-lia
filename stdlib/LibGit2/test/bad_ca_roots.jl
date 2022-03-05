# This file is a part of Julia. License is MIT: https://julialang.org/license

module Test_LibGit2_https

using Test, LibGit2, NetworkOptions

# we currently use system SSL/TLS on macOS and Windows platforms
# and libgit2 cannot set the CA roots path on those systems
# if that changes, this may need to be adjusted
const CAN_SET_CA_ROOTS_PATH = !Sys.isapple() && !Sys.iswindows()

# Given this is a sub-processed file, not using @testsets avoids
# leaking the report print into the Base test runnner report
begin # empty CA roots file
    # these fail for different reasons on different platforms:
    # - on Apple & Windows you cannot set the CA roots path location
    # - on Linux & FreeBSD you you can but these are invalid files
    ENV["JULIA_SSL_CA_ROOTS_PATH"] = "/dev/null"
    @test_throws LibGit2.GitError LibGit2.ensure_initialized()
    ENV["JULIA_SSL_CA_ROOTS_PATH"] = tempname()
    @test_throws LibGit2.GitError LibGit2.ensure_initialized()
    # test that it still fails if called a second time
    @test_throws LibGit2.GitError LibGit2.ensure_initialized()
    if !CAN_SET_CA_ROOTS_PATH
        # test that this doesn't work on macOS & Windows
        ENV["JULIA_SSL_CA_ROOTS_PATH"] = NetworkOptions.bundled_ca_roots()
        @test_throws LibGit2.GitError LibGit2.ensure_initialized()
        delete!(ENV, "JULIA_SSL_CA_ROOTS_PATH")
        @test LibGit2.ensure_initialized() === nothing
    end
end

if CAN_SET_CA_ROOTS_PATH
    begin # non-empty but bad CA roots file
        # should still be possible to initialize
        ENV["JULIA_SSL_CA_ROOTS_PATH"] = joinpath(@__DIR__, "bad_ca_roots.pem")
        @test LibGit2.ensure_initialized() === nothing
    end
    mktempdir() do dir
        repo_url = "https://github.com/JuliaLang/Example.jl"
        begin # HTTPS clone with bad CA roots fails
            repo_path = joinpath(dir, "Example.HTTPS")
            c = LibGit2.CredentialPayload(allow_prompt=false, allow_git_helpers=false)
            redirect_stderr(devnull)
            err = try LibGit2.clone(repo_url, repo_path, credentials=c)
            catch err
                err
            end
            @test err isa LibGit2.GitError
            @test err.msg == "user rejected certificate for github.com"
        end
    end
end

end # module
