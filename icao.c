//   将呼号转换成字母解释法的单词组合的C程序
//   用法：
//   $ clang -O0 -Wall -Wpedantic -Wextra -Werror -std=c99 -o icao icao.c
//   $ ./icao
#include <stdio.h>
#include <string.h>
int main (void)
{
    char word[10] = {'\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0'};
    char phonetic[100] = {'\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0',
                          '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0',
                          '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0',
                          '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0',
                          '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0',
                          '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0',
                          '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0',
                          '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0',
                          '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0',
                          '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0', '\0'
                         };
    unsigned int count = 0;
    printf("\n\t将呼号转换成字母解释法的单词组合的C程序\n\n");
    printf("请输入要转换的呼号：");
    if (fgets(word, 10, stdin))
    {
        word[strcspn(word, "\n")] = 0;
    }
    while(count < sizeof(word))
    {
        switch (word[count])
        {
        case 'A':
        case 'a':
            strcat(phonetic, " Alfa");
            break;
        case 'B':
        case 'b':
            strcat(phonetic, " Bravo");
            break;
        case 'C':
        case 'c':
            strcat(phonetic, " Charlie");
            break;
        case 'D':
        case 'd':
            strcat(phonetic, " Delta");
            break;
        case 'E':
        case 'e':
            strcat(phonetic, " Echo");
            break;
        case 'F':
        case 'f':
            strcat(phonetic, " Foxtrot");
            break;
        case 'G':
        case 'g':
            strcat(phonetic, " Golf");
            break;
        case 'H':
        case 'h':
            strcat(phonetic, " Hotel");
            break;
        case 'I':
        case 'i':
            strcat(phonetic, " India");
            break;
        case 'J':
        case 'j':
            strcat(phonetic, " Juliett");
            break;
        case 'K':
        case 'k':
            strcat(phonetic, " Kilo");
            break;
        case 'L':
        case 'l':
            strcat(phonetic, " Lima");
            break;
        case 'M':
        case 'm':
            strcat(phonetic, " Mike");
            break;
        case 'N':
        case 'n':
            strcat(phonetic, " November");
            break;
        case 'O':
        case 'o':
            strcat(phonetic, " Oscar");
            break;
        case 'P':
        case 'p':
            strcat(phonetic, " Papa");
            break;
        case 'Q':
        case 'q':
            strcat(phonetic, " Quebec");
            break;
        case 'R':
        case 'r':
            strcat(phonetic, " Romeo");
            break;
        case 'S':
        case 's':
            strcat(phonetic, " Sierra");
            break;
        case 'T':
        case 't':
            strcat(phonetic, " Tango");
            break;
        case 'U':
        case 'u':
            strcat(phonetic, " Uniform");
            break;
        case 'V':
        case 'v':
            strcat(phonetic, " Victor");
            break;
        case 'W':
        case 'w':
            strcat(phonetic, " Whiskey");
            break;
        case 'X':
        case 'x':
            strcat(phonetic, " X-ray");
            break;
        case 'Y':
        case 'y':
            strcat(phonetic, " Yankee");
            break;
        case 'Z':
        case 'z':
            strcat(phonetic, " Zulu");
            break;
        case '0':
            strcat(phonetic, " Zero");
            break;
        case '1':
            strcat(phonetic, " One");
            break;
        case '2':
            strcat(phonetic, " Two");
            break;
        case '3':
            strcat(phonetic, " Three");
            break;
        case '4':
            strcat(phonetic, " Four");
            break;
        case '5':
            strcat(phonetic, " Five");
            break;
        case '6':
            strcat(phonetic, " Six");
            break;
        case '7':
            strcat(phonetic, " Seven");
            break;
        case '8':
            strcat(phonetic, " Eight");
            break;
        case '9':
            strcat(phonetic, " Nine");
            break;
            //default: printf("您输入的部分内容非字母和数字。\n");
        }
        count++;
    }
    printf("呼号%s的字母解释法是：%s\n", word, phonetic);
    printf("\n");
    return 0;
}