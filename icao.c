// 将呼号转换成ICAO字母解释法的单词组合的C程序
// 用法：
//   $ gcc -Wall -Wpedantic -Wextra -std=c99 -o icao icao.c
//   $ ./icao
// 特别鸣谢：ChatGPT
#include <stdio.h>
#include <ctype.h>
#include <string.h>

const char* natoTranslate(char c)
{
    switch (toupper(c))
    {
    case 'A':
        return "Alfa";
    case 'B':
        return "Bravo";
    case 'C':
        return "Charlie";
    case 'D':
        return "Delta";
    case 'E':
        return "Echo";
    case 'F':
        return "Foxtrot";
    case 'G':
        return "Golf";
    case 'H':
        return "Hotel";
    case 'I':
        return "India";
    case 'J':
        return "Juliett";
    case 'K':
        return "Kilo";
    case 'L':
        return "Lima";
    case 'M':
        return "Mike";
    case 'N':
        return "November";
    case 'O':
        return "Oscar";
    case 'P':
        return "Papa";
    case 'Q':
        return "Quebec";
    case 'R':
        return "Romeo";
    case 'S':
        return "Sierra";
    case 'T':
        return "Tango";
    case 'U':
        return "Uniform";
    case 'V':
        return "Victor";
    case 'W':
        return "Whiskey";
    case 'X':
        return "X-ray";
    case 'Y':
        return "Yankee";
    case '0':
        return "Zero";
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
        return "Portable";
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
        if (ch[i] == '/' || isalnum(ch[i]))
            printf("%c", ch[i]);
    }
    printf("的字母解释法是：");
    for (i = 0; ch[i] != '\0'; i++)
    {
        if (ch[i] == '/' || isalnum(ch[i]))
            printf("%s ", natoTranslate(ch[i]));
    }
    printf("\n");
    return 0;
}
