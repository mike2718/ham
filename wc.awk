# 用于统计文本文件中的行、单词数(以空格分隔的)和字符数(计空格)

{
        l = 1
        w = 1
        c = 1
        wc += NF
        cc += length($0)
}

END {
        printf "| %s | %s | %s |\n", l ? NR : "", w ? wc: "", c ? cc : ""
}

