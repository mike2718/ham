@echo off
cd /d "%~dp0"
for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /format:list') do set datetime=%%I
set datetime=%datetime:~0,4%.%datetime:~4,2%
@rem 备份到上层目录
xcopy ham_a.pdf .. /y /c
xcopy ham_b.pdf .. /y /c
xcopy ham_c.pdf .. /y /c
del /q ..\ham.tar.zst
git archive --format=tar.zst -o ../ham.tar.zst HEAD
@rem 打包
touch ham_a.pdf ham_b.pdf ham_c.pdf LICENSE.md README.md
del /q ham_a_*.zip ham_b_*.zip ham_c_*.zip
D:\cmdtool\zip.exe -Z bzip2 ham_a_%datetime%.zip ham_a.pdf LICENSE.md README.md
D:\cmdtool\zip.exe -Z bzip2 ham_b_%datetime%.zip ham_b.pdf LICENSE.md README.md
D:\cmdtool\zip.exe -Z bzip2 ham_c_%datetime%.zip ham_c.pdf LICENSE.md README.md
touch ham_a_%datetime%.zip ham_b_%datetime%.zip ham_c_%datetime%.zip
pause
