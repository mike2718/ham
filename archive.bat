@echo off
cd /d "%~dp0"
@rem 清理上次的打包文件
@rem rm *.zip
rm *.rar
@rem 更新文件时间戳
touch ham_a.pdf
touch ham_b.pdf
touch ham_c.pdf
touch LICENSE.md
touch README.md
@rem 备份到上层目录
cp ham_a.pdf ..
cp ham_b.pdf ..
cp ham_c.pdf ..
git archive --format=tar.xz -o ../ham.tar.xz HEAD
@rem 打包文件
@rem D:\cmdtool\zip.exe -Z bzip2 ham_a.zip ham_a.pdf LICENSE.md README.md
@rem D:\cmdtool\zip.exe -Z bzip2 ham_b.zip ham_b.pdf LICENSE.md README.md
@rem D:\cmdtool\zip.exe -Z bzip2 ham_c.zip ham_c.pdf LICENSE.md README.md
D:\cmdtool\rar.exe a -ma5 -m5 -ag_YYYY.MM ham_a.rar ham_a.pdf LICENSE.md README.md
D:\cmdtool\rar.exe a -ma5 -m5 -ag_YYYY.MM ham_b.rar ham_a.pdf LICENSE.md README.md
D:\cmdtool\rar.exe a -ma5 -m5 -ag_YYYY.MM ham_c.rar ham_a.pdf LICENSE.md README.md
@rem 更新打包文件时间戳
@rem touch ham_a.zip
@rem touch ham_b.zip
@rem touch ham_c.zip
touch ham_a.rar
touch ham_b.rar
touch ham_c.rar
pause