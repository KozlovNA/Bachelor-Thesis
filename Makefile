\
PDFS = main.pdf

.PHONY: all clean

all: main.pdf

INCLUDES = include/*.tex

PARTS = parts/*.tex

MAIN = main.tex

%.pdf: $(MAIN) $(PARTS) $(INCLUDES)
	latexrun/latexrun $*

clean:
# this is a bad practice, of course, but it's enough for our purposes
	cp main.pdf tmp_makefile_main.pdf
	latexrun/latexrun --clean-all
	mv tmp_makefile_main.pdf main.pdf

# PDFS = main.pdf
# MAIN = main.tex
# INCLUDES = include/*.tex
# PARTS = parts/*.tex

# .PHONY: all clean

# all: $(PDFS)

# main.pdf: $(MAIN) $(INCLUDES) $(PARTS)
# 	TEXINPUTS=.:./images: pdflatex \
# 	-shell-escape \
# 	-file-line-error \
# 	-interaction=nonstopmode \
# 	-synctex=1 \
# 	-main.tex
# 	bibtex main || true  # Skip if no .bib files
# 	TEXINPUTS=.:./images: pdflatex \
# 	-shell-escape \
# 	-file-line-error \
# 	-interaction=nonstopmode \
# 	-synctex=1 \
# 	-main.tex

# clean:
# 	rm -f *.aux *.log *.out *.toc *.bbl *.blg *.nav *.snm *.vrb *.fls *.synctex.gz *.fdb_latexmk

# clean-all: clean
# 	rm -f main.pdf