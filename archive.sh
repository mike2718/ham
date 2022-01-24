#!/usr/bin/bash
cp -f ham_a.pdf ..
cp -f ham_b.pdf ..
cp -f ham_c.pdf ..
rm -f ham_*.zip
zip "ham_a_"`date +"%Y.%m.zip"` ham_a.pdf LICENSE.md README.md
zip "ham_b_"`date +"%Y.%m.zip"` ham_b.pdf LICENSE.md README.md
zip "ham_c_"`date +"%Y.%m.zip"` ham_c.pdf LICENSE.md README.md
unzip -l "ham_a_"`date +"%Y.%m.zip"`
unzip -l "ham_b_"`date +"%Y.%m.zip"`
unzip -l "ham_c_"`date +"%Y.%m.zip"`

