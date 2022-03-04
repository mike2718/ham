@echo off
cd /d "%~dp0"
for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /format:list') do set datetime=%%I
set datetime=%datetime:~0,4%.%datetime:~4,2%
del /q ..\ham_*.pdf 2>nul
copy /y ham_a.pdf ..\ham_a.pdf >nul
copy /y ham_b.pdf ..\ham_a.pdf >nul
copy /y ham_c.pdf ..\ham_a.pdf >nul
rem get hash
git rev-parse HEAD > git-hash.txt
rem compress zip
del /q ham_*.zip 2>nul
D:\cmdtool\zip.exe -Z bzip2 ham_a_%datetime%.zip ham_a.pdf LICENSE.md README.md
D:\cmdtool\zip.exe -z ham_a_%datetime%.zip < git-hash.txt
D:\cmdtool\zip.exe -Z bzip2 ham_b_%datetime%.zip ham_b.pdf LICENSE.md README.md
D:\cmdtool\zip.exe -z ham_b_%datetime%.zip < git-hash.txt
D:\cmdtool\zip.exe -Z bzip2 ham_c_%datetime%.zip ham_c.pdf LICENSE.md README.md
D:\cmdtool\zip.exe -z ham_c_%datetime%.zip < git-hash.txt
rem compress 7zip
del /q ham_*.7z 2>nul
D:\cmdtool\7z.exe a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on ham_a_%datetime%.7z ham_a.pdf LICENSE.md README.md
D:\cmdtool\7z.exe a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on ham_b_%datetime%.7z ham_b.pdf LICENSE.md README.md
D:\cmdtool\7z.exe a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on ham_c_%datetime%.7z ham_c.pdf LICENSE.md README.md
rem compress cab
del /q ham_*.cab 2>nul
D:\cmdtool\cabarc.exe n ham_a_%datetime%.cab ham_a.pdf LICENSE.md README.md
D:\cmdtool\cabarc.exe n ham_b_%datetime%.cab ham_b.pdf LICENSE.md README.md
D:\cmdtool\cabarc.exe n ham_c_%datetime%.cab ham_c.pdf LICENSE.md README.md
rem compress rar
del /q ham_*.rar 2>nul
"C:\Program Files\WinRAR\Rar.exe" a -ma5 -m5 ham_a_%datetime%.rar ham_a.pdf LICENSE.md README.md
"C:\Program Files\WinRAR\Rar.exe" c -zgit-hash.txt ham_a_%datetime%.rar
"C:\Program Files\WinRAR\Rar.exe" a -ma5 -m5 ham_b_%datetime%.rar ham_b.pdf LICENSE.md README.md
"C:\Program Files\WinRAR\Rar.exe" c -zgit-hash.txt ham_b_%datetime%.rar
"C:\Program Files\WinRAR\Rar.exe" a -ma5 -m5 ham_c_%datetime%.rar ham_c.pdf LICENSE.md README.md
"C:\Program Files\WinRAR\Rar.exe" c -zgit-hash.txt ham_c_%datetime%.rar
rem generate sha256sums
D:\cmdtool\generic_sum.exe SHA256 ham_*.zip > sha256sum.txt
D:\cmdtool\generic_sum.exe SHA256 ham_*.7z >> sha256sum.txt
D:\cmdtool\generic_sum.exe SHA256 ham_*.cab >> sha256sum.txt
D:\cmdtool\generic_sum.exe SHA256 ham_*.rar >> sha256sum.txt
pause
