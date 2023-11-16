@echo off
cd /d "%~dp0"

for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /format:list') do set datetime=%%I
set datetime=%datetime:~0,4%%datetime:~4,2%%datetime:~6,2%

del /q ..\ham_*.zip ..\SHA256SUMS.txt 2>nul
del /q *.obj *.exe 2>nul
del /q *.log *.aux *.toc *.out *.pdf *.blg *.bbl *.fdb_latexmk *.fls *.xdv *.toc 2>nul
del /q *.bak0 *.bak1 2>nul
rd /s /q out 2>nul

C:\cmdtool32\astyle.exe -A1 -p -s4 -xC80 -c hhcx_a.c icao_a.c jisuan_a.c
C:\cmdtool32\iconv.exe -f WINDOWS-936 -t UTF-8 hhcx_a.c > hhcx.c
C:\cmdtool32\iconv.exe -f WINDOWS-936 -t UTF-8 icao_a.c > icao.c
C:\cmdtool32\iconv.exe -f WINDOWS-936 -t UTF-8 jisuan_a.c > jisuan.c

rem C:\mingw64\bin\x86_64-w64-mingw32-gcc.exe -Wall -Wpedantic -Wextra -std=c99 -o hhcx_a.exe hhcx_a.c
rem C:\mingw64\bin\x86_64-w64-mingw32-gcc.exe -Wall -Wpedantic -Wextra -std=c99 -o icao_a.exe icao_a.c
rem C:\mingw64\bin\x86_64-w64-mingw32-gcc.exe -Wall -Wpedantic -Wextra -std=c99 -o jisuan_a.exe jisuan_a.c

C:\cmdtool64\latexindent.exe -w -m -s -l latexindent.yaml ham_a.tex
C:\cmdtool64\latexindent.exe -w -m -s -l latexindent.yaml ham_b.tex
C:\cmdtool64\latexindent.exe -w -m -s -l latexindent.yaml ham_c.tex
C:\cmdtool64\latexindent.exe -w -m -s -l latexindent.yaml fulu_a.tex
C:\cmdtool64\latexindent.exe -w -m -s -l latexindent.yaml fulu_b.tex
C:\cmdtool64\latexindent.exe -w -m -s -l latexindent.yaml fulu_c.tex
C:\cmdtool64\latexindent.exe -w -m -s -l latexindent.yaml bianzhuzhedehua.tex
C:\cmdtool64\latexindent.exe -w -m -s -l latexindent.yaml cankaowenxian.tex
C:\cmdtool64\latexindent.exe -w -m -s -l latexindent.yaml houji.tex
C:\cmdtool64\latexindent.exe -w -m -s -l latexindent.yaml qianyan.tex
C:\cmdtool64\latexindent.exe -w -m -s -l latexindent.yaml xuke.tex

xelatex.exe ham_a.tex
bibtex.exe ham_a
xelatex.exe ham_a.tex
xelatex.exe ham_a.tex
xelatex.exe ham_a.tex
xelatex.exe ham_b.tex
bibtex.exe ham_b
xelatex.exe ham_b.tex
xelatex.exe ham_b.tex
xelatex.exe ham_b.tex
xelatex.exe ham_c.tex
bibtex.exe ham_c
xelatex.exe ham_c.tex
xelatex.exe ham_c.tex
xelatex.exe ham_c.tex

git archive --format=zip --prefix=ham_%datetime%/ --output=../ham_%datetime%.zip main

C:\cmdtool32\zip.exe ..\ham_a_%datetime%.zip ham_a.pdf LICENSE.md README.md
C:\cmdtool32\zip.exe ..\ham_b_%datetime%.zip ham_b.pdf LICENSE.md README.md
C:\cmdtool32\zip.exe ..\ham_c_%datetime%.zip ham_c.pdf LICENSE.md README.md

C:\cmdtool64\generic_sum.exe SHA256 ..\ham_*.zip > ..\SHA256SUMS.txt

pause
