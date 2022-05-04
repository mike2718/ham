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
- Noto Serif SC, Noto Sans SC, Noto Sans Mono CJK SC, Noto Sans, Noto Serif字体
- Source Code Pro字体

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
    ham_a.tex
```

自行编译本书的话，`.tex`文件必须保存为无BOM的UTF-8文本文件。

## 许可

Copyright (c) 2021 BG7XTQ

[PDF文件中所使用字体的许可](https://github.com/mike2718/ham/blob/main/LICENSE.md)
