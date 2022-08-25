# syntax = docker/dockerfile:1.4

ARG VARIANT="focal"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

ARG IDRIS2_TAG=v0.5.1

# Prerequisites
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install --yes --no-install-recommends git build-essential chezscheme libgmp3-dev openjdk-11-jdk maven

# Install idris2 from source
WORKDIR /opt/idris2
RUN git clone --depth 1 --branch "${IDRIS2_TAG}" "https://github.com/idris-lang/Idris2.git" idris2-src
WORKDIR /opt/idris2/idris2-src

ENV SCHEME=scheme
RUN sed -i -E -e 's/^(PREFIX \?)=.*/\1=\/usr\/local/' config.mk
RUN make bootstrap
RUN make install
RUN make clean
RUN make all
RUN make install && make install-api
