@echo off
rem ���������ļ�ֻ֧��ANSI����
cd /d "%~dp0"
del /q *.log *.aux *.toc *.out 2>nul
del /q ham_*.zip ham_*.rar ham_*.7z ham_*.tar ham_*.tar.xz ham_*.tar.zst 2>nul
rd /s /q out 2>nul
