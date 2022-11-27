# syntax = docker/dockerfile:1.4
ARG BASE_IMAGE=ubuntu:22.04
FROM ${BASE_IMAGE}

# Build requirements & dev-tools
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install --yes --no-install-recommends git build-essential chezscheme libgmp3-dev openjdk-11-jdk maven

# Cleanup
RUN apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/library-scripts

LABEL org.opencontainers.image.title="idris2-base"
LABEL org.opencontainers.image.description="Base for building idris2"
LABEL org.opencontainers.image.url="https://github.com/xicesky/idris2-devcontainer"
LABEL org.opencontainers.image.source="https://github.com/xicesky/idris2-devcontainer"
LABEL org.opencontainers.image.licenses="MIT"
