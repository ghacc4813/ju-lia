
# Basic goto tests

function goto_test1()
    @goto a
    return false
    @label a
    return true
end
@test goto_test1()


@test_throws ErrorException eval(
    quote
        function goto_test2()
            @goto a
            @label a
            @label a
            return
        end
    end)


@test_throws ErrorException eval(
    quote
        function goto_test3()
            @goto a
            return
        end
    end)


@test_throws ErrorException eval(
    quote
        function goto_test4()
            @goto a
            try
                @label a
            catch
            end
        end
    end)


# test that labels in macros are reassigned
macro goto_test5_macro()
    @label a
end

@test_throws ErrorException eval(
    quote
        function goto_test5()
            @goto a
            @goto_test5_macro
            return
        end
    end)


@test_throws ErrorException eval(
    quote
        function goto_test6()
            try
            finally
                @goto a
            end
            @label a
            return
        end
    end)

