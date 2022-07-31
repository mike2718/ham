@echo off
cd /d "%~dp0"
for /f "skip=1" %%x in ('wmic os get localdatetime') do if not defined MyDate set MyDate=%%x
set today=%MyDate:~0,4%%MyDate:~4,2%%MyDate:~6,2%
rem git archive -v --format=tar.zst --prefix=ham_%today%_HEAD/ --output=../ham_%today%_HEAD.tar.zst HEAD
del /q ham_*.zip ham_*.tar.gz 2>nul
E:\cmdtool\zip.exe ham_a_%today%.zip ham_a.pdf README.md
E:\cmdtool\zip.exe ham_b_%today%.zip ham_b.pdf README.md
E:\cmdtool\zip.exe ham_c_%today%.zip ham_c.pdf README.md
tar.exe -czvf ham_a_%today%.tar.gz ham_a.pdf README.md
tar.exe -czvf ham_b_%today%.tar.gz ham_b.pdf README.md
tar.exe -czvf ham_c_%today%.tar.gz ham_c.pdf README.md
E:\cmdtool\generic_sum.exe SHA1 ham_*.zip ham_*.tar.gz > sha1sums.txt
pause
