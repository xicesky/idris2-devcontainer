# syntax = docker/dockerfile:1.4

ARG BASE=ubuntu-22.04
ARG PACKAGE_COLLECTION=nightly-230701
FROM ghcr.io/xicesky/idris2-base:${BASE}

# FIXME: I'd prefer if the username wasn't already tied to vs code here
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Add group & user, switch to user
RUN addgroup --gid "${USER_GID}" "${USERNAME}"
RUN adduser --home "/home/${USERNAME}" --shell /bin/bash --uid "${USER_UID}" --gid "${USER_GID}" "${USERNAME}"
WORKDIR "/home/${USERNAME}"
USER "${USERNAME}"

# Install pack (which also bootstraps idris2)
ENV SCHEME=scheme
ENV PACKAGE_COLLECTION="${PACKAGE_COLLECTION}"
COPY install.bash "/home/${USERNAME}/install.bash"
RUN /bin/bash "/home/${USERNAME}/install.bash"
COPY .profile "/home/${USERNAME}/.profile"
ENV PATH="/home/${USERNAME}/.pack/bin:${PATH}"

LABEL org.opencontainers.image.title="idris2"
LABEL org.opencontainers.image.description="idris2"
LABEL org.opencontainers.image.url="https://github.com/xicesky/idris2-devcontainer"
LABEL org.opencontainers.image.source="https://github.com/xicesky/idris2-devcontainer"
LABEL org.opencontainers.image.licenses="MIT"
