FILENAME=data-structures-implementations
LATEX_COMPILER=xelatex -shell-escape

all: $(FILENAME).pdf

%.pdf: %.tex algo.cls
	$(LATEX_COMPILER) $<

clean:
	rm -f *.log *.aux *.log *.out *.bbl *.blg *.nav *.snm *.toc

.PHONY: all clean

