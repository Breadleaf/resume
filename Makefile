WATCHER=$(shell which watcher)

all:
	@echo "build"
	@echo "compile"
	@echo "watch"
	@echo "view"
	@echo "fmt"

build:
	typst compile resume_software.typ bradley_hutchings_swe_resume.pdf --font-path ./fonts
	typst compile resume_hardware.typ bradley_hutchings_emb_resume.pdf --font-path ./fonts

compile: fmt build

watch:
	@#https://github.com/breadleaf/watcher-cli
	$(WATCHER) -files resume_software.typ resume_hardware.typ -command "make compile"

view:
	grip README.md 8000

fmt:
	@#https://github.com/Enter-tainer/typstyle
	typstyle -i resume_software.typ
	typstyle -i resume_hardware.typ
