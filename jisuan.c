// 计算逻辑门电路输出信号题型答案的C程序
// 用法：
//   $ pcc -Wall -Wpedantic -Wextra -std=c99 -o jisuan jisuan.c
//   $ ./jisuan
#include <stdio.h>
#include <stdbool.h>
#include <string.h>
int main(void)
{
    char b[40];
    bool a[8] = {false, false, false, false, false, false, false, false};
    printf("\n\t计算逻辑门电路输出信号题型答案的C程序\n\n");
    printf("如果题目的两个输入信号组合分别为10、01、00、11，\n");
    printf("则输入不需要顿号的10010011\n");
    printf("请输入：");
    if (fgets(b, 40, stdin))
        b[strcspn(b, "\n")] = 0;
    for (int i = 0; i < 8; i++)
        if (b[i] - '1') a[i] = true;
    printf("\n输出信号：\n");
    printf("与门（AND）\t%i、%i、%i、%i\n", a[0] && a[1], a[2] && a[3],
           a[4] && a[5], a[6] && a[7]);
    printf("或门（OR）\t%i、%i、%i、%i\n", a[0] || a[1], a[2] || a[3],
           a[4] || a[5], a[6] || a[7]);
    printf("异或门（XOR）\t%i、%i、%i、%i\n", a[0] != a[1], a[2] != a[3],
           a[4] != a[5], a[6] != a[7]);
    printf("与非门（NAND）\t%i、%i、%i、%i\n", !(a[0] && a[1]), !(a[2]
            && a[3]),
           !(a[4] && a[5]), !(a[6] && a[7]));
    printf("或非门（NOR）\t%i、%i、%i、%i\n", !(a[0] || a[1]), !(a[2]
            || a[3]),
           !(a[4] || a[5]),  !(a[6] || a[7]));
    printf("异或非门（NXOR）\t%i、%i、%i、%i\n", !(a[0] != a[1]),
           !(a[2] != a[3]),
           !(a[4] != a[5]),
           !(a[6] != a[7]));
    printf("\n");
    return 0;
}
