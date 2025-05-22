build:
	typst compile resume.typ resume.pdf --font-path ./fonts

compile: build fmt

watch:
	@#https://github.com/breadleaf/watcher-cli
	watcher -files resume.typ -command "make compile"

fmt:
	@#https://github.com/Enter-tainer/typstyle?tab=readme-ov-file
	typstyle -i resume.typ
