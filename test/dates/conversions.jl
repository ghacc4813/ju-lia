# This file is a part of Julia. License is MIT: http://julialang.org/license

# Test conversion to and from unix
@test Dates.unix2datetime(Dates.datetime2unix(DateTime(2000,1,1))) == DateTime(2000,1,1)
@test Dates.value(Dates.DateTime(1970)) == Dates.UNIXEPOCH

# Tests from here: https://en.wikipedia.org/wiki/Unix_time
@test string(Dates.unix2datetime(1095379198.75)) == string("2004-09-16T23:59:58.75")
@test string(Dates.unix2datetime(1095379199.00)) == string("2004-09-16T23:59:59")
@test string(Dates.unix2datetime(1095379199.25)) == string("2004-09-16T23:59:59.25")
@test string(Dates.unix2datetime(1095379199.50)) == string("2004-09-16T23:59:59.5")
@test string(Dates.unix2datetime(1095379199.75)) == string("2004-09-16T23:59:59.75")
@test string(Dates.unix2datetime(1095379200.00)) == string("2004-09-17T00:00:00")
@test string(Dates.unix2datetime(1095379200.25)) == string("2004-09-17T00:00:00.25")
@test string(Dates.unix2datetime(1095379200.50)) == string("2004-09-17T00:00:00.5")
@test string(Dates.unix2datetime(1095379200.75)) == string("2004-09-17T00:00:00.75")
@test string(Dates.unix2datetime(1095379201.00)) == string("2004-09-17T00:00:01")
@test string(Dates.unix2datetime(1095379201.25)) == string("2004-09-17T00:00:01.25")
@test string(Dates.unix2datetime(915148798.75)) == string("1998-12-31T23:59:58.75")
@test string(Dates.unix2datetime(915148799.00)) == string("1998-12-31T23:59:59")
@test string(Dates.unix2datetime(915148799.25)) == string("1998-12-31T23:59:59.25")
@test string(Dates.unix2datetime(915148799.50)) == string("1998-12-31T23:59:59.5")
@test string(Dates.unix2datetime(915148799.75)) == string("1998-12-31T23:59:59.75")
@test string(Dates.unix2datetime(915148800.00)) == string("1999-01-01T00:00:00")
@test string(Dates.unix2datetime(915148800.25)) == string("1999-01-01T00:00:00.25")
@test string(Dates.unix2datetime(915148800.50)) == string("1999-01-01T00:00:00.5")
@test string(Dates.unix2datetime(915148800.75)) == string("1999-01-01T00:00:00.75")
@test string(Dates.unix2datetime(915148801.00)) == string("1999-01-01T00:00:01")
@test string(Dates.unix2datetime(915148801.25)) == string("1999-01-01T00:00:01.25")

# Test conversion to and from Rata Die
@test Date(Dates.rata2datetime(734869)) == Dates.Date(2013,1,1)
@test Dates.datetime2rata(Dates.rata2datetime(734869)) == 734869

# Tests from here: http://mysite.verizon.net/aesir_research/date/back.htm#JDN
@test Dates.julian2datetime(1721119.5) == Dates.DateTime(0,3,1)
@test Dates.julian2datetime(1721424.5) == Dates.DateTime(0,12,31)
@test Dates.julian2datetime(1721425.5) == Dates.DateTime(1,1,1)
@test Dates.julian2datetime(2299149.5) == Dates.DateTime(1582,10,4)
@test Dates.julian2datetime(2415020.5) == Dates.DateTime(1900,1,1)
@test Dates.julian2datetime(2415385.5) == Dates.DateTime(1901,1,1)
@test Dates.julian2datetime(2440587.5) == Dates.DateTime(1970,1,1)
@test Dates.julian2datetime(2444239.5) == Dates.DateTime(1980,1,1)
@test Dates.julian2datetime(2452695.625) == Dates.DateTime(2003,2,25,3)
@test Dates.datetime2julian(Dates.DateTime(2013,12,3,21)) == 2456630.375

@test typeof(Base.now()) <: Libc.ComputerTime
@test typeof(Dates.today()) <: Dates.Date

# Issue #9171, #9169
let t = Dates.Period[Dates.Week(2), Dates.Day(14), Dates.Hour(14*24), Dates.Minute(14*24*60), Dates.Second(14*24*60*60), Dates.Millisecond(14*24*60*60*1000)]
    for i = 1:length(t)
        Pi = typeof(t[i])
        for j = 1:length(t)
            @test t[i] == t[j]
            @test Int(convert(Pi,t[j])) == Int(t[i])
        end
        for j = i+1:length(t)
            Pj = typeof(t[j])
            tj1 = t[j] + one(Pj)
            @test t[i] < tj1
            @test_throws InexactError Pi(tj1)
            @test_throws InexactError Pj(Pi(typemax(Int64)))
            @test_throws InexactError Pj(Pi(typemin(Int64)))
        end
    end
end
@test Dates.Year(3) == Dates.Month(36)
@test Int(convert(Dates.Month, Dates.Year(3))) == 36
@test Int(convert(Dates.Year, Dates.Month(36))) == 3
@test Dates.Year(3) < Dates.Month(37)
@test_throws InexactError convert(Dates.Year, Dates.Month(37))
@test_throws InexactError Dates.Month(Dates.Year(typemax(Int64)))

# Ensure that conversion of 32-bit integers work
let dt = DateTime(1915,1,1,12)
    unix = Int32(Dates.datetime2unix(dt))
    julian = Int32(Dates.datetime2julian(dt))

    @test Dates.unix2datetime(unix) == dt
    @test Dates.julian2datetime(julian) == dt
end

# Conversions to/from numbers
a = Dates.DateTime(2000)
b = Dates.Date(2000)
@test convert(Real,b) == 730120
@test convert(Float64,b) == 730120.0
@test convert(Int32,b) == 730120
@test convert(Real,a) == 63082368000000
@test convert(Float64,a) == 63082368000000.0
@test convert(Int64,a) == 63082368000000
@test convert(DateTime,63082368000000) == a
@test convert(DateTime,63082368000000.0) == a
@test convert(Date,730120) == b
@test convert(Date,730120.0) == b
@test convert(Date,Int32(730120)) == b
