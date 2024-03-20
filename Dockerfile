FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y --no-install-recommends \
	texlive-xetex \
	make

RUN apt clean

RUN rm -rf /var/lib/apt/lists/*

WORKDIR /data

CMD ["make"]
