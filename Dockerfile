FROM debian:stretch
MAINTAINER Sergey Bukharkin <serboox@gmail.com>

ENV GOROOT "/usr/local/go"
ENV GOPATH "/go"
ENV PATH "$PATH:$GOROOT/bin:$GOPATH/bin"

ENV TAR_FILE "go1.10.2.linux-amd64.tar.gz"
ENV URL_TO_GO_FILE "https://dl.google.com/go/$TAR_FILE"

RUN apt update \
    && apt install -y wget \
    && mkdir -p ~/Downloads \
    && cd ~/Downloads \
    && wget ${URL_TO_GO_FILE} \
    && tar -C /usr/local -xzf ${TAR_FILE} \
    && rm -rf ~/Downloads \
    && apt install -y git \
        make \
        mc \
        vim \
        htop \
        g++

RUN go get github.com/constabulary/gb/... \
    && go get -u github.com/golang/dep/cmd/dep

WORKDIR ${GOPATH}/src
