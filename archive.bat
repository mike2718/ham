@echo off
cd /d "%~dp0"
for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /format:list') do set datetime=%%I
set datetime=%datetime:~0,4%_%datetime:~4,2%_%datetime:~6,2%
rem git archive -v --format=tar.zst --prefix=ham_%datetime%_HEAD/ -19 --output=../ham_%datetime%_HEAD.tar.zst HEAD
del /q ..\ham_*.pdf 2>nul
COPY /Y ham_a.pdf ..\ >nul
COPY /Y ham_b.pdf ..\ >nul
COPY /Y ham_c.pdf ..\ >nul
rem get hash
rem git rev-parse HEAD > git-hash.txt
del /q ham_*.tar.zst 2>nul
D:\cmdtool\7z.exe -ttar a ham_a ham_a.pdf LICENSE.md README.md -so | zstd  -T0 --ultra -20 -o ham_a_%datetime%.tar.zst
D:\cmdtool\7z.exe -ttar a ham_b ham_b.pdf LICENSE.md README.md -so | zstd  -T0 --ultra -20 -o ham_b_%datetime%.tar.zst
D:\cmdtool\7z.exe -ttar a ham_c ham_c.pdf LICENSE.md README.md -so | zstd  -T0 --ultra -20 -o ham_c_%datetime%.tar.zst
rem generate sha256sums
D:\cmdtool\generic_sum.exe SHA256 ham_a_*.tar.zst > sha256sum.txt
D:\cmdtool\generic_sum.exe SHA256 ham_b_*.tar.zst >> sha256sum.txt
COPY /Y ham_a_*.tar.zst ..\
COPY /Y ham_b_*.tar.zst ..\
D:\cmdtool\awk.exe "{ print \"- \" $2 \" µÄ SHA256 ¹şÏ£:\"; print \"`\" $1 \"`\" }" sha256sum.txt > ..\sha256sums.txt
pause
