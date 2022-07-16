# 《业余无线电操作技能考核攻略本（类别：A、B）》

## 目录

* [简介](#简介)
* [使用软件](#使用软件)
* [编译](#编译)
* [许可](#许可)

## 简介

业余无线电操作技能考核的应试辅导书。

## 下载

你可以

- [下载《业余无线电操作技能考核攻略本（类别：A）》](https://github.com/mike2718/ham/releases)
- [下载《业余无线电操作技能考核攻略本（类别：B）》](https://github.com/mike2718/ham/releases)

## 依赖

- XeLaTeX
- ctex
- Noto Sans, Noto Serif, Noto Sans Mono, Noto Sans CJK SC, Noto Serif CJK SC, Noto Sans Mono CJK SC字体

## 编译

编译选项为

```
xelatex \
    -no-pdf \
    -synctex=1 \
    -interaction=nonstopmode \
    -file-line-error \
    -recorder \
    -synctex=1 \
    -shell-escape \
    ham_?.tex
```

自行编译本书的话，`.tex`文件必须保存为无BOM的UTF-8文本文件。

## 许可

&copy; 2021 BG7XTQ Mike

[PDF文件中所使用字体的许可](https://github.com/mike2718/ham/blob/main/LICENSE.md)
