# syntax = docker/dockerfile:1.4

ARG BASE=ubuntu-22.04
ARG PACKAGE_COLLECTION=nightly-230701
FROM ghcr.io/xicesky/idris2:${PACKAGE_COLLECTION}-${BASE}

ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID
ARG UPGRADE_PACKAGES=true
ARG INSTALL_OH_MYS=false
ARG ADD_NON_FREE_PACKAGES=true

# Prepare as devcontainer
USER root
WORKDIR /home/"${USERNAME}"

# Unminimize
RUN yes | unminimize

# Install idris2-lsp
USER "${USERNAME}"
# - disable safety-prompt for this package
RUN sed -i -E -e '/^\[install\]$/,/^\[/ s/^(safety-prompt\s*=\s*)(\w+)(.*)$/\1false\3/' "/home/"${USERNAME}"/.pack/user/pack.toml"
# - install via pack
RUN /home/"${USERNAME}"/.pack/bin/pack install-app lsp
# - re-enable safety-prompt
RUN sed -i -E -e '/^\[install\]$/,/^\[/ s/^(safety-prompt\s*=\s*)(\w+)(.*)$/\1true\3/' "/home/"${USERNAME}"/.pack/user/pack.toml"
USER root

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
