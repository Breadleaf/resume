# Taken from https://github.com/sumnerevans/resume

all: resume.pdf

%.pdf: %.tex
	xelatex -shell-escape $<

clean:
	rm -rf *.aux missfont.log *.fdb_latexmk *.log *.out

open:
	xdg-open *.pdf
