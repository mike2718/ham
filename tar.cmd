@echo off
cd /d "%~dp0"
for /f "skip=1" %%x in ('wmic os get localdatetime') do if not defined MyDate set MyDate=%%x
set today=%MyDate:~0,4%%MyDate:~4,2%%MyDate:~6,2%
rem git archive -v --format=tar.zst --prefix=ham_%today%_HEAD/ -19 --output=../ham_%today%_HEAD.tar.zst HEAD
del /q ham_*.7z 2>nul
copy /y ham_a.pdf .. >nul
copy /y ham_b.pdf .. >nul
copy /y ham_c.pdf .. >nul
E:\cmdtool\7z.exe a -t7z ham_a_%today%.7z ham_a.pdf README.md
E:\cmdtool\7z.exe a -t7z ham_b_%today%.7z ham_b.pdf README.md
E:\cmdtool\7z.exe a -t7z ham_c_%today%.7z ham_c.pdf README.md
E:\cmdtool\generic_sum.exe SHA1 ham_*.7z > sha1sums.txt
pause
