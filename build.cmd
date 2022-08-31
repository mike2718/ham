@echo off
cd /d "%~dp0"
set "PCCDIR=C:\Program Files (x86)\pcc"
rem ��astyle���ۻ�
E:\cmdtool32\astyle.exe -A1 -p -s4 -xC80 -c hhcx_a.c icao_a.c jisuan_a.c
E:\cmdtool64\iconv.exe -f WINDOWS-936 -t UTF-8 hhcx_a.c > hhcx.c
E:\cmdtool64\iconv.exe -f WINDOWS-936 -t UTF-8 icao_a.c > icao.c
E:\cmdtool64\iconv.exe -f WINDOWS-936 -t UTF-8 jisuan_a.c > jisuan.c
rem ����*.c�ļ�
del /q *.obj *.exe 2>nul
"C:\Program Files (x86)\pcc\bin\pcc.exe" -Wall -Wpedantic -Wextra -std=c99 -o hhcx_a.exe hhcx_a.c
"C:\Program Files (x86)\pcc\bin\pcc.exe" -Wall -Wpedantic -Wextra -std=c99 -o icao_a.exe icao_a.c
"C:\Program Files (x86)\pcc\bin\pcc.exe" -Wall -Wpedantic -Wextra -std=c99 -o jisuan_a.exe jisuan_a.c
rem ����pdf�ļ�
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
