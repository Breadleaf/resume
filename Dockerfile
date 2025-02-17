FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y --no-install-recommends \
    texlive-xetex \
    texlive-fonts-extra \
    texlive-latex-extra \
    inkscape \
    make

RUN apt clean

RUN rm -rf /var/lib/apt/lists/*

WORKDIR /data

COPY . /data/

CMD ["make"]
