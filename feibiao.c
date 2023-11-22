// 将呼号转换成非标准字母解释法的单词组合的C程序
// 用法：
//   $ gcc -Wall -Wpedantic -Wextra -std=c99 -o feibiao feibiao.c
//   $ ./feibiao
// 特别鸣谢：ChatGPT
#include <stdio.h>
#include <ctype.h>
#include <string.h>

const char* natoTranslate(char c)
{
    switch (toupper(c))
    {
    case 'A':
        return "America";
    case 'B':
        return "Boston";
    case 'C':
        return "Canada";
    case 'D':
        return "Denmark";
    case 'E':
        return "England";
    case 'F':
        return "Florida";
    case 'G':
        return "Germany";
    case 'H':
        return "Honolulu";
    case 'I':
        return "Italy";
    case 'J':
        return "Japan";
    case 'K':
        return "Kilowatt";
    case 'L':
        return "London";
    case 'M':
        return "Mexico";
    case 'N':
        return "Norway";
    case 'O':
        return "Ontario";
    case 'P':
        return "Peter";
    case 'Q':
        return "Queen";
    case 'R':
        return "Radio";
    case 'S':
        return "Sugar";
    case 'T':
        return "Tokyo";
    case 'U':
        return "United";
    case 'V':
        return "Virginia";
    case 'W':
        return "Washington";
    case 'X':
        return "X-ray";
    case 'Y':
        return "Yokohama";
    case '0':
        return "Zanzibar";
    case '1':
        return "One";
    case '2':
        return "Two";
    case '3':
        return "Three";
    case '4':
        return "Four";
    case '5':
        return "Five";
    case '6':
        return "Six";
    case '7':
        return "Seven";
    case '8':
        return "Eight";
    case '9':
        return "Nine";
    case '/':
        return "Stroke";
    default:
        return 0;
    }
}

int main(void)
{
    printf("请输入要翻译的呼号：");
    char ch[64];
    int i;
    if (fgets(ch, 64, stdin))
    {
        ch[strcspn(ch, "\n")] = 0;
    }
    for (i = 0; ch[i] != '\0'; i++)
    {
        if (isalnum(ch[i]) || ch[i] == '/')
            printf("%c", ch[i]);
    }
    printf("的字母解释法是：");
    for (i = 0; ch[i] != '\0'; i++)
    {
        if (isalnum(ch[i]) || ch[i] == '/')
            printf("%s ", natoTranslate(ch[i]));
    }
    printf("\n");
    return 0;
}
