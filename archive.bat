@echo off
cd /d "%~dp0"
for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /format:list') do set datetime=%%I
set datetime=%datetime:~0,4%.%datetime:~4,2%
xcopy ham_a.pdf .. /y /c
xcopy ham_b.pdf .. /y /c
xcopy ham_c.pdf .. /y /c
del /q ..\ham.tar.zst
git archive --format=tar.zst --prefix=ham/ --output=../ham.tar.zst HEAD
del /q ham_*.7z
D:\cmdtool\7za.exe a -t7z -mx9 ham_a_%datetime%.7z ham_a.pdf LICENSE.md README.md
D:\cmdtool\7za.exe a -t7z -mx9 ham_b_%datetime%.7z ham_b.pdf LICENSE.md README.md
D:\cmdtool\7za.exe a -t7z -mx9 ham_c_%datetime%.7z ham_c.pdf LICENSE.md README.md
D:\cmdtool\7za.exe l ham_a_%datetime%.7z
D:\cmdtool\7za.exe l ham_b_%datetime%.7z
D:\cmdtool\7za.exe l ham_c_%datetime%.7z
pause
