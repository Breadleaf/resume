WATCHER=$(shell which watcher)

all:
	@echo "build"
	@echo "compile"
	@echo "watch"
	@echo "fmt"

build:
	typst compile resume.typ resume.pdf --font-path ./fonts

compile: build fmt

watch:
	@#https://github.com/breadleaf/watcher-cli
	$(WATCHER) -files resume.typ -command "make compile"

fmt:
	@#https://github.com/Enter-tainer/typstyle
	typstyle -i resume.typ
