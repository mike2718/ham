// 业余无线电台呼号所属分区信息查询C程序
// 使用方法：
//   $ clang -Wall -Wpedantic -Wextra -Werror -std=c99 hhcx.c -o hhcx
//   $ ./hhcx
#include <stdio.h>
#include <string.h>
#include <ctype.h>
void func(char *temp) {
    char *name;
    name = strtok(temp, ":");
    // 将字符串转换为大写
    char *s = name;
    while (*s) {
        *s = toupper((unsigned char) *s);
        s++;
    }
}
int main(void) {
    const char *f[10][4] = {
        {"北京"},
        {"黑龙江", "吉林", "辽宁"},
        {"天津", "内蒙古", "河北", "山西"},
        {"上海", "山东", "江苏"},
        {"浙江", "江西", "福建"},
        {"安徽", "河南", "湖北"},
        {"湖南", "广东", "广西", "海南"},
        {"四川", "重庆", "贵州", "云南"},
        {"陕西", "甘肃", "宁夏", "青海"},
        {"新疆", "西藏"}
    };
    char h[20];
    unsigned int i = 0;
    printf("\n\t业余无线电台呼号所属分区信息查询C程序\n\n");
    printf("请输入要查询的呼号（例子：BH9YYY）：");
    if (fgets(h, 20, stdin)) {
        h[strcspn(h, "\n")] = 0;
    }
    func(h);
    printf("\n该呼号信息：\n");
    if (strlen(h) == 6) { // 6位呼号
        if (h[0] != 'B')
            printf("第一字符%c并非中国的呼号！\n", h[0]);
        if (h[1] < 'A' || h[1] > 'Z')
            printf("第二字符%c：电台类型格式错误！\n", h[1]);
        else {
            if ((h[1] >= 'L' && h[1] <= 'Q') || (h[1] >= 'U' && h[1] <= 'X'))
                // LMNOPQ || UVWX
                printf("第二字符%c：国家无线电管理机构留作备用\n", h[1]);
            else if (h[1] == 'J')
                printf("第二字符%c：业余信标台或空间业余无线电台\n", h[1]);
            else if (h[1] == 'R')
                printf("第二字符%c：业余中继台\n", h[1]);
        }
        if (h[2] < '0' || h[2] > '9')
            printf("第三字符%c：电台分区格式错误！\n", h[2]);
        if ((h[3] < 'A' || h[3] > 'Z'))
            printf("第四字符%c：电台呼号后缀格式错误！\n", h[3]);
        if ((h[4] < 'A' || h[4] > 'Z'))
            printf("第五字符%c：电台呼号后缀格式错误！\n", h[4]);
        if ((h[5] < 'A' || h[5] > 'Z'))
            printf("第六字符%c：电台呼号后缀格式错误！\n", h[5]);
        switch (h[2]) {
        case '1':
            printf("第1区\t");
            if (h[3] >= 'A' && h[3] <= 'Z')
                printf("%s\t", f[0][0]);
            if (h[3] >= 'A' && h[3] <= 'X') ;
            else { // 后缀超出范围、试题格式对策
                if (h[3] && h[4] && h[5])
                    printf("未分配的呼号后缀：%c%c%c", h[3], h[4], h[5]);
            }
            printf("\n");
            break;
        }
    }

    if (strlen(h) == 5) { // 5位呼号
        if (h[0] != 'B')
            printf("第一字符%c并非中国的呼号！\n", h[0]);
        if (h[1] < 'A' || h[1] > 'Z')
            printf("第二字符%c：电台类型格式错误！\n", h[1]);
        else {
            if ((h[1] >= 'L' && h[1] <= 'Q') || (h[1] >= 'U' && h[1] <= 'X'))
                // LMNOPQ || UVWX
                printf("第二字符%c：国家无线电管理机构留作备用\n", h[1]);
            else if (h[1] == 'J')
                printf("第二字符%c：业余信标台或空间业余无线电台\n", h[1]);
            else if (h[1] == 'R')
                printf("第二字符%c：业余中继台\n", h[1]);
        }
        if (h[2] < '0' || h[2] > '9') {
            printf("第三字符%c：电台分区格式错误！\n", h[2]);
        }
        if ((h[3] < 'A' || h[3] > 'Z'))
            printf("第四字符%c：电台呼号后缀格式错误！\n", h[3]);
        if ((h[4] < 'A' || h[4] > 'Z'))
            printf("第五字符%c：电台呼号后缀格式错误！\n", h[4]);
        switch (h[2]) {
        case '1':
            printf("第1区\t");
            if (h[3] >= 'A' && h[3] <= 'Z') {
                printf("%s\n", f[0][0]);
                if (h[3] >= 'A' && h[3] <= 'X') ;
                else { // 后缀超出范围、试题格式对策
                    if (strlen(h) == 5 && h[3] && h[4] && !h[5])
                        printf("未分配的呼号后缀：%c%c\n", h[3], h[4]);
                }
            }
            break;
        case '2':
            printf("第2区\t");
            if (h[3] >= 'A' && h[3] <= 'Z') {
                if (h[3] >= 'A' && h[3] <= 'H')
                    printf("%s\n", f[1][0]);
                else if (h[3] >= 'I' && h[3] <= 'P') {
                    printf("%s\n", f[1][1]);
                    i++;
                }
                else if (h[3] >= 'Q' && h[3] <= 'X') {
                    printf("%s\n", f[1][2]);
                    i = i + 2;
                }
                else if (h[3] > 'X' && h[3] <= 'Z' && h[4] && !h[5]) {
                    printf("%s\n", f[1][i]);
                    printf("未分配的呼号后缀：%c%c\n", h[3], h[4]);
                }
            }
            break;
        case '3':
            printf("第3区\t");
            if (h[3] >= 'A' && h[3] <= 'Z') {
                if (h[3] >= 'A' && h[3] <= 'F')
                    printf("%s\n", f[2][0]);
                else if (h[3] >= 'G' && h[3] <= 'L') {
                    printf("%s\n", f[2][1]);
                    i++;
                }
                else if (h[3] >= 'M' && h[3] <= 'R') {
                    printf("%s\n", f[2][2]);
                    i = i + 2;
                }
                else if (h[3] >= 'S' && h[3] <= 'X') {
                    printf("%s\n", f[2][3]);
                    i = i + 3;
                }
                else if (h[3] > 'X' && h[3] <= 'Z' && h[4] && !h[5]) {
                    printf("%s\n", f[2][i]);
                    printf("未分配的呼号后缀：%c%c\n", h[3], h[4]);
                }
            }
            break;
        case '4':
            printf("第4区\t");
            if (h[3] >= 'A' && h[3] <= 'Z') {
                if (h[3] >= 'A' && h[3] <= 'H')
                    printf("%s\n", f[3][0]);
                else if (h[3] >= 'I' && h[3] <= 'P') {
                    printf("%s\n", f[3][1]);
                    i++;
                }
                else if (h[3] >= 'Q' && h[3] <= 'X') {
                    printf("%s\n", f[3][1]);
                    i = i + 2;
                }
                else if (h[3] > 'X' && h[3] <= 'Z' && h[4] && !h[5]) {
                    printf("%s\n", f[3][i]);
                    printf("未分配的呼号后缀：%c%c\n", h[3], h[4]);
                }
            }
            break;
        case '5':
            if (h[3] >= 'A' && h[3] <= 'H')
                printf("\t第5区\t浙江\n");
            else if (h[3] >= 'I' && h[3] <= 'P')
                printf("\t第5区\t江西\n");
            else if (h[3] >= 'Q' && h[3] <= 'X')
                printf("\t第5区\t福建\n");
            break;
        case '6':
            if (h[3] >= 'A' && h[3] <= 'H')
                printf("\t第6区\t安徽\n");
            else if (h[3] >= 'I' && h[3] <= 'P')
                printf("\t第6区\t河南\n");
            else if (h[3] >= 'Q' && h[3] <= 'X')
                printf("\t第6区\t湖北\n");
            break;
        case '7':
            if (h[3] >= 'A' && h[3] <= 'H')
                printf("\t第7区\t湖南\n");
            else if (h[3] >= 'I' && h[3] <= 'P')
                printf("\t第7区\t广东\n");
            else if (h[3] >= 'Q' && h[3] <= 'X')
                printf("\t第7区\t广西\n");
            else if (h[3] >= 'Y' && h[3] <= 'Z')
                printf("\t第7区\t海南\n");
            break;
        case '8':
            if (h[3] >= 'A' && h[3] <= 'F')
                printf("\t第8区\t四川\n");
            else if (h[3] >= 'G' && h[3] <= 'L')
                printf("\t第8区\t重庆\n");
            else if (h[3] >= 'M' && h[3] <= 'R')
                printf("\t第8区\t贵州\n");
            else if (h[3] >= 'S' && h[3] <= 'X')
                printf("\t第8区\t云南\n");
            break;
        case '9':
            if (h[3] >= 'A' && h[3] <= 'F')
                printf("\t第9区\t陕西\n");
            else if (h[3] >= 'G' && h[3] <= 'L')
                printf("\t第9区\t甘肃\n");
            else if (h[3] >= 'M' && h[3] <= 'R')
                printf("\t第9区\t宁夏\n");
            else if (h[3] >= 'S' && h[3] <= 'X')
                printf("\t第9区\t青海\n");
            break;
        case '0':
            if (h[3] >= 'A' && h[3] <= 'F')
                printf("\t第0区\t新疆\n");
            else if (h[3] >= 'G' && h[3] <= 'L')
                printf("\t第0区\t新疆\n");
            break;
        }
        printf("\n");
    }
    else if (strlen(h) == 4) { // 4位呼号、规则未知
        if (h[0] != 'B') // 国际上分配到的
            printf("\t非中国的呼号！\n");
        else {
            if (h[1] == 'S' && h[2] == '7' && h[3] == 'H') // BS7H
                printf("\t第7区\t黄岩岛\n");
        }
    }
    else
        printf("\t呼号长度不正确！\n");
    printf("\n");
    return 0;
}
