TEX = xelatex
BIBTEX = bibtex 
OPEN = open

OBJECTS = example.pdf
target: $(OBJECTS)

example.pdf: example.tex *.sty *.cls *.tex Makefile
	$(TEX) -shell-escape $<
	#$(BIBTEX) example.aux
	#$(TEX) -shell-escape $<
	$(TEX) -shell-escape $<
	$(OPEN) $@

demo.pdf: demo.tex *.sty *.cls *.tex Makefile
	$(TEX) -shell-escape $<
	$(BIBTEX) demo.aux
	$(TEX) -shell-escape $<
	$(TEX) -shell-escape $<
	$(OPEN) $@

.PHONY: clean 

clean:
	rm -f *~ *.aux *.log *.out *.toc *.bbl *.blg *.lof *.lot 
	#rm -f *.pdf
	rm -rf _minted-cache
