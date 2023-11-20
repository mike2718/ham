# 用于统计文本文件中的行、字数和字符数

{
        l = 1
        w = 1
        c = 1
        wc += NF
        cc += 1 + length($0)
}

END {
        printf "| %s | %s | %s |\n", l ? NR : "", w ? wc: "", c ? cc : ""
}

