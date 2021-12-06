// 《计算逻辑门电路输出信号题型答案的C程序》
// 用法：
// clang -Wall -Wpedantic -Wextra -Werror -std=c99 -o jisuan jisuan.c
// ./jisuan
#include <stdio.h>
#include <stdbool.h>
int main()
{
    char c[8];
    bool a[8] = {false, false, false, false, false, false, false, false};
    printf("\t《计算逻辑门电路输出信号题型答案的C程序》\n\n");
    printf("如果题目的两个输入信号组合分别为00、01、10、11，\n");
    printf("则输入不需要顿号的00011011\n");
    printf("请输入：");
    scanf("%s",c);
    int i;
    for (i = 0; i < 8; i++) {
       if (c[i] == '1') a[i] = true;
    }
    printf("\n输出信号：\n");
    printf("与门（AND）：%x、%x、%x、%x\n", a[0] && a[1], a[2] && a[3], \
                                          a[4] && a[5], a[6] && a[7]);
    printf("或门（OR）：%x、%x、%x、%x\n", a[0] || a[1], a[2] || a[3], \
                                       a[4] || a[5], a[6] || a[7]);
    printf("异或门（XOR）：%x、%x、%x、%x\n", !a[0] != !a[1], !a[2] != !a[3], \
                                          !a[4] != !a[5], !a[6] != !a[7]);
    printf("与非门（NAND）：%x、%x、%x、%x\n", !(a[0] && a[1]), !(a[2] && a[3]), \
                                           !(a[4] && a[5]), !(a[6] && a[7]));
    printf("或非门（NOR）：%x、%x、%x、%x\n", !(a[0] || a[1]), !(a[2] || a[3]), \
                                          !(a[4] || a[5]),  !(a[6] || a[7]));
    printf("异或非门（NXOR）：%x、%x、%x、%x\n", !(!a[0] != !a[1]), \
                                             !(!a[2] != !a[3]), \
                                              !(!a[4] != !a[5]), \
                                               !(!a[6] != !a[7]));
    return 0;
}
