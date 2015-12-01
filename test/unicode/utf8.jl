# This file is a part of Julia. License is MIT: http://julialang.org/license

## Test for CESU-8 sequences

let ch = 0x10000
    for hichar = 0xd800:0xdbff
        for lochar = 0xdc00:0xdfff
            @test convert(UTF8String, utf8(Char[hichar, lochar]).data) == string(Char(ch))
            ch += 1
        end
    end
end


let str = UTF8String(b"this is a test\xed\x80")
    @test next(str, 15) == ('\ufffd', 16)
    @test_throws BoundsError getindex(str, 0:3)
    @test_throws BoundsError getindex(str, 17:18)
    @test_throws BoundsError getindex(str, 2:17)
    @test_throws UnicodeError getindex(str, 16:16)
    @test string(Char(0x110000)) == "\ufffd"
    sa = SubString{ASCIIString}(ascii("This is a silly test"), 1, 14)
    s8 = convert(SubString{UTF8String}, sa)
    @test typeof(s8) == SubString{UTF8String}
    @test s8 == "This is a sill"
    @test convert(UTF8String, b"this is a test\xed\x80\x80") == "this is a test\ud000"
end

let s = UTF8String("🐨🐨")
    #each koala is 4 bytes
    @test s[1:1] == "🐨"
    @test s[1] == '🐨'
    @test s[5:5] == "🐨"
    @test s[5] == '🐨'
    @test s[1:5] == "🐨🐨"
    @test_throws UnicodeError s[1:2]
    @test_throws UnicodeError s[1:3]
    @test_throws UnicodeError s[1:4]
    @test_throws UnicodeError s[1:6]
    @test_throws UnicodeError s[1:7]
    @test_throws UnicodeError s[1:8]
    @test_throws UnicodeError s[5:6]
    @test_throws UnicodeError s[5:7]
    @test_throws UnicodeError s[5:8]
    @test_throws UnicodeError s[1:end-1]
    @test_throws UnicodeError s[1:end-2]
    @test_throws UnicodeError s[1:end-3]
    @test_throws BoundsError s[-1:4]
    @test_throws BoundsError s[3:10]
    @test_throws BoundsError s[-4:40]
end

## Reverse of UTF8String
@test reverse(UTF8String("")) == ""
@test reverse(UTF8String("a")) == "a"
@test reverse(UTF8String("abc")) == "cba"
@test reverse(UTF8String("xyz\uff\u800\uffff\U10ffff")) == "\U10ffff\uffff\u800\uffzyx"
for str in (b"xyz\xc1", b"xyz\xd0", b"xyz\xe0", b"xyz\xed\x80", b"xyz\xf0", b"xyz\xf0\x80",  b"xyz\xf0\x80\x80")
    @test_throws UnicodeError reverse(UTF8String(str))
end

## Specifically check UTF-8 string whose lead byte is same as a surrogate
@test convert(UTF8String,b"\xed\x9f\xbf") == "\ud7ff"
