FROM adoptopenjdk/openjdk8:slim

LABEL maintainer "Mathieu Debove <mathieu@debove.dev>"

RUN apt-get update -qq && apt-get install -qq --no-install-recommends \
            curl \
            git \
            vim \
            zsh

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -qq --no-install-recommends \
            nodejs \
            yarn \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN cd /tmp && \
    curl -fsSL https://dl.google.com/go/go1.12.4.linux-amd64.tar.gz -o go.tar.gz && \
    tar -xf go.tar.gz && \
    mv go /usr/local && \
    rm go.tar.gz

ENV GOROOT=/usr/local/go GOPATH=/go GO111MODULE=on
ENV PATH="${PATH}:${GOROOT}/bin:${GOPATH}/bin"
ENV SHELL=/bin/zsh

