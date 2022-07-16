#!/usr/bin/bash
rm -f ham_*.7z
7z a -t7z "ham_a_"`date +"%Y.%m.7z"` ham_a.pdf README.md
7z a -t7z "ham_b_"`date +"%Y.%m.7z"` ham_b.pdf README.md
7z a -t7z "ham_c_"`date +"%Y.%m.7z"` ham_c.pdf README.md
7z l "ham_a_"`date +"%Y.%m.7z"`
7z l "ham_b_"`date +"%Y.%m.7z"`
7z l "ham_c_"`date +"%Y.%m.7z"`

