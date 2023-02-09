# This file is a part of Julia. License is MIT: https://julialang.org/license

# Convert # of Rata Die days to proleptic Gregorian calendar y,m,d,w
# Reference: http://mysite.verizon.net/aesir_research/date/date0.htm
function yearmonthday(days)
    z = days + 306; h = 100z - 25; a = fld(h, 3652425); b = a - fld(a, 4)
    y = fld(100b + h, 36525); c = b + z - 365y - fld(y, 4); m = div(5c + 456, 153)
    d = c - div(153m - 457, 5); return m > 12 ? (y + 1, m - 12, d) : (y, m, d)
end
function year(days)
   z = days + 306; h = 100z - 25; a = fld(h, 3652425); b = a - fld(a, 4)
   y = fld(100b + h, 36525); c = b + z - 365y - fld(y, 4); m = div(5c + 456, 153)
   return m > 12 ? y + 1 : y
end
function yearmonth(days)
    z = days + 306; h = 100z - 25; a = fld(h,3652425); b = a - fld(a,4)
    y = fld(100b + h, 36525); c = b + z - 365y - fld(y, 4); m = div(5c + 456, 153)
    return m > 12 ? (y + 1, m - 12) : (y, m)
end
function month(days)
    z = days + 306; h = 100z - 25; a = fld(h,3652425); b = a - fld(a,4)
    y = fld(100b + h, 36525); c = b + z - 365y - fld(y, 4); m = div(5c + 456, 153)
    return m > 12 ? m - 12 : m
end
function monthday(days)
    z = days + 306; h = 100z - 25; a = fld(h,3652425); b = a - fld(a,4)
    y = fld(100b + h, 36525); c = b + z - 365y - fld(y, 4); m = div(5c + 456, 153)
    d = c - div(153m - 457, 5); return m > 12 ? (m - 12, d) : (m, d)
end
function day(days)
    z = days + 306; h = 100z - 25; a = fld(h,3652425); b = a - fld(a,4)
    y = fld(100b + h, 36525); c = b + z - 365y - fld(y, 4); m = div(5c + 456, 153)
    return c - div(153m - 457, 5)
end

# ISO year utils
# https://en.wikipedia.org/wiki/Talk:ISO_week_date#Algorithms
const WEEK_INDEX = (15, 23, 3, 11)
function week(days)
    w = div(abs(days - 1), 7) % 20871
    c, w = divrem((w + (w >= 10435)), 5218)
    w = (w * 28 + WEEK_INDEX[c + 1]) % 1461
    return div(w, 28) + 1
end

"""
Year defined as ISO year. The equivalent is
`week(lastdayofyear(dt) - Day(3))`  as 28 december is always in the last week
"""
function weeksinyear(dt::DateTime)
    firstday = firstdayofyear(dt)
    lastday = lastdayofyear(dt)

    if dayofweek(firstday) == 4 || dayofweek(lastday) == 4
        return 53
    end
    return 52
end

"""
Return current ISO year as defined in
https://en.wikipedia.org/wiki/ISO_week_date
"""
function isoyear(dt::DateTime)
    thisyear = Year(dt)
    thismonth = Month(dt)
    weeknumber = week(dt)
    if weeknumber >= 52 && thismonth.value == 1
        # If it is january, then its the iso year from before
        return Year(thisyear.value - 1)
    elseif weeknumber == 1 && thismonth.value == 12
        # If it is december, then its the next year
        return Year(thisyear.value + 1)
    else
        return thisyear
    end
end

"""
Return current ISO week date as defined in
https://en.wikipedia.org/wiki/ISO_week_date

The return type is a tuple of `Year`, `Week` and `Integer` (from 1 to 7)
"""
isoweekdate(dt::DateTime) = (isoyear(dt), week(dt), dayofweek(dt))

function quarter(days)
    m = month(days)
    return m < 4 ? 1 : m < 7 ? 2 : m < 10 ? 3 : 4
end


# Accessor functions
value(dt::TimeType) = dt.instant.periods.value
value(t::Time) = t.instant.value
days(dt::Date) = value(dt)
days(dt::DateTime) = fld(value(dt), 86400000)
year(dt::TimeType) = year(days(dt))
quarter(dt::TimeType) = quarter(days(dt))
month(dt::TimeType) = month(days(dt))
week(dt::TimeType) = week(days(dt))
day(dt::TimeType) = day(days(dt))
hour(dt::DateTime)   = mod(fld(value(dt), 3600000), 24)
minute(dt::DateTime) = mod(fld(value(dt), 60000), 60)
second(dt::DateTime) = mod(fld(value(dt), 1000), 60)
millisecond(dt::DateTime) = mod(value(dt), 1000)
hour(t::Time)   = mod(fld(value(t), 3600000000000), Int64(24))
minute(t::Time) = mod(fld(value(t), 60000000000), Int64(60))
second(t::Time) = mod(fld(value(t), 1000000000), Int64(60))
millisecond(t::Time) = mod(fld(value(t), Int64(1000000)), Int64(1000))
microsecond(t::Time) = mod(fld(value(t), Int64(1000)), Int64(1000))
nanosecond(t::Time) = mod(value(t), Int64(1000))

dayofmonth(dt::TimeType) = day(dt)

yearmonth(dt::TimeType) = yearmonth(days(dt))
monthday(dt::TimeType) = monthday(days(dt))
yearmonthday(dt::TimeType) = yearmonthday(days(dt))

# Documentation for exported accessors
for func in (:year, :month, :quarter)
    name = string(func)
    @eval begin
        @doc """
            $($name)(dt::TimeType) -> Int64

        The $($name) of a `Date` or `DateTime` as an [`Int64`](@ref).
        """ $func(dt::TimeType)
    end
end

"""
    week(dt::TimeType) -> Int64

Return the [ISO week date](https://en.wikipedia.org/wiki/ISO_week_date) of a `Date` or
`DateTime` as an [`Int64`](@ref). Note that the first week of a year is the week that
contains the first Thursday of the year, which can result in dates prior to January 4th
being in the last week of the previous year. For example, `week(Date(2005, 1, 1))` is the 53rd
week of 2004.

# Examples
```jldoctest
julia> week(Date(1989, 6, 22))
25

julia> week(Date(2005, 1, 1))
53

julia> week(Date(2004, 12, 31))
53
```
"""
week(dt::TimeType)

for func in (:day, :dayofmonth)
    name = string(func)
    @eval begin
        @doc """
            $($name)(dt::TimeType) -> Int64

        The day of month of a `Date` or `DateTime` as an [`Int64`](@ref).
        """ $func(dt::TimeType)
    end
end

"""
    hour(dt::DateTime) -> Int64

The hour of day of a `DateTime` as an [`Int64`](@ref).
"""
hour(dt::DateTime)

for func in (:minute, :second, :millisecond)
    name = string(func)
    @eval begin
        @doc """
            $($name)(dt::DateTime) -> Int64

        The $($name) of a `DateTime` as an [`Int64`](@ref).
        """ $func(dt::DateTime)
    end
end

for parts in (["year", "month"], ["month", "day"], ["year", "month", "day"])
    name = join(parts)
    func = Symbol(name)
    @eval begin
        @doc """
            $($name)(dt::TimeType) -> ($(join(repeated(Int64, length($parts)), ", ")))

        Simultaneously return the $(join($parts, ", ", " and ")) parts of a `Date` or
        `DateTime`.
        """ $func(dt::TimeType)
    end
end

for func in (:hour, :minute, :second, :millisecond, :microsecond, :nanosecond)
    name = string(func)
    @eval begin
        @doc """
            $($name)(t::Time) -> Int64

        The $($name) of a `Time` as an [`Int64`](@ref).
        """ $func(t::Time)
    end
end
