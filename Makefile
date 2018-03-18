TEX = xelatex
BIBTEX = bibtex 
OPEN = open

OBJECTS = demo.pdf
target: $(OBJECTS)

demo.pdf: demo.tex *.sty *.cls *.tex Makefile
	$(TEX) -shell-escape $<
	#$(BIBTEX) demo.aux
	#$(TEX) -shell-escape $<
	#$(TEX) -shell-escape $<
	$(OPEN) $@


.PHONY: clean 

clean:
	rm -f *~ *.aux *.log *.out *.toc *.bbl *.blg *.lof *.lot 
	#rm -f *.pdf
	rm -rf _minted-cache
