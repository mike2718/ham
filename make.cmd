@echo off
cd /d "%~dp0"

for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /format:list') do set datetime=%%I
set datetime=%datetime:~0,4%%datetime:~4,2%%datetime:~6,2%

del /q ..\ham*.zip ..\sha256sums.txt
del /q *.obj *.exe
del /q *.log *.aux *.toc *.out *.pdf *.blg *.bbl *.fdb_latexmk *.fls *.xdv *.toc

C:\cmdtool32\astyle.exe -A1 -p -s4 -xC80 -c hhcx_a.c icao_a.c jisuan_a.c
C:\cmdtool32\iconv.exe -f WINDOWS-936 -t UTF-8 hhcx_a.c > hhcx.c
C:\cmdtool32\iconv.exe -f WINDOWS-936 -t UTF-8 icao_a.c > icao.c
C:\cmdtool32\iconv.exe -f WINDOWS-936 -t UTF-8 jisuan_a.c > jisuan.c

rem C:\mingw32\bin\i686-w64-mingw32-gcc.exe -Wall -Wpedantic -Wextra -std=c99 -o hhcx_a.exe hhcx_a.c
rem C:\mingw32\bin\i686-w64-mingw32-gcc.exe -Wall -Wpedantic -Wextra -std=c99 -o icao_a.exe icao_a.c
rem C:\mingw32\bin\i686-w64-mingw32-gcc.exe -Wall -Wpedantic -Wextra -std=c99 -o jisuan_a.exe jisuan_a.c

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

rem git archive --format=zip --prefix=ham_main/ --output=../ham_main.zip main
C:\cmdtool32\zip.exe ham_a_%datetime%.zip ham_a.pdf LICENSE.md README.md
C:\cmdtool32\zip.exe ham_b_%datetime%.zip ham_b.pdf LICENSE.md README.md
C:\cmdtool32\zip.exe ham_c_%datetime%.zip ham_c.pdf LICENSE.md README.md

C:\cmdtool64\generic_sum.exe SHA256 *.zip > SHA256SUMS.txt
C:\cmdtool32\fciv.exe -sha1 -add .\ -wp -type *.zip | awk "NR > 3 { print }" > SHA1SUMS.txt

pause