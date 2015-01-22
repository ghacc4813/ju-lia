plain(x) = sprint(plain, x)

function plain(io::IO, content::Vector)
    isempty(content) && return
    for md in content[1:end-1]
        plain(io, md)
        println(io)
    end
    plain(io, content[end])
end

plain(io::IO, md::MD) = plain(io, md.content)

function plain{l}(io::IO, header::Header{l})
    print(io, "#"^l*" ")
    plaininline(io, header.text)
    println(io)
end

function plain(io::IO, code::Code)
    println(io, "```", code.language)
    println(io, code.code)
    println(io, "```")
end

function plain(io::IO, p::Paragraph)
    plaininline(io, p.content)
    println(io)
end

function plain(io::IO, list::List)
    for item in list.items
        print(io, "  * ")
        plaininline(io, item)
        println(io)
    end
end

function plaininline(io::IO, br::LineBreak)
   println(io)
end

function plain(io::IO, md::Table)
    println("asdsa")
    col_widths = reduce(max, map(cell -> map(ansi_length, cell), md.rows))

    for (n, row) in enumerate(md.rows)
        for (i, h) in enumerate(row)
            a = typeof(md.align) == Symbol ? md.align : md.align[i]
            # TODO use not terminal version of print_align
            error("NotImplemented")
            print_align(io, h, col_widths[i], a)
            print(io, " ")
        end
        println(io, "")

        if n == 1
            for (j, w) in enumerate(col_widths)
                if j != 1
                    print(io, "|")
                end
                a = typeof(md.align) == Symbol ? md.align : md.align[j]
                print(io, _dash(w, a) * " ")
            end
            println(io, "")
        end
    end
end

function _dash(width, align)
    if align == :l
        return ":" * "-" ^ max(1, width - 1)
    elseif align == :r
        return "-" ^ max(1, width - 1) * ":"
    elseif align == :c
        return "-" ^ width
    else
        throw(ArgumentError("Unrecognized alignment $align"))
    end
end

plain(io::IO, x) = tohtml(io, x)

# Inline elements

function plaininline(io::IO, md...)
    for el in md
        plaininline(io, el)
    end
end

plaininline(io::IO, md::Vector) = !isempty(md) && plaininline(io, md...)

plaininline(io::IO, md::Image) = print(io, "![$(md.alt)]($(md.url))")

plaininline(io::IO, s::String) = print(io, s)

plaininline(io::IO, md::Bold) = plaininline(io, "**", md.text, "**")

plaininline(io::IO, md::Italic) = plaininline(io, "*", md.text, "*")

plaininline(io::IO, md::Code) = print(io, "`", md.code, "`")

plaininline(io::IO, x) = writemime(io, MIME"text/plain"(), x)

# writemime

Base.writemime(io::IO, ::MIME"text/plain", md::MD) = plain(io, md)
