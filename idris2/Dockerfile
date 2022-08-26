# syntax = docker/dockerfile:1.4

ARG BASE=ubuntu-20.04
ARG IDRIS2_TAG=v0.5.1
FROM ghcr.io/xicesky/idris2-base:${BASE}
ARG IDRIS2_TAG

# Install idris2 from source
WORKDIR /usr/local/src
RUN git clone --depth 1 --branch "${IDRIS2_TAG}" "https://github.com/idris-lang/Idris2.git" idris2
WORKDIR /usr/local/src/idris2

ENV SCHEME=scheme
RUN sed -i -E -e 's/^(PREFIX \?)=.*/\1=\/usr\/local/' config.mk
RUN make bootstrap
RUN make install
RUN make clean
RUN make all
RUN make install && make install-api

# Yes we KEEP THE SOURCES in /usr/local/src for reference
