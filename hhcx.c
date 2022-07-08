// 业余无线电台呼号所属分区信息查询C程序
// 使用方法：
//   $ pcc -Wall -Wpedantic -Wextra -std=c99 hhcx.c -o hhcx
//   $ ./hhcx
// 测试：
//   BS7H, JJ1DSB, BG1AAA, BT55CRF, BT1A, BY1PK, B1Z, B1A
//   K4X, N2ASD, A22A, I20000X, 4X4AAA, 3DA0RS
#include <stdio.h>
#include <string.h>
#include <ctype.h>
void func(char *temp)
{
    char *name;
    name = strtok(temp, ":");
    // 将字符串转换为大写
    char *s = name;
    while (*s)
    {
        *s = toupper((unsigned char) * s);
        s++;
    }
}
int main(void)
{
    const char *f[10][4] =
    {
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
    printf("\n\t业余无线电台呼号所属分区信息查询C程序\n\n");
    printf("请输入要查询的呼号（例子：BH9YYY、bh1aa）：");
    if (fgets(h, 20, stdin))
    {
        h[strcspn(h, "\n")] = 0;
    }
    func(h);
    printf("\n该呼号信息：\n");
    if (strlen(h) == 5 || strlen(h) == 6)   // 5位呼号、6位呼号
    {
        if (h[0] == 'B')   // 国际电信联盟分配给中国
        {

            if (h[1] < 'A' || h[1] > 'Z')
                printf("第二位字符%c：电台类型格式错误！\n", h[1]);
            else if ((h[1] >= 'L' && h[1] <= 'Q') || (h[1] >= 'U' && h[1] <= 'X'))
                // LMNOPQ或UVWX为保留
                printf("第二位字符%c：国家无线电管理机构留作备用\n", h[1]);
            else if (h[1] == 'J')
                printf("第二位字符%c：业余信标台或空间业余无线电台\n", h[1]);
            else if (h[1] == 'R')
                printf("第二位字符%c：业余中继台\n", h[1]);
            else if (h[1] == 'Y')
                printf("第二位字符%c：曾用于指配给集体电台\n", h[1]);
            else if (h[1] == 'Z')
                printf("第二位字符%c：曾用于指配给在集体电台上使用的个人呼号\n", h[1]);
            if (h[2] < '0' || h[2] > '9')
                printf("第三位字符%c：电台分区号非数字！\n", h[2]);
            if (strlen(h) == 5 && h[3] && h[4] && !h[5] && (h[4] < 'A'
                    || h[4] > 'Z'))
                printf("最后一位字符%c不为字母！\n", h[4]);
            if (strlen(h) == 6 && h[3] && h[4] && h[5] && (h[5] < 'A' || h[5] > 'Z'))
                printf("最后一位字符%c不为字母！\n", h[5]);
            int i;
            for (i = 0;  i < 2 ; i++)
            {
                if (strlen(h) == 5 && h[i + 3] > '0' && h[i + 3] < '9')
                    printf("含后缀字符%c的呼号由国家无线电管理机构负责分配\n", h[i + 3]);
            }
            for (i = 0;  i < 3 ; i++)
            {
                if (strlen(h) == 6 && h[i + 3] > '0' && h[i + 3] < '9')
                    printf("含后缀字符%c的呼号由国家无线电管理机构负责分配\n", h[i + 3]);
            }
            switch (h[2])
            {
            case '1':
                printf("第1区\t");
                if (h[3] >= 'A' && h[3] <= 'X')    // 北京
                    printf("%s\n", f[0][0]);
                // 试题格式BH9YY/BH9YYY对策
                else if (strlen(h) == 5 && h[3] && h[4] && !h[5] && (h[3] == 'Y'
                         || h[3] == 'Z'))
                    printf("\n由国家无线电管理机构负责分配的呼号后缀：%c%c\n", h[3], h[4]);
                else if (strlen(h) == 6 && h[3] && h[4] && h[5] && (h[3] == 'Y' || h[3] == 'Z'))
                    printf("\n由国家无线电管理机构负责分配的呼号后缀：%c%c%c\n", h[3], h[4], h[5]);
                break;
            case '2':
                printf("第2区\t");
                if (h[3] >= 'A' && h[3] <= 'H')
                    printf("%s\n", f[1][0]);
                else if (h[3] >= 'I' && h[3] <= 'P')
                    printf("%s\n", f[1][1]);
                else if (h[3] >= 'Q' && h[3] <= 'X')
                    printf("%s\n", f[1][2]);
                else if (strlen(h) == 5 && h[4] && !h[5] && (h[3] == 'Y' || h[3] == 'Z'))
                    printf("\n由国家无线电管理机构负责分配的呼号后缀：%c%c\n", h[3], h[4]);
                else if (strlen(h) == 6 && h[4] && h[5] && (h[3] == 'Y' || h[3] == 'Z'))
                    printf("\n由国家无线电管理机构负责分配的呼号后缀：%c%c%c\n", h[3], h[4], h[5]);
                break;
            case '3':
                printf("第3区\t");
                if (h[3] >= 'A' && h[3] <= 'F')
                    printf("%s\n", f[2][0]);
                else if (h[3] >= 'G' && h[3] <= 'L')
                    printf("%s\n", f[2][1]);
                else if (h[3] >= 'M' && h[3] <= 'R')
                    printf("%s\n", f[2][2]);
                else if (h[3] >= 'S' && h[3] <= 'X')
                    printf("%s\n", f[2][3]);
                else if (strlen(h) == 5 && h[4] && !h[5] && (h[3] == 'Y' || h[3] == 'Z'))
                    printf("\n由国家无线电管理机构负责分配的呼号后缀：%c%c\n", h[3], h[4]);
                else if (strlen(h) == 6 && h[4] && h[5] && (h[3] == 'Y' || h[3] == 'Z'))
                    printf("\n由国家无线电管理机构负责分配的呼号后缀：%c%c%c\n", h[3], h[4], h[5]);
                break;
            case '4':
                printf("第4区\t");
                if (h[3] >= 'A' && h[3] <= 'H')
                    printf("%s\n", f[3][0]);
                else if (h[3] >= 'I' && h[3] <= 'P')
                    printf("%s\n", f[3][1]);
                else if (h[3] >= 'Q' && h[3] <= 'X')
                    printf("%s\n", f[3][2]);
                else if (strlen(h) == 5 && h[4] && !h[5] && (h[3] == 'Y' || h[3] == 'Z'))
                    printf("\n由国家无线电管理机构负责分配的呼号后缀：%c%c\n", h[3], h[4]);
                else if (strlen(h) == 6 && h[4] && h[5] && (h[3] == 'Y' || h[3] == 'Z'))
                    printf("\n由国家无线电管理机构负责分配的呼号后缀：%c%c%c\n", h[3], h[4], h[5]);
                break;
            case '5':
                printf("第5区\t");
                if (h[3] >= 'A' && h[3] <= 'H')
                    printf("%s\n", f[4][0]);
                else if (h[3] >= 'I' && h[3] <= 'P')
                    printf("%s\n", f[4][1]);
                else if (h[3] >= 'Q' && h[3] <= 'X')
                    printf("%s\n", f[4][2]);
                else if (strlen(h) == 5 && h[4] && !h[5] && (h[3] == 'Y' || h[3] == 'Z'))
                    printf("\n由国家无线电管理机构负责分配的呼号后缀：%c%c\n", h[3], h[4]);
                else if (strlen(h) == 6 && h[4] && h[5] && (h[3] == 'Y' || h[3] == 'Z'))
                    printf("\n由国家无线电管理机构负责分配的呼号后缀：%c%c%c\n", h[3], h[4], h[5]);
                break;
            case '6':
                printf("第6区\t");
                if (h[3] >= 'A' && h[3] <= 'H')
                    printf("%s\n", f[5][0]);
                else if (h[3] >= 'I' && h[3] <= 'P')
                    printf("%s\n", f[5][1]);
                else if (h[3] >= 'Q' && h[3] <= 'X')
                    printf("%s\n", f[5][2]);
                else if (strlen(h) == 5 && h[4] && !h[5] && (h[3] == 'Y' || h[3] == 'Z'))
                    printf("\n由国家无线电管理机构负责分配的呼号后缀：%c%c\n", h[3], h[4]);
                else if (strlen(h) == 6 && h[4] && h[5] && (h[3] == 'Y' || h[3] == 'Z'))
                    printf("\n由国家无线电管理机构负责分配的呼号后缀：%c%c%c\n", h[3], h[4], h[5]);
                break;
            case '7':
                printf("第7区\t");
                if (h[3] >= 'A' && h[3] <= 'H')
                    printf("%s\n", f[6][0]);
                else if (h[3] >= 'I' && h[3] <= 'P')
                    printf("%s\n", f[6][1]);
                else if (h[3] >= 'Q' && h[3] <= 'X')
                    printf("%s\n", f[6][2]);
                else if (h[3] >= 'Y' && h[3] <= 'Z')
                    printf("%s\n", f[6][3]);
                //  AAA-ZZZ
                break;
            case '8':
                printf("第8区\t");
                if (h[3] >= 'A' && h[3] <= 'F')
                    printf("%s\n", f[7][0]);
                else if (h[3] >= 'G' && h[3] <= 'L')
                    printf("%s\n", f[7][1]);
                else if (h[3] >= 'M' && h[3] <= 'R')
                    printf("%s\n", f[7][2]);
                else if (h[3] >= 'S' && h[3] <= 'X')
                    printf("%s\n", f[7][3]);
                else if (strlen(h) == 5 && h[4] && !h[5] && (h[3] == 'Y' || h[3] == 'Z'))
                    printf("\n由国家无线电管理机构负责分配的呼号后缀：%c%c\n", h[3], h[4]);
                else if (strlen(h) == 6 && h[4] && h[5] && (h[3] == 'Y' || h[3] == 'Z'))
                    printf("\n由国家无线电管理机构负责分配的呼号后缀：%c%c%c\n", h[3], h[4], h[5]);
                break;
            case '9':
                printf("第9区\t");
                if (h[3] >= 'A' && h[3] <= 'F')
                    printf("%s\n", f[8][0]);
                else if (h[3] >= 'G' && h[3] <= 'L')
                    printf("%s\n", f[8][1]);
                else if (h[3] >= 'M' && h[3] <= 'R')
                    printf("%s\n", f[8][2]);
                else if (h[3] >= 'S' && h[3] <= 'X')
                    printf("%s\n", f[8][3]);
                else if (strlen(h) == 5 && h[4] && !h[5] && (h[3] == 'Y' || h[3] == 'Z'))
                    printf("\n由国家无线电管理机构负责分配的呼号后缀：%c%c\n", h[3], h[4]);
                else if (strlen(h) == 6 && h[4] && h[5] && (h[3] == 'Y' || h[3] == 'Z'))
                    printf("\n由国家无线电管理机构负责分配的呼号后缀：%c%c%c\n", h[3], h[4], h[5]);
                break;
            case '0':
                printf("第0区\t");  // 新疆、西藏
                // AAA-LZZ
                if (h[3] >= 'A' && h[3] <= 'F')
                    printf("%s\n", f[9][0]);
                else if (h[3] >= 'G' && h[3] <= 'L')
                    printf("%s\n", f[9][1]);
                // MAA-ZZZ
                else if (strlen(h) == 5 && h[4] && !h[5] && (h[3] >= 'M' || h[3] <= 'Z'))
                    printf("\n由国家无线电管理机构负责分配的呼号后缀：%c%c\n", h[3], h[4]);
                else if (strlen(h) == 6 && h[4] && h[5] && (h[3] >= 'M' || h[3] <= 'Z'))
                    printf("\n由国家无线电管理机构负责分配的呼号后缀：%c%c%c\n", h[3], h[4], h[5]);
                break;
            }
        }
        else
            printf("呼号前缀第一位字符%c并非中国的呼号！\n", h[0]);
    }
    else if (strlen(h) == 4)     // 4位呼号，规则不明
    {
        if (h[0] == 'B')
        {
            printf("4位呼号%c%c%c%c由国家无线电管理机构负责分配\n", h[0], h[1], h[2],
                   h[3]);
            if (h[0] == 'B' && h[1] == 'S' && h[2] == '7' && h[3] == 'H') // BS7H
                printf("第7区\t黄岩岛\n");
        }
        else
            printf("呼号前缀第一位字符%c并非中国的呼号！\n", h[0]);
    }
    else if (strlen(h) == 7)     // 7位呼号，规则不明
    {
        if (h[0] == 'B')
        {
            printf("7位呼号%c%c%c%c%c%c%c由国家无线电管理机构负责分配\n", h[0], h[1],
                   h[2],
                   h[3], h[4], h[5], h[6]);
        }
        else
            printf("呼号前缀第一位字符%c并非中国的呼号！\n", h[0]);
    }
    else
        printf("\t呼号长度不正确！\n");
    printf("\n");
    return 0;
}
