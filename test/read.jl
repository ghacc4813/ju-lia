mktempdir() do dir

tasks = []

# Create test file...
filename = joinpath(dir, "file.txt")
text = "C1,C2\n1,2\na,b\n"

# List of IO producers...
l = Vector{Tuple{AbstractString,Function}}()


# File
io = (text) -> begin
    open(io-> write(io, text), filename, "w")
    Base.Filesystem.open(filename, Base.Filesystem.JL_O_RDONLY)
end
s = io(text)
@test isa(s, IO)
@test isa(s, Base.Filesystem.File)
close(s)
push!(l, ("File", io))


# IOStream
io = (text) -> begin
    open(io-> write(io, text), filename, "w")
    open(filename)
end
s = io(text)
@test isa(s, IO)
@test isa(s, IOStream)
close(s)
push!(l, ("IOStream", io))


# IOBuffer
io = (text)->IOBuffer(text)
s = io(text)
@test isa(s, IO)
@test isa(s, IOBuffer)
close(s)
push!(l, ("IOBuffer", io))


function run_test_server(srv, text)
    push!(tasks, @async begin
        try
            sock = accept(srv)
            try
                write(sock,text)
            catch e
                if typeof(e) != Base.UVError
                    rethrow(e)
                end
            finally
                close(sock)
            end
        finally
            close(srv)
        end
    end)
    yield()
end


# TCPSocket
io = (text) -> begin
    port, srv = listenany(rand(2000:4000))
    run_test_server(srv, text)
    connect(port)
end
s = io(text)
@test isa(s, IO)
@test isa(s, TCPSocket)
close(s)
push!(l, ("TCPSocket", io))


# PipeEndpoint
io = (text) -> begin
    a = "\\\\.\\pipe\\uv-test-$(randstring(6))"
    b = joinpath(dir, "socket-$(randstring(6))")
    socketname = @windows ? a : b
    srv = listen(socketname)
    run_test_server(srv, text)
    connect(socketname)
end
s = io(text)
@test isa(s, IO)
@test isa(s, Base.PipeEndpoint)
close(s)
push!(l, ("PipeEndpoint", io))


@windows ? nothing : begin

# See "could not spawn `type 'C:\Users\appveyor\AppData\Local\Temp\1\jul3516.tmp\file.txt'`"
#https://ci.appveyor.com/project/StefanKarpinski/julia/build/1.0.12733/job/hpwjs4hmf03vs5ag#L1244

# Pipe
io = (text) -> begin
    open(io->write(io, text), filename, "w")
    open(`$(@windows ? "type" : "cat") $filename`)[1]
#    Was open(`echo -n $text`)[1]
#    See https://github.com/JuliaLang/julia/issues/14747
end
s = io(text)
@test isa(s, IO)
@test isa(s, Pipe)
close(s)
push!(l, ("Pipe", io))

end


open_streams = []
function cleanup()
    for s in open_streams
        try close(s) end
    end
    empty!(open_streams)
    for tsk in tasks
        wait(tsk)
    end
    empty!(tasks)
end

verbose = false

cleanup()

for (name, f) in l

    io = ()->(s=f(text); push!(open_streams, s); s)

    verbose && println("$name read...")
    @test read(io(), UInt8) == read(IOBuffer(text), UInt8)
    @test read(io(), UInt8) == open(io->read(io, UInt8), filename)
    @test read(io(), Int) == read(IOBuffer(text), Int)
    @test read(io(), Int) == open(io->read(io,Int),filename)
    cleanup()
    s1 = io()
    s2 = IOBuffer(text)
    @test read(s1, UInt32, 2) == read(s2, UInt32, 2)
    @test !eof(s1)
    @test read(s1, UInt8, 5) == read(s2, UInt8, 5)
    @test !eof(s1)
    @test read(s1, UInt8, 1) == read(s2, UInt8, 1)
    @test eof(s1)
    @test_throws EOFError read(s1, UInt8)
    @test eof(s1)
    close(s1)
    close(s2)

    verbose && println("$name eof...")
    n = length(text) - 1
    @test read!(io(), Vector{UInt8}(n)) ==
          read!(IOBuffer(text), Vector{UInt8}(n))
    @test (s = io(); read!(s, Vector{UInt8}(n)); !eof(s))
    n = length(text)
    @test read!(io(), Vector{UInt8}(n)) ==
          read!(IOBuffer(text), Vector{UInt8}(n))
    @test (s = io(); read!(s, Vector{UInt8}(n)); eof(s))
    n = length(text) + 1
    @test_throws EOFError read!(io(), Vector{UInt8}(n))
    @test_throws EOFError read!(io(), Vector{UInt8}(n))

    old_text = text

    for text in [
        old_text,
        UTF8String(['A' + i % 52 for i in 1:(div(Base.SZ_UNBUFFERED_IO,2))]),
        UTF8String(['A' + i % 52 for i in 1:(    Base.SZ_UNBUFFERED_IO -1)]),
        UTF8String(['A' + i % 52 for i in 1:(    Base.SZ_UNBUFFERED_IO   )]),
        UTF8String(['A' + i % 52 for i in 1:(    Base.SZ_UNBUFFERED_IO +1)])
    ]

        verbose && println("$name readall...")
        @test readall(io()) == text
        cleanup()

        verbose && println("$name readbytes...")
        @test readbytes(io()) == Vector{UInt8}(text)
        cleanup()

        verbose && println("$name readbytes!...")
        l = length(text)
        for n = [1, 2, l-2, l-1, l, l+1, l+2]
            a1 = Vector{UInt8}(n);
            a2 = Vector{UInt8}(n)
            s1 = io()
            s2 = IOBuffer(text)
            n1 = readbytes!(s1, a1)
            n2 = readbytes!(s2, a2)
            @test n1 == n2
            @test length(a1) == length(a2)
            @test a1[1:n1] == a2[1:n2]
            @test n <= length(text) || eof(s1)
            @test n <= length(text) || eof(s2)
            cleanup()
        end

        verbose && println("$name read!...")
        l = length(text)
        for n = [1, 2, l-2, l-1, l]
            @test read!(io(), Vector{UInt8}(n)) ==
                  read!(IOBuffer(text), Vector{UInt8}(n))
            cleanup()
        end
        @test_throws EOFError read!(io(), Vector{UInt8}(length(text)+1))

        cleanup()

        verbose && println("$name readuntil...")
        @test readuntil(io(), '\n') == readuntil(IOBuffer(text),'\n')
        cleanup()
        @test readuntil(io(), "\n") == readuntil(IOBuffer(text),"\n")
        cleanup()
        @test readuntil(io(), ',') == readuntil(IOBuffer(text),',')
        cleanup()

        verbose && println("$name readline...")
        @test readline(io()) == readline(IOBuffer(text))
        cleanup()

        verbose && println("$name readlines...")
        @test readlines(io()) == readlines(IOBuffer(text))
        cleanup()
        @test collect(eachline(io())) == collect(eachline(IOBuffer(text)))
        cleanup()

        verbose && println("$name countlines...")
        @test countlines(io()) == countlines(IOBuffer(text))
        cleanup()

        verbose && println("$name readcsv...")
        @test readcsv(io()) == readcsv(IOBuffer(text))
        cleanup()
    end

    text = old_text


    if !(typeof(io()) in [Base.PipeEndpoint, Pipe, TCPSocket])

        verbose && println("$name position...")
        @test (s = io(); read!(s, Vector{UInt8}(4)); position(s))  == 4

        verbose && println("$name seek...")
        for n = 0:length(text)-1
            @test readlines(seek(io(), n)) == readlines(seek(IOBuffer(text), n))
            cleanup()
        end
        verbose && println("$name skip...")
        for n = 0:length(text)-1
            @test readlines(seek(io(), n)) == readlines(seek(IOBuffer(text), n))
            @test readlines(skip(io(), n)) == readlines(skip(IOBuffer(text), n))
            cleanup()
        end
        verbose && println("$name seekend...")
        @test readall(seekend(io())) == ""
    end

    cleanup()
end

end
