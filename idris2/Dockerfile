# syntax = docker/dockerfile:1.4

ARG BASE=ubuntu-22.04
ARG IDRIS2_TAG=v0.6.0
FROM ghcr.io/xicesky/idris2-base:${BASE}
ARG IDRIS2_TAG

# Install idris2 from source
WORKDIR /usr/local/src
RUN git clone --depth 1 --branch "${IDRIS2_TAG}" "https://github.com/idris-lang/Idris2.git" idris2
WORKDIR /usr/local/src/idris2

ENV SCHEME=scheme
RUN sed -i -E -e 's/^(PREFIX \?)=.*/\1=\/usr\/local\/idris2\/'"${IDRIS2_TAG}"'/' config.mk
RUN make bootstrap
RUN make install
RUN ln -s /usr/local/idris2/$IDRIS2_TAG/bin/idris2 /etc/alternatives/idris2
RUN ln -s /etc/alternatives/idris2 /usr/local/bin/idris2
RUN make clean
RUN make all
RUN make install && make install-api

# Yes we KEEP THE SOURCES in /usr/local/src for reference

LABEL org.opencontainers.image.title="idris2"
LABEL org.opencontainers.image.description="idris2"
LABEL org.opencontainers.image.url="https://github.com/xicesky/idris2-devcontainer"
LABEL org.opencontainers.image.source="https://github.com/xicesky/idris2-devcontainer"
LABEL org.opencontainers.image.licenses="MIT"
