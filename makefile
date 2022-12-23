
all:	pdf tar

pdf:	clean compile
	xelatex.exe ham_a.tex
	bibtex.exe ham_a
	xelatex.exe ham_a.tex
	xelatex.exe ham_a.tex
	xelatex.exe ham_a.tex
	xelatex.exe ham_b.tex
	bibtex.exe ham_b
	xelatex.exe ham_b.tex
	xelatex.exe ham_b.tex
	xelatex.exe ham_b.tex
#	xelatex.exe ham_c.tex
#	bibtex.exe ham_c
#	xelatex.exe ham_c.tex
#	xelatex.exe ham_c.tex
#	xelatex.exe ham_c.tex

compile:	astyle
	C:\mingw32\bin\i686-w64-mingw32-gcc.exe -Wall -Wpedantic -Wextra -std=c99 -o hhcx_a.exe hhcx_a.c
	C:\mingw32\bin\i686-w64-mingw32-gcc.exe -Wall -Wpedantic -Wextra -std=c99 -o icao_a.exe icao_a.c
	C:\mingw32\bin\i686-w64-mingw32-gcc.exe -Wall -Wpedantic -Wextra -std=c99 -o jisuan_a.exe jisuan_a.c

astyle:
	E:\cmdtool32\astyle.exe -A1 -p -s4 -xC80 -c hhcx_a.c icao_a.c jisuan_a.c
	E:\cmdtool32\iconv.exe -f WINDOWS-936 -t UTF-8 hhcx_a.c > hhcx.c
	E:\cmdtool32\iconv.exe -f WINDOWS-936 -t UTF-8 icao_a.c > icao.c
	E:\cmdtool32\iconv.exe -f WINDOWS-936 -t UTF-8 jisuan_a.c > jisuan.c

tar:
	git archive --format=zip --prefix=ham/ --output=../ham.zip main
	7z a -t7z -m0=lzma2 -mx=9 -md=64m ..\ham_a.7z ham_a.pdf LICENSE.md README.md
	7z a -t7z -m0=lzma2 -mx=9 -md=64m ..\ham_b.7z ham_b.pdf LICENSE.md README.md
#	7z a -t7z -m0=lzma2 -mx=9 -md=64m ..\ham_c.7z ham_c.pdf LICENSE.md README.md
	generic_sum SHA256 ..\ham_*.7z > ..\sha256sums.txt

clean:
	del /q ..\ham.zip
	del /q *.obj *.exe
	del /q *.log *.aux *.toc *.out *.pdf *.blg *.bbl *.fdb_latexmk *.fls *.xdv *.toc
