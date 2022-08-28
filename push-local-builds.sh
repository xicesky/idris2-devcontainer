#!/bin/bash

REGISTRY=${REGISTRY:-"ghcr.io"}
UBUNTU_VERSION=${UBUNTU_VERSION:-"20.04"}
IDRIS2_TAG=${IDRIS2_TAG:-"v0.5.1"}

BASE="ubuntu-${UBUNTU_VERSION}"
IMAGE_NAME_PREFIX="${REGISTRY}/xicesky"

docker push "${IMAGE_NAME_PREFIX}/idris2-base:${BASE}"
docker push "${IMAGE_NAME_PREFIX}/idris2:${IDRIS2_TAG}-${BASE}"
docker push "${IMAGE_NAME_PREFIX}/idris2-devcontainer:${IDRIS2_TAG}-${BASE}"
