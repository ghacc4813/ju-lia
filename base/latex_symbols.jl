# Mapping from LaTeX math symbol to the corresponding Unicode codepoint.
# This is used for tab substitution in the REPL.

# The symbol listing was generated from the W3C symbol mapping file:
#         http://www.w3.org/Math/characters/unicode.xml
# by the following Julia script:
#=
using LightXML
xdoc = parse_file("unicode.xml")
latexsym = {}
Ls = Set()
for c in child_nodes(root(xdoc))
    if name(c) == "character" && is_elementnode(c)
        ce = XMLElement(c)
        latex = nothing
        for el in ("AMS", "IEEE", "mathlatex", "latex")
            latex = find_element(ce, el)
            latex != nothing && break
        end
        if latex != nothing
            L = strip(content(latex))
            id = attribute(ce, "id")
            U = string(map(s -> char(parseint(s, 16)),
                           split(id[2:end], "-"))...)
            if ismatch(r"^\\[A-Za-z]+$",L) && !isa(U,ASCIIString)
                if L in Ls
                    println("# duplicated symbol $L ($id)")
                else
                    push!(latexsym, (L, U))
                    push!(Ls, L)
                end
            end
        end
    end
end
println("# ", length(latexsym), " symbols generated from unicode.xml")
for (L, U) in latexsym
    println("    \"$(escape_string(L))\" => \"$(escape_string(U))\",")
end
=#

const latex_symbols = [

# manual additions:

    "\\sqrt" => "\u221A",
    "\\cbrt" => "\u221B",
    "\\female" => "♀",
    "\\mars" => "♂",
    "\\^0" => "⁰",
    "\\^1" => "¹",
    "\\^2" => "²",
    "\\^3" => "³",
    "\\^4" => "⁴",
    "\\^5" => "⁵",
    "\\^6" => "⁶",
    "\\^7" => "⁷",
    "\\^8" => "⁸",
    "\\^9" => "⁹",
    "\\^+" => "⁺",
    "\\^-" => "⁻",
    "\\^=" => "⁼",
    "\\^(" => "⁽",
    "\\^)" => "⁾",
    "\\^n" => "ⁿ",
    "\\^i" => "ⁱ",
    "\\_0" => "₀",
    "\\_1" => "₁",
    "\\_2" => "₂",
    "\\_3" => "₃",
    "\\_4" => "₄",
    "\\_5" => "₅",
    "\\_6" => "₆",
    "\\_7" => "₇",
    "\\_8" => "₈",
    "\\_9" => "₉",
    "\\_+" => "₊",
    "\\_-" => "₋",
    "\\_=" => "₌",
    "\\_(" => "₍",
    "\\_)" => "₎",
    "\\_a" => "ₐ",
    "\\_e" => "ₑ",
    "\\_o" => "ₒ",
    "\\_x" => "ₓ",
    "\\_schwa" => "ₔ",
    "\\_h" => "ₕ",
    "\\_k" => "ₖ",
    "\\_l" => "ₗ",
    "\\_m" => "ₘ",
    "\\_n" => "ₙ",
    "\\_p" => "ₚ",
    "\\_s" => "ₛ",
    "\\_t" => "ₜ",
    "\\hbar" => "ħ",
    "\\del" => "∇",

# 732 symbols generated from unicode.xml
    "\\textexclamdown" => "¡",
    "\\sterling" => "£",
    "\\yen" => "¥",
    "\\textbrokenbar" => "¦",
    "\\S" => "§",
    "\\textasciidieresis" => "¨",
    "\\copyright" => "©",
    "\\textordfeminine" => "ª",
    "\\neg" => "¬",
    "\\circledR" => "®",
    "\\textasciimacron" => "¯",
    "\\degree" => "°",
    "\\pm" => "±",
    "\\textasciiacute" => "´",
    "\\P" => "¶",
    "\\cdotp" => "·",
    "\\textordmasculine" => "º",
    "\\textonequarter" => "¼",
    "\\textonehalf" => "½",
    "\\textthreequarters" => "¾",
    "\\textquestiondown" => "¿",
    "\\AA" => "Å",
    "\\AE" => "Æ",
    "\\DH" => "Ð",
    "\\times" => "×",
    "\\O" => "Ø",
    "\\TH" => "Þ",
    "\\ss" => "ß",
    "\\aa" => "å",
    "\\ae" => "æ",
    "\\eth" => "ð",
    "\\div" => "÷",
    "\\o" => "ø",
    "\\th" => "þ",
    "\\DJ" => "Đ",
    "\\dj" => "đ",
    "\\Elzxh" => "ħ",
    "\\imath" => "ı",
    "\\L" => "Ł",
    "\\l" => "ł",
    "\\NG" => "Ŋ",
    "\\ng" => "ŋ",
    "\\OE" => "Œ",
    "\\oe" => "œ",
    "\\texthvlig" => "ƕ",
    "\\textnrleg" => "ƞ",
    "\\textdoublepipe" => "ǂ",
    "\\Elztrna" => "ɐ",
    "\\Elztrnsa" => "ɒ",
    "\\Elzopeno" => "ɔ",
    "\\Elzrtld" => "ɖ",
    "\\Elzschwa" => "ə",
    "\\varepsilon" => "ɛ",
    "\\Elzpgamma" => "ɣ",
    "\\Elzpbgam" => "ɤ",
    "\\Elztrnh" => "ɥ",
    "\\Elzbtdl" => "ɬ",
    "\\Elzrtll" => "ɭ",
    "\\Elztrnm" => "ɯ",
    "\\Elztrnmlr" => "ɰ",
    "\\Elzltlmr" => "ɱ",
    "\\Elzltln" => "ɲ",
    "\\Elzrtln" => "ɳ",
    "\\Elzclomeg" => "ɷ",
    "\\textphi" => "ɸ",
    "\\Elztrnr" => "ɹ",
    "\\Elztrnrl" => "ɺ",
    "\\Elzrttrnr" => "ɻ",
    "\\Elzrl" => "ɼ",
    "\\Elzrtlr" => "ɽ",
    "\\Elzfhr" => "ɾ",
    "\\Elzrtls" => "ʂ",
    "\\Elzesh" => "ʃ",
    "\\Elztrnt" => "ʇ",
    "\\Elzrtlt" => "ʈ",
    "\\Elzpupsil" => "ʊ",
    "\\Elzpscrv" => "ʋ",
    "\\Elzinvv" => "ʌ",
    "\\Elzinvw" => "ʍ",
    "\\Elztrny" => "ʎ",
    "\\Elzrtlz" => "ʐ",
    "\\Elzyogh" => "ʒ",
    "\\Elzglst" => "ʔ",
    "\\Elzreglst" => "ʕ",
    "\\Elzinglst" => "ʖ",
    "\\textturnk" => "ʞ",
    "\\Elzdyogh" => "ʤ",
    "\\Elztesh" => "ʧ",
    "\\rasp" => "ʼ",
    "\\textasciicaron" => "ˇ",
    "\\Elzverts" => "ˈ",
    "\\Elzverti" => "ˌ",
    "\\Elzlmrk" => "ː",
    "\\Elzhlmrk" => "ˑ",
    "\\Elzsbrhr" => "˒",
    "\\Elzsblhr" => "˓",
    "\\Elzrais" => "˔",
    "\\Elzlow" => "˕",
    "\\u" => "˘",
    "\\texttildelow" => "˜",
    "\\grave" => "̀",
    "\\acute" => "́",
    "\\hat" => "̂",
    "\\tilde" => "̃",
    "\\bar" => "̄",
    "\\breve" => "̆",
    "\\dot" => "̇",
    "\\ddot" => "̈",
    "\\ocirc" => "̊",
    "\\H" => "̋",
    "\\check" => "̌",
    "\\Elzpalh" => "̡",
    "\\Elzrh" => "̢",
    "\\c" => "̧",
    "\\k" => "̨",
    "\\Elzsbbrg" => "̪",
    "\\Elzxl" => "̵",
    "\\Elzbar" => "̶",
    "\\Alpha" => "Α",
    "\\Beta" => "Β",
    "\\Gamma" => "Γ",
    "\\Delta" => "Δ",
    "\\Epsilon" => "Ε",
    "\\Zeta" => "Ζ",
    "\\Eta" => "Η",
    "\\Theta" => "Θ",
    "\\Iota" => "Ι",
    "\\Kappa" => "Κ",
    "\\Lambda" => "Λ",
    "\\Xi" => "Ξ",
    "\\Pi" => "Π",
    "\\Rho" => "Ρ",
    "\\Sigma" => "Σ",
    "\\Tau" => "Τ",
    "\\Upsilon" => "Υ",
    "\\Phi" => "Φ",
    "\\Chi" => "Χ",
    "\\Psi" => "Ψ",
    "\\Omega" => "Ω",
    "\\alpha" => "α",
    "\\beta" => "β",
    "\\gamma" => "γ",
    "\\delta" => "δ",
    "\\zeta" => "ζ",
    "\\eta" => "η",
    "\\theta" => "θ",
    "\\iota" => "ι",
    "\\kappa" => "κ",
    "\\lambda" => "λ",
    "\\mu" => "μ",
    "\\nu" => "ν",
    "\\xi" => "ξ",
    "\\pi" => "π",
    "\\rho" => "ρ",
    "\\varsigma" => "ς",
    "\\sigma" => "σ",
    "\\tau" => "τ",
    "\\upsilon" => "υ",
    "\\varphi" => "φ",
    "\\chi" => "χ",
    "\\psi" => "ψ",
    "\\omega" => "ω",
    "\\vartheta" => "ϑ",
    "\\phi" => "ϕ",
    "\\varpi" => "ϖ",
    "\\Stigma" => "Ϛ",
    "\\Digamma" => "Ϝ",
    "\\digamma" => "ϝ",
    "\\Koppa" => "Ϟ",
    "\\Sampi" => "Ϡ",
    "\\varkappa" => "ϰ",
    "\\varrho" => "ϱ",
    "\\textTheta" => "ϴ",
    "\\epsilon" => "ϵ",
    "\\backepsilon" => "϶",
    "\\enspace" => " ",
    "\\quad" => " ",
    "\\thickspace" => " ",
    "\\thinspace" => " ",
    "\\hspace" => " ",
    "\\endash" => "–",
    "\\emdash" => "—",
    "\\Vert" => "‖",
    "\\lq" => "‘",
    "\\rq" => "’",
    "\\Elzreapos" => "‛",
    "\\textquotedblleft" => "“",
    "\\textquotedblright" => "”",
    "\\dagger" => "†",
    "\\ddagger" => "‡",
    "\\bullet" => "•",
    "\\dots" => "…",
    "\\textperthousand" => "‰",
    "\\textpertenthousand" => "‱",
    "\\prime" => "′",
    "\\backprime" => "‵",
    "\\guilsinglleft" => "‹",
    "\\guilsinglright" => "›",
    "\\nolinebreak" => "\u2060",
    "\\Elzpes" => "₧",
    "\\dddot" => "⃛",
    "\\ddddot" => "⃜",
    "\\hslash" => "ℏ",
    "\\Im" => "ℑ",
    "\\ell" => "ℓ",
    "\\textnumero" => "№",
    "\\wp" => "℘",
    "\\Re" => "ℜ",
    "\\Elzxrat" => "℞",
    "\\texttrademark" => "™",
    "\\mho" => "℧",
    "\\aleph" => "ℵ",
    "\\beth" => "ℶ",
    "\\gimel" => "ℷ",
    "\\daleth" => "ℸ",
    "\\BbbPi" => "ℿ",
    "\\bbsum" => "⅀",
    "\\Game" => "⅁",
    "\\leftarrow" => "←",
    "\\uparrow" => "↑",
    "\\rightarrow" => "→",
    "\\downarrow" => "↓",
    "\\leftrightarrow" => "↔",
    "\\updownarrow" => "↕",
    "\\nwarrow" => "↖",
    "\\nearrow" => "↗",
    "\\searrow" => "↘",
    "\\swarrow" => "↙",
    "\\nleftarrow" => "↚",
    "\\nrightarrow" => "↛",
    "\\leftsquigarrow" => "↜",
    "\\rightsquigarrow" => "↝",
    "\\twoheadleftarrow" => "↞",
    "\\twoheadrightarrow" => "↠",
    "\\leftarrowtail" => "↢",
    "\\rightarrowtail" => "↣",
    "\\mapsto" => "↦",
    "\\hookleftarrow" => "↩",
    "\\hookrightarrow" => "↪",
    "\\looparrowleft" => "↫",
    "\\looparrowright" => "↬",
    "\\leftrightsquigarrow" => "↭",
    "\\nleftrightarrow" => "↮",
    "\\Lsh" => "↰",
    "\\Rsh" => "↱",
    "\\curvearrowleft" => "↶",
    "\\curvearrowright" => "↷",
    "\\circlearrowleft" => "↺",
    "\\circlearrowright" => "↻",
    "\\leftharpoonup" => "↼",
    "\\leftharpoondown" => "↽",
    "\\upharpoonleft" => "↾",
    "\\upharpoonright" => "↿",
    "\\rightharpoonup" => "⇀",
    "\\rightharpoondown" => "⇁",
    "\\downharpoonright" => "⇂",
    "\\downharpoonleft" => "⇃",
    "\\rightleftarrows" => "⇄",
    "\\dblarrowupdown" => "⇅",
    "\\leftrightarrows" => "⇆",
    "\\leftleftarrows" => "⇇",
    "\\upuparrows" => "⇈",
    "\\rightrightarrows" => "⇉",
    "\\downdownarrows" => "⇊",
    "\\leftrightharpoons" => "⇋",
    "\\rightleftharpoons" => "⇌",
    "\\nLeftarrow" => "⇍",
    "\\nRightarrow" => "⇏",
    "\\Leftarrow" => "⇐",
    "\\Uparrow" => "⇑",
    "\\Rightarrow" => "⇒",
    "\\Downarrow" => "⇓",
    "\\Leftrightarrow" => "⇔",
    "\\Updownarrow" => "⇕",
    "\\Lleftarrow" => "⇚",
    "\\Rrightarrow" => "⇛",
    "\\DownArrowUpArrow" => "⇵",
    "\\leftarrowtriangle" => "⇽",
    "\\rightarrowtriangle" => "⇾",
    "\\forall" => "∀",
    "\\complement" => "∁",
    "\\partial" => "∂",
    "\\exists" => "∃",
    "\\nexists" => "∄",
    "\\varnothing" => "∅",
    "\\nabla" => "∇",
    "\\in" => "∈",
    "\\notin" => "∉",
    "\\ni" => "∋",
    "\\prod" => "∏",
    "\\coprod" => "∐",
    "\\sum" => "∑",
    "\\minus" => "−",
    "\\mp" => "∓",
    "\\dotplus" => "∔",
    "\\setminus" => "∖",
    "\\ast" => "∗",
    "\\circ" => "∘",
    "\\surd" => "√",
    "\\propto" => "∝",
    "\\infty" => "∞",
    "\\rightangle" => "∟",
    "\\angle" => "∠",
    "\\measuredangle" => "∡",
    "\\sphericalangle" => "∢",
    "\\mid" => "∣",
    "\\nmid" => "∤",
    "\\parallel" => "∥",
    "\\nparallel" => "∦",
    "\\wedge" => "∧",
    "\\vee" => "∨",
    "\\cap" => "∩",
    "\\cup" => "∪",
    "\\int" => "∫",
    "\\iint" => "∬",
    "\\iiint" => "∭",
    "\\oint" => "∮",
    "\\oiint" => "∯",
    "\\oiiint" => "∰",
    "\\clwintegral" => "∱",
    "\\therefore" => "∴",
    "\\because" => "∵",
    "\\Colon" => "∷",
    "\\dotminus" => "∸",
    "\\kernelcontraction" => "∻",
    "\\sim" => "∼",
    "\\backsim" => "∽",
    "\\lazysinv" => "∾",
    "\\wr" => "≀",
    "\\nsim" => "≁",
    "\\eqsim" => "≂",
    "\\neqsim" => "≂̸",
    "\\simeq" => "≃",
    "\\nsime" => "≄",
    "\\cong" => "≅",
    "\\approxnotequal" => "≆",
    "\\ncong" => "≇",
    "\\approx" => "≈",
    "\\napprox" => "≉",
    "\\approxeq" => "≊",
    "\\tildetrpl" => "≋",
    "\\allequal" => "≌",
    "\\asymp" => "≍",
    "\\Bumpeq" => "≎",
    "\\nBumpeq" => "≎̸",
    "\\bumpeq" => "≏",
    "\\nbumpeq" => "≏̸",
    "\\doteq" => "≐",
    "\\Doteq" => "≑",
    "\\fallingdotseq" => "≒",
    "\\risingdotseq" => "≓",
    "\\coloneq" => "≔",
    "\\eqcolon" => "≕",
    "\\eqcirc" => "≖",
    "\\circeq" => "≗",
    "\\wedgeq" => "≙",
    "\\starequal" => "≛",
    "\\triangleq" => "≜",
    "\\questeq" => "≟",
    "\\ne" => "≠",
    "\\equiv" => "≡",
    "\\nequiv" => "≢",
    "\\le" => "≤",
    "\\ge" => "≥",
    "\\leqq" => "≦",
    "\\geqq" => "≧",
    "\\lneqq" => "≨",
    "\\lvertneqq" => "≨︀",
    "\\gneqq" => "≩",
    "\\gvertneqq" => "≩︀",
    "\\ll" => "≪",
    "\\NotLessLess" => "≪̸",
    "\\gg" => "≫",
    "\\NotGreaterGreater" => "≫̸",
    "\\between" => "≬",
    "\\nless" => "≮",
    "\\ngtr" => "≯",
    "\\nleq" => "≰",
    "\\ngeq" => "≱",
    "\\lesssim" => "≲",
    "\\gtrsim" => "≳",
    "\\lessgtr" => "≶",
    "\\gtrless" => "≷",
    "\\notlessgreater" => "≸",
    "\\notgreaterless" => "≹",
    "\\prec" => "≺",
    "\\succ" => "≻",
    "\\preccurlyeq" => "≼",
    "\\succcurlyeq" => "≽",
    "\\precsim" => "≾",
    "\\nprecsim" => "≾̸",
    "\\succsim" => "≿",
    "\\nsuccsim" => "≿̸",
    "\\nprec" => "⊀",
    "\\nsucc" => "⊁",
    "\\subset" => "⊂",
    "\\supset" => "⊃",
    "\\nsubset" => "⊄",
    "\\nsupset" => "⊅",
    "\\subseteq" => "⊆",
    "\\supseteq" => "⊇",
    "\\nsubseteq" => "⊈",
    "\\nsupseteq" => "⊉",
    "\\subsetneq" => "⊊",
    "\\varsubsetneqq" => "⊊︀",
    "\\supsetneq" => "⊋",
    "\\varsupsetneq" => "⊋︀",
    "\\cupdot" => "⊍",
    "\\uplus" => "⊎",
    "\\sqsubset" => "⊏",
    "\\NotSquareSubset" => "⊏̸",
    "\\sqsupset" => "⊐",
    "\\NotSquareSuperset" => "⊐̸",
    "\\sqsubseteq" => "⊑",
    "\\sqsupseteq" => "⊒",
    "\\sqcap" => "⊓",
    "\\sqcup" => "⊔",
    "\\oplus" => "⊕",
    "\\ominus" => "⊖",
    "\\otimes" => "⊗",
    "\\oslash" => "⊘",
    "\\odot" => "⊙",
    "\\circledcirc" => "⊚",
    "\\circledast" => "⊛",
    "\\circleddash" => "⊝",
    "\\boxplus" => "⊞",
    "\\boxminus" => "⊟",
    "\\boxtimes" => "⊠",
    "\\boxdot" => "⊡",
    "\\vdash" => "⊢",
    "\\dashv" => "⊣",
    "\\top" => "⊤",
    "\\perp" => "⊥",
    "\\models" => "⊧",
    "\\vDash" => "⊨",
    "\\Vdash" => "⊩",
    "\\Vvdash" => "⊪",
    "\\VDash" => "⊫",
    "\\nvdash" => "⊬",
    "\\nvDash" => "⊭",
    "\\nVdash" => "⊮",
    "\\nVDash" => "⊯",
    "\\vartriangleleft" => "⊲",
    "\\vartriangleright" => "⊳",
    "\\trianglelefteq" => "⊴",
    "\\trianglerighteq" => "⊵",
    "\\original" => "⊶",
    "\\image" => "⊷",
    "\\multimap" => "⊸",
    "\\hermitconjmatrix" => "⊹",
    "\\intercal" => "⊺",
    "\\veebar" => "⊻",
    "\\rightanglearc" => "⊾",
    "\\bigwedge" => "⋀",
    "\\bigvee" => "⋁",
    "\\bigcap" => "⋂",
    "\\bigcup" => "⋃",
    "\\diamond" => "⋄",
    "\\cdot" => "⋅",
    "\\star" => "⋆",
    "\\divideontimes" => "⋇",
    "\\bowtie" => "⋈",
    "\\ltimes" => "⋉",
    "\\rtimes" => "⋊",
    "\\leftthreetimes" => "⋋",
    "\\rightthreetimes" => "⋌",
    "\\backsimeq" => "⋍",
    "\\curlyvee" => "⋎",
    "\\curlywedge" => "⋏",
    "\\Subset" => "⋐",
    "\\Supset" => "⋑",
    "\\Cap" => "⋒",
    "\\Cup" => "⋓",
    "\\pitchfork" => "⋔",
    "\\lessdot" => "⋖",
    "\\gtrdot" => "⋗",
    "\\verymuchless" => "⋘",
    "\\ggg" => "⋙",
    "\\lesseqgtr" => "⋚",
    "\\gtreqless" => "⋛",
    "\\curlyeqprec" => "⋞",
    "\\curlyeqsucc" => "⋟",
    "\\Elzsqspne" => "⋥",
    "\\lnsim" => "⋦",
    "\\gnsim" => "⋧",
    "\\precnsim" => "⋨",
    "\\succnsim" => "⋩",
    "\\ntriangleleft" => "⋪",
    "\\ntriangleright" => "⋫",
    "\\ntrianglelefteq" => "⋬",
    "\\ntrianglerighteq" => "⋭",
    "\\vdots" => "⋮",
    "\\cdots" => "⋯",
    "\\adots" => "⋰",
    "\\ddots" => "⋱",
    "\\barwedge" => "⌅",
    "\\lceil" => "⌈",
    "\\rceil" => "⌉",
    "\\lfloor" => "⌊",
    "\\rfloor" => "⌋",
    "\\recorder" => "⌕",
    "\\ulcorner" => "⌜",
    "\\urcorner" => "⌝",
    "\\llcorner" => "⌞",
    "\\lrcorner" => "⌟",
    "\\frown" => "⌢",
    "\\smile" => "⌣",
    "\\langle" => "〈",
    "\\rangle" => "〉",
    "\\obar" => "⌽",
    "\\Elzdlcorn" => "⎣",
    "\\lmoustache" => "⎰",
    "\\rmoustache" => "⎱",
    "\\textvisiblespace" => "␣",
    "\\circledS" => "Ⓢ",
    "\\Elzdshfnc" => "┆",
    "\\Elzsqfnw" => "┙",
    "\\diagup" => "╱",
    "\\diagdown" => "╲",
    "\\blacksquare" => "■",
    "\\square" => "□",
    "\\Elzvrecto" => "▯",
    "\\bigtriangleup" => "△",
    "\\blacktriangle" => "▴",
    "\\vartriangle" => "▵",
    "\\blacktriangleright" => "▸",
    "\\triangleright" => "▹",
    "\\bigtriangledown" => "▽",
    "\\blacktriangledown" => "▾",
    "\\triangledown" => "▿",
    "\\blacktriangleleft" => "◂",
    "\\triangleleft" => "◃",
    "\\lozenge" => "◊",
    "\\bigcirc" => "○",
    "\\Elzcirfl" => "◐",
    "\\Elzcirfr" => "◑",
    "\\Elzcirfb" => "◒",
    "\\Elzrvbull" => "◘",
    "\\Elzsqfl" => "◧",
    "\\Elzsqfr" => "◨",
    "\\Elzsqfse" => "◪",
    "\\bigstar" => "★",
    "\\rightmoon" => "☾",
    "\\mercury" => "☿",
    "\\venus" => "♀",
    "\\male" => "♂",
    "\\jupiter" => "♃",
    "\\saturn" => "♄",
    "\\uranus" => "♅",
    "\\neptune" => "♆",
    "\\pluto" => "♇",
    "\\aries" => "♈",
    "\\taurus" => "♉",
    "\\gemini" => "♊",
    "\\cancer" => "♋",
    "\\leo" => "♌",
    "\\virgo" => "♍",
    "\\libra" => "♎",
    "\\scorpio" => "♏",
    "\\sagittarius" => "♐",
    "\\capricornus" => "♑",
    "\\aquarius" => "♒",
    "\\pisces" => "♓",
    "\\spadesuit" => "♠",
    "\\heartsuit" => "♡",
    "\\diamondsuit" => "♢",
    "\\clubsuit" => "♣",
    "\\quarternote" => "♩",
    "\\eighthnote" => "♪",
    "\\flat" => "♭",
    "\\natural" => "♮",
    "\\sharp" => "♯",
    "\\checkmark" => "✓",
    "\\maltese" => "✠",
    "\\longleftarrow" => "⟵",
    "\\longrightarrow" => "⟶",
    "\\longleftrightarrow" => "⟷",
    "\\Longleftarrow" => "⟸",
    "\\Longrightarrow" => "⟹",
    "\\Longleftrightarrow" => "⟺",
    "\\longmapsto" => "⟼",
    "\\Mapsfrom" => "⤆",
    "\\Mapsto" => "⤇",
    "\\Uuparrow" => "⤊",
    "\\Ddownarrow" => "⤋",
    "\\bkarow" => "⤍",
    "\\dbkarow" => "⤏",
    "\\drbkarrow" => "⤐",
    "\\UpArrowBar" => "⤒",
    "\\DownArrowBar" => "⤓",
    "\\twoheadrightarrowtail" => "⤖",
    "\\hksearow" => "⤥",
    "\\hkswarow" => "⤦",
    "\\tona" => "⤧",
    "\\toea" => "⤨",
    "\\tosa" => "⤩",
    "\\towa" => "⤪",
    "\\rdiagovfdiag" => "⤫",
    "\\fdiagovrdiag" => "⤬",
    "\\seovnearrow" => "⤭",
    "\\neovsearrow" => "⤮",
    "\\fdiagovnearrow" => "⤯",
    "\\rdiagovsearrow" => "⤰",
    "\\neovnwarrow" => "⤱",
    "\\nwovnearrow" => "⤲",
    "\\ElzRlarr" => "⥂",
    "\\ElzrLarr" => "⥄",
    "\\Elzrarrx" => "⥇",
    "\\LeftRightVector" => "⥎",
    "\\RightUpDownVector" => "⥏",
    "\\DownLeftRightVector" => "⥐",
    "\\LeftUpDownVector" => "⥑",
    "\\LeftVectorBar" => "⥒",
    "\\RightVectorBar" => "⥓",
    "\\RightUpVectorBar" => "⥔",
    "\\RightDownVectorBar" => "⥕",
    "\\DownLeftVectorBar" => "⥖",
    "\\DownRightVectorBar" => "⥗",
    "\\LeftUpVectorBar" => "⥘",
    "\\LeftDownVectorBar" => "⥙",
    "\\LeftTeeVector" => "⥚",
    "\\RightTeeVector" => "⥛",
    "\\RightUpTeeVector" => "⥜",
    "\\RightDownTeeVector" => "⥝",
    "\\DownLeftTeeVector" => "⥞",
    "\\DownRightTeeVector" => "⥟",
    "\\LeftUpTeeVector" => "⥠",
    "\\LeftDownTeeVector" => "⥡",
    "\\UpEquilibrium" => "⥮",
    "\\ReverseUpEquilibrium" => "⥯",
    "\\RoundImplies" => "⥰",
    "\\Vvert" => "⦀",
    "\\Elroang" => "⦆",
    "\\Elzddfnc" => "⦙",
    "\\Angle" => "⦜",
    "\\Elzlpargt" => "⦠",
    "\\obslash" => "⦸",
    "\\boxdiag" => "⧄",
    "\\boxbslash" => "⧅",
    "\\boxast" => "⧆",
    "\\boxcircle" => "⧇",
    "\\ElzLap" => "⧊",
    "\\Elzdefas" => "⧋",
    "\\LeftTriangleBar" => "⧏",
    "\\NotLeftTriangleBar" => "⧏̸",
    "\\RightTriangleBar" => "⧐",
    "\\NotRightTriangleBar" => "⧐̸",
    "\\dualmap" => "⧟",
    "\\shuffle" => "⧢",
    "\\blacklozenge" => "⧫",
    "\\RuleDelayed" => "⧴",
    "\\bigodot" => "⨀",
    "\\bigoplus" => "⨁",
    "\\bigotimes" => "⨂",
    "\\bigcupdot" => "⨃",
    "\\biguplus" => "⨄",
    "\\bigsqcap" => "⨅",
    "\\bigsqcup" => "⨆",
    "\\conjquant" => "⨇",
    "\\disjquant" => "⨈",
    "\\bigtimes" => "⨉",
    "\\iiiint" => "⨌",
    "\\intbar" => "⨍",
    "\\intBar" => "⨎",
    "\\clockoint" => "⨏",
    "\\sqrint" => "⨖",
    "\\intx" => "⨘",
    "\\intcap" => "⨙",
    "\\intcup" => "⨚",
    "\\upint" => "⨛",
    "\\lowint" => "⨜",
    "\\plusdot" => "⨥",
    "\\minusdot" => "⨪",
    "\\ElzTimes" => "⨯",
    "\\btimes" => "⨲",
    "\\intprod" => "⨼",
    "\\intprodr" => "⨽",
    "\\amalg" => "⨿",
    "\\ElzAnd" => "⩓",
    "\\ElzOr" => "⩔",
    "\\ElOr" => "⩖",
    "\\perspcorrespond" => "⩞",
    "\\Elzminhat" => "⩟",
    "\\Equal" => "⩵",
    "\\ddotseq" => "⩷",
    "\\leqslant" => "⩽",
    "\\nleqslant" => "⩽̸",
    "\\geqslant" => "⩾",
    "\\ngeqslant" => "⩾̸",
    "\\lessapprox" => "⪅",
    "\\gtrapprox" => "⪆",
    "\\lneq" => "⪇",
    "\\gneq" => "⪈",
    "\\lnapprox" => "⪉",
    "\\gnapprox" => "⪊",
    "\\lesseqqgtr" => "⪋",
    "\\gtreqqless" => "⪌",
    "\\eqslantless" => "⪕",
    "\\eqslantgtr" => "⪖",
    "\\NestedLessLess" => "⪡",
    "\\NotNestedLessLess" => "⪡̸",
    "\\NestedGreaterGreater" => "⪢",
    "\\NotNestedGreaterGreater" => "⪢̸",
    "\\partialmeetcontraction" => "⪣",
    "\\bumpeqq" => "⪮",
    "\\preceq" => "⪯",
    "\\npreceq" => "⪯̸",
    "\\succeq" => "⪰",
    "\\nsucceq" => "⪰̸",
    "\\precneqq" => "⪵",
    "\\succneqq" => "⪶",
    "\\precapprox" => "⪷",
    "\\succapprox" => "⪸",
    "\\precnapprox" => "⪹",
    "\\succnapprox" => "⪺",
    "\\subseteqq" => "⫅",
    "\\nsubseteqq" => "⫅̸",
    "\\supseteqq" => "⫆",
    "\\nsupseteqq" => "⫆̸",
    "\\subsetneqq" => "⫋",
    "\\supsetneqq" => "⫌",
    "\\mlcp" => "⫛",
    "\\forks" => "⫝̸",
    "\\forksnot" => "⫝",
    "\\dashV" => "⫣",
    "\\Dashv" => "⫤",
    "\\interleave" => "⫴",
    "\\Elztdcol" => "⫶",
    "\\openbracketleft" => "〚",
    "\\openbracketright" => "〛",
    "\\overbrace" => "︷",
    "\\underbrace" => "︸",


]
