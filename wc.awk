{
        l = 1
        c = 1
        wc += NF
        cc += 1 + length($0)
}

END {
        printf "| %s | %s |\n", l ? NR : "", c ? cc : ""
}
