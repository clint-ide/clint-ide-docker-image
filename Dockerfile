FROM adoptopenjdk/openjdk11:x86_64-alpine-jdk-11.0.5_10-slim

LABEL maintainer "Mathieu Debove <mathieu@debove.dev>"

RUN apk --no-cache add \
                   curl \
                   git \
                   vim \
                   zsh

RUN apk --no-cache add \
                   'nodejs<12' \
                   npm \
                   yarn

RUN cd /tmp && \
    curl -fsSL https://dl.google.com/go/go1.14.2.linux-amd64.tar.gz -o go.tar.gz && \
    tar -xf go.tar.gz && \
    mv go /usr/local && \
    rm go.tar.gz

ENV GOROOT=/usr/local/go GOPATH=/go GO111MODULE=on
ENV PATH="${PATH}:${GOROOT}/bin:${GOPATH}/bin"
ENV SHELL=/bin/zsh

