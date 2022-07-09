@echo off
cd /d "%~dp0"
for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /format:list') do set datetime=%%I
rem set datetime=%datetime:~0,4%_%datetime:~4,2%_%datetime:~6,2%
set datetime=%datetime:~0,4%.%datetime:~4,2%
rem git archive -v --format=tar.zst --prefix=ham_%datetime%_HEAD/ -19 --output=../ham_%datetime%_HEAD.tar.zst HEAD
del /q ..\ham_*.7z ham_*.7z 2>nul
copy /y ham_a.pdf .. >nul
copy /y ham_b.pdf .. >nul
copy /y ham_c.pdf .. >nul
E:\cmdtool\7z.exe a -t7z ham_a_%datetime%.7z ham_a.pdf LICENSE.md README.md
E:\cmdtool\7z.exe a -t7z ham_b_%datetime%.7z ham_b.pdf LICENSE.md README.md
E:\cmdtool\7z.exe a -t7z ham_c_%datetime%.7z ham_c.pdf LICENSE.md README.md
rem generate sha256sums
E:\cmdtool\generic_sum.exe SHA256 ham_*.7z > sha256sums.txt
pause
