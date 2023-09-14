# Taken from https://github.com/sumnerevans/resume

all: resume.pdf

%.pdf: %.tex
	xelatex -shell-escape $<

clean:
	rm -rf *.aux missfont.log *.fdb_latexmk *.log *.out

open:
	xdg-open *.pdf

.PHONY: push

push:
	@make
	@make clean
	@echo "Running git add *"
	git add *
	@read -p "Enter a commit message: " commit_message; \
	echo "Commit message: $$commit_message"; \
	read -p "Is this commit message okay? (y/n): " confirm; \
	if [ "$$confirm" = "y" ]; then \
 		git commit -m "$$commit_message"; \
		git push; \
	else \
		echo "Commit canceled."; \
	fi
