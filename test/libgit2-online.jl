# This file is a part of Julia. License is MIT: http://julialang.org/license

#@testset "libgit2-online" begin

#########
# TESTS #
#########
# init & clone
mktempdir() do dir
    repo_url_https = "https://github.com/JuliaLang/Example.jl"
    repo_url_git = "git@github.com:JuliaLang/Example.jl"
    #@testset "Cloning repository" begin
        #@testset "with 'https' protocol" begin
            repo_path = joinpath(dir, "Example1")
            repo = LibGit2.clone(repo_url_https, repo_path)
            try
                @test isdir(repo_path)
                @test isdir(joinpath(repo_path, ".git"))
            finally
                finalize(repo)
            end
        #end

        #@testset "with incorrect url" begin
            try
                repo_path = joinpath(dir, "Example2")
                # credentials are required because github tries to authenticate on unknown repo
                cred = LibGit2.UserPasswordCredentials("","") # empty credentials cause authentication error
                LibGit2.clone(repo_url_https*randstring(10), repo_path, payload=Nullable(cred))
                error("unexpected")
            catch ex
                @test isa(ex, LibGit2.Error.GitError)
                @test ex.code == LibGit2.Error.EAUTH
            end
        #end

        #TODO: remove or condition on libgit2 features this test when ssh protocol will be supported
        #@testset "with 'ssh' protocol (by default is not supported)" begin
            repo_path = joinpath(dir, "Example3")
            repo = LibGit2.clone(repo_url_git, repo_path)
            try
                @test isdir(repo_path)
                @test isdir(joinpath(repo_path, ".git"))
            finally
                finalize(repo)
            end
        #end
    #end
end

#end
