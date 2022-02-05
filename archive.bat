@echo off
cd /d "%~dp0"
for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /format:list') do set datetime=%%I
set datetime=%datetime:~0,4%.%datetime:~4,2%
del /q ..\ham_*.pdf 2>nul
copy /y ham_a.pdf ..\ham_a.pdf >nul
copy /y ham_b.pdf ..\ham_a.pdf >nul
copy /y ham_c.pdf ..\ham_a.pdf >nul
rem compress 7zip
del /q ham_*.7z 2>nul
D:\cmdtool\7z.exe a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on ham_a_%datetime%.7z ham_a.pdf LICENSE.md README.md
D:\cmdtool\7z.exe a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on ham_b_%datetime%.7z ham_b.pdf LICENSE.md README.md
D:\cmdtool\7z.exe a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on ham_c_%datetime%.7z ham_c.pdf LICENSE.md README.md
rem compress zstd
del /q ham_*.tar.zst 2>nul
C:\msys64\usr\bin\tar.exe --zstd -cvf ham_a_%datetime%.tar.zst ham_a.pdf LICENSE.md README.md
C:\msys64\usr\bin\tar.exe --zstd -cvf ham_b_%datetime%.tar.zst ham_b.pdf LICENSE.md README.md
C:\msys64\usr\bin\tar.exe --zstd -cvf ham_c_%datetime%.tar.zst ham_c.pdf LICENSE.md README.md
pause
