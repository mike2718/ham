# 用于统计文本文件中的行数和字符数（中文+英文数字）

{
        l = 1
        c = 1
        cc += 1 + length($0)
}

END {
        printf "| %s | %s |\n", l ? NR : "", c ? cc : ""
}

