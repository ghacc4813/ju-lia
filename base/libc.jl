## time-related functions ##

# TODO: check for usleep errors?
@unix_only systemsleep(s::Real) = ccall(:usleep, Int32, (UInt32,), uint32(iround(s*1e6)))
@windows_only systemsleep(s::Real) = (ccall(:Sleep, stdcall, Void, (UInt32,), uint32(iround(s*1e3))); return int32(0))

type TmStruct
    sec::Int32
    min::Int32
    hour::Int32
    mday::Int32
    month::Int32
    year::Int32
    wday::Int32
    yday::Int32
    isdst::Int32
    # on some platforms the struct is 14 words, even though 9 are specified
    _10::Int32
    _11::Int32
    _12::Int32
    _13::Int32
    _14::Int32

    TmStruct(sec, min, hour, mday, month, year, wday, yday, isdst) =
        new(sec, min, hour, mday, month, year, wday, yday, isdst, 0,0,0,0,0)
    TmStruct() = new(0,0,0,0,0,0,0,0,0,0,0,0,0,0)
    function TmStruct(t::Real)
        t = floor(t)
        tm = TmStruct()
        # TODO: add support for UTC via gmtime_r()
        ccall(:localtime_r, Ptr{Void}, (Ptr{Int}, Ptr{Void}), &t, &tm)
        return tm
    end
end

strftime(t) = strftime("%c", t)
strftime(fmt::AbstractString, t::Real) = strftime(fmt, TmStruct(t))
function strftime(fmt::AbstractString, tm::TmStruct)
    timestr = Array(UInt8, 128)
    n = ccall(:strftime, Int, (Ptr{UInt8}, Int, Ptr{UInt8}, Ptr{Void}),
              timestr, length(timestr), fmt, &tm)
    if n == 0
        return ""
    end
    bytestring(convert(Ptr{UInt8},timestr))
end

strptime(timestr::AbstractString) = strptime("%c", timestr)
function strptime(fmt::AbstractString, timestr::AbstractString)
    tm = TmStruct()
    r = ccall(:strptime, Ptr{UInt8}, (Ptr{UInt8}, Ptr{UInt8}, Ptr{Void}),
              timestr, fmt, &tm)
    # the following would tell mktime() that this is a local time, and that
    # it should try to guess the timezone. not sure if/how this should be
    # exposed in the API.
    # tm.isdst = -1
    if r == C_NULL
        error("invalid arguments")
    end
    @osx_only begin
        # if we didn't explicitly parse the weekday or year day, use mktime
        # to fill them in automatically.
        if !ismatch(r"([^%]|^)%(a|A|j|w|Ow)", fmt)
            ccall(:mktime, Int, (Ptr{Void},), &tm)
        end
    end
    tm
end

time(tm::TmStruct) = float64(ccall(:mktime, Int, (Ptr{Void},), &tm))

## process-related functions ##

getpid() = ccall(:jl_getpid, Int32, ())

## password directory functions ##

type PasswdStruct
    name::Ptr{UInt8}
    passwd::Ptr{UInt8}
    uid::Int32
    gid::Int32
    change::Int64
    class::Ptr{UInt8}
    gecos::Ptr{UInt8}
    dir::Ptr{UInt8}
    shell::Ptr{UInt8}
    expire::Int64
    field::Int32
end

function PasswdStruct(name::AbstractString)
    pwd = PasswdStruct(
        C_NULL, C_NULL, 0, 0, 0, C_NULL, C_NULL, C_NULL, C_NULL, 0, 0
    )
    # TODO: can I use normal copy()?
    result = [deepcopy(pwd)]
    # TODO: what if the buffer needs to be larger?
    bufsize = 1024
    buf = Array(UInt8, bufsize)
    err = ccall(
        :getpwnam_r,
        Cint,
        (Ptr{UInt8}, Ptr{Void}, Ptr{UInt8}, Int64, Ptr{Ptr{Void}}),
        name, &pwd, buf, bufsize, &result
    )
    # user not in password database
    if err == 0 && pwd.name == C_NULL
        # TODO: should this be an error or warning?
        error("unable to find user $(name) in password database")
    elseif err == 0
        return pwd
    else
        error("getpwnam_r returned error code: $(err)")
    end
end

## network functions ##

function gethostname()
    hn = Array(UInt8, 256)
    @unix_only err=ccall(:gethostname, Int32, (Ptr{UInt8}, UInt), hn, length(hn))
    @windows_only err=ccall(:gethostname, stdcall, Int32, (Ptr{UInt8}, UInt32), hn, length(hn))
    systemerror("gethostname", err != 0)
    bytestring(convert(Ptr{UInt8},hn))
end

## Memory related ##

c_free(p::Ptr) = ccall(:free, Void, (Ptr{Void},), p)
c_malloc(size::Integer) = ccall(:malloc, Ptr{Void}, (Csize_t,), size)
c_realloc(p::Ptr, size::Integer) = ccall(:realloc, Ptr{Void}, (Ptr{Void}, Csize_t), p, size)
c_calloc(num::Integer, size::Integer) = ccall(:calloc, Ptr{Void}, (Csize_t, Csize_t), num, size)
