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
git rev-parse HEAD > git-hash.txt
rem compress zip
del /q ham_*.zip 2>nul
D:\cmdtool\zip.exe ham_a_%datetime%.zip ham_a.pdf LICENSE.md README.md
D:\cmdtool\zip.exe -z ham_a_%datetime%.zip < git-hash.txt
D:\cmdtool\zip.exe ham_b_%datetime%.zip ham_b.pdf LICENSE.md README.md
D:\cmdtool\zip.exe -z ham_b_%datetime%.zip < git-hash.txt
D:\cmdtool\zip.exe ham_c_%datetime%.zip ham_c.pdf LICENSE.md README.md
D:\cmdtool\zip.exe -z ham_c_%datetime%.zip < git-hash.txt
rem compress 7z
del /q ham_*.7z 2>nul
D:\cmdtool\7z.exe a -t7z ham_a_%datetime%.7z ham_a.pdf LICENSE.md README.md
D:\cmdtool\7z.exe a -t7z ham_b_%datetime%.7z ham_b.pdf LICENSE.md README.md
D:\cmdtool\7z.exe a -t7z ham_c_%datetime%.7z ham_c.pdf LICENSE.md README.md
rem generate sha256sums
rem D:\cmdtool\generic_sum.exe SHA256 ham_*.zip > sha256sum.txt
D:\cmdtool\generic_sum.exe SHA256 ham_a_*.zip > sha256sum.txt
D:\cmdtool\generic_sum.exe SHA256 ham_b_*.zip >> sha256sum.txt
COPY /Y ham_a_*.zip ..\
COPY /Y ham_b_*.zip ..\
D:\cmdtool\awk.exe "{ print \"- \" $2 \" µÄ SHA256 ¹þÏ£:\"; print \"`\" $1 \"`\" }" sha256sum.txt > ..\sha256sums.txt
pause
