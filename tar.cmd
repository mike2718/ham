@echo off
rem 本批处理文件只支持ANSI编码
setlocal enableextensions
cd /d "%~dp0"
for /f "skip=1" %%x in ('wmic os get localdatetime') do if not defined MyDate set MyDate=%%x
set today=%MyDate:~0,4%%MyDate:~4,2%%MyDate:~6,2%
rem git archive -v --format=tar.zst --prefix=ham_%today%_HEAD/ --output=../ham_%today%_HEAD.tar.zst HEAD
del /q ham_*.zip 2>nul
E:\cmdtool32\zip.exe ham_a_%today%.zip ham_a.pdf README.md
E:\cmdtool32\zip.exe ham_b_%today%.zip ham_b.pdf README.md
E:\cmdtool32\zip.exe ham_c_%today%.zip ham_c.pdf README.md
E:\cmdtool32\generic_sum.exe SHA1 ham_a*.zip ham_b*.zip > sha1sums.txt
copy /y ham_*.pdf ..\
pause
