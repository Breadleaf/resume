# My Resume

This is the [source code](./resume.tex) and [rendered version](./resume.pdf) of
my resume.

## How to compile

I have spent far far too long in dependency hell trying to get LaTeX to work on any operating system. I made a dockerfile to make it easier to compile the resume.

```bash
docker build -t xelatex-make .
docker run --rm -v "$(pwd)":/data xelatex-make
```

## Copyright and License

**TL;DR:** Don't redistribute the PDF. You can use and modify the source code so
long as you strip out all references to me. See the [`LICENSE`](./LICENSE) file
for details.
