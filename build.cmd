@echo off
rem 本批处理文件只支持ANSI编码
cd /d "%~dp0"
rem 用astyle美观化
E:\cmdtool32\astyle.exe -A1 -p -s4 -xC80 -c hhcx_a.c icao_a.c jisuan_a.c
C:\gettext0.21-iconv1.16-static-64\bin\iconv.exe -f WINDOWS-936 -t UTF-8 hhcx_a.c > hhcx.c
C:\gettext0.21-iconv1.16-static-64\bin\iconv.exe -f WINDOWS-936 -t UTF-8 icao_a.c > icao.c
C:\gettext0.21-iconv1.16-static-64\bin\iconv.exe -f WINDOWS-936 -t UTF-8 jisuan_a.c > jisuan.c
rem 编译*.c文件
del /q *.obj *.exe 2>nul
set "PCCDIR=C:\pcc-20120801-win32-bin"
rem call "C:\pcc-20120801-win32-bin\pccvars.bat"
"C:\pcc-20120801-win32-bin\bin\pcc.exe" -Wall -Wpedantic -Wextra -std=c99 -o hhcx_a.exe hhcx_a.c
"C:\pcc-20120801-win32-bin\bin\pcc.exe" -Wall -Wpedantic -Wextra -std=c99 -o icao_a.exe icao_a.c
"C:\pcc-20120801-win32-bin\bin\pcc.exe" -Wall -Wpedantic -Wextra -std=c99 -o jisuan_a.exe jisuan_a.c
rem 编译pdf文件
xelatex.exe ham_a.tex
bibtex.exe ham_a.tex
xelatex.exe ham_a.tex
xelatex.exe ham_a.tex
xelatex.exe ham_a.tex

xelatex.exe ham_b.tex
bibtex.exe ham_b.tex
xelatex.exe ham_b.tex
xelatex.exe ham_b.tex
xelatex.exe ham_b.tex

xelatex.exe ham_c.tex
bibtex.exe ham_c.tex
xelatex.exe ham_c.tex
xelatex.exe ham_c.tex
xelatex.exe ham_c.tex
pause
