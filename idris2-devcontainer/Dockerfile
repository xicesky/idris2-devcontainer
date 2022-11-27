# syntax = docker/dockerfile:1.4

ARG BASE=ubuntu-22.04
ARG IDRIS2_TAG=v0.6.0
FROM ghcr.io/xicesky/idris2:${IDRIS2_TAG}-${BASE}

# Prepare as devcontainer
WORKDIR /home/vscode

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ARG UPGRADE_PACKAGES=true
ARG INSTALL_OH_MYS=false
ARG ADD_NON_FREE_PACKAGES=true

COPY library-scripts/*.sh library-scripts/*.env /tmp/library-scripts/
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && /bin/bash /tmp/library-scripts/common-debian.sh "${INSTALL_ZSH}" "${USERNAME}" "${USER_UID}" "${USER_GID}" "${UPGRADE_PACKAGES}" "${INSTALL_OH_MYS}" "${ADD_NON_FREE_PACKAGES}" \
    #
    # ****************************************************************************
    # * TODO: Add any additional OS packages you want included in the definition *
    # * here. We want to do this before cleanup to keep the "layer" small.       *
    # ****************************************************************************
    && apt-get -y install --no-install-recommends asciidoctor \
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* /tmp/library-scripts

# Fixups for common-debian.sh
RUN chown -R "${USERNAME}:" "/home/${USERNAME}"

LABEL org.opencontainers.image.title="idris2-devcontainer"
LABEL org.opencontainers.image.description="vscode devcontainer for idris2"
LABEL org.opencontainers.image.url="https://github.com/xicesky/idris2-devcontainer"
LABEL org.opencontainers.image.source="https://github.com/xicesky/idris2-devcontainer"
LABEL org.opencontainers.image.licenses="MIT"
