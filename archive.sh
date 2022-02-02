#!/usr/bin/bash
cp -f ham_a.pdf ..
cp -f ham_b.pdf ..
cp -f ham_c.pdf ..
rm -f ham_*.7z
7za a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on "ham_a_"`date +"%Y.%m.7z"` ham_a.pdf LICENSE.md README.md
7za a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on "ham_b_"`date +"%Y.%m.7z"` ham_b.pdf LICENSE.md README.md
7za a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on "ham_c_"`date +"%Y.%m.7z"` ham_c.pdf LICENSE.md README.md
7za l "ham_a_"`date +"%Y.%m.7z"`
7za l "ham_b_"`date +"%Y.%m.7z"`
7za l "ham_c_"`date +"%Y.%m.7z"`
