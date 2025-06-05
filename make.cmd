@echo on
cd /d "%~dp0"
set "PATH=C:\texlive\2024\bin\windows;%PATH%"

for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /format:list') do set datetime=%%I
set datetime=%datetime:~0,4%%datetime:~4,2%%datetime:~6,2%

del /q ..\ham_a*.zip ..\ham_b*.zip ..\ham_c*.zip ..\SHA256SUMS.txt 2>nul
del /q *.obj *.exe 2>nul
del /q *.log *.aux *.toc *.out *.pdf *.blg *.bbl *.fdb_latexmk *.fls *.xdv *.toc 2>nul
del /q *.bak* 2>nul

rem C:\cmdtool32\astyle.exe -A1 -p -s4 -xC80 -c icao.c
rem C:\cmdtool32\astyle.exe -A1 -p -s4 -xC80 -c jisuan.c
rem C:\cmdtool32\astyle.exe -A1 -p -s4 -xC80 -c feibiao.c

xelatex.exe ham_a.tex
xelatex.exe ham_b.tex
rem xelatex.exe ham_c.tex

echo(> zishutongji.md
echo ## 字数统计>> zishutongji.md
echo(>> zishutongji.md
echo ^| 类别 ^| 总计行 ^| 总计单词数 ^| 总计字符数 ^|>> zishutongji.md
echo ^| :---- ^| :---- ^| :---- ^| :---- ^|>> zishutongji.md
echo|set /p="| A类 " >> zishutongji.md
C:\cmdtool32\awk.exe -f wc.awk ham_a.tex qianyan.tex bianzhuzhedehua.tex fulu_a.tex cankaowenxian.tex houji.tex xuke.tex >> zishutongji.md
echo|set /p="| B类 " >> zishutongji.md
C:\cmdtool32\awk.exe -f wc.awk ham_b.tex qianyan.tex bianzhuzhedehua.tex fulu_b.tex cankaowenxian.tex houji.tex xuke.tex >> zishutongji.md
echo|set /p="| C类 " >> zishutongji.md
C:\cmdtool32\awk.exe -f wc.awk ham_c.tex qianyan.tex bianzhuzhedehua.tex fulu_c.tex cankaowenxian.tex houji.tex xuke.tex >> zishutongji.md
C:\cmdtool64\iconv.exe -f WINDOWS-936 -t UTF-8 zishutongji.md > zishutongji.utf8.md
copy /b /y duwo.md+zishutongji.utf8.md README.md
echo(>> README.md

rem C:\cmdtool32\zip.exe ..\ham_a_%datetime%.zip ham_a.pdf LICENSE.md README.md
rem C:\cmdtool32\zip.exe ..\ham_b_%datetime%.zip ham_b.pdf LICENSE.md README.md
rem C:\cmdtool32\zip.exe ..\ham_c_%datetime%.zip ham_c.pdf LICENSE.md README.md

rem C:\cmdtool64\generic_sum.exe SHA256 ..\ham_a*.zip ..\ham_b*.zip ..\ham_c*.zip > ..\SHA256SUMS.txt

pause