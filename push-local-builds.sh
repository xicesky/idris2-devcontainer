#!/bin/bash

REGISTRY=${REGISTRY:-"ghcr.io"}
UBUNTU_VERSION=${UBUNTU_VERSION:-"22.04"}
IDRIS2_TAG=${IDRIS2_TAG:-"v0.6.0"}

BASE="ubuntu-${UBUNTU_VERSION}"
IMAGE_NAME_PREFIX="${REGISTRY}/xicesky"

docker push "${IMAGE_NAME_PREFIX}/idris2-base:${BASE}"
docker push "${IMAGE_NAME_PREFIX}/idris2:${IDRIS2_TAG}-${BASE}"
docker push "${IMAGE_NAME_PREFIX}/idris2-devcontainer:${IDRIS2_TAG}-${BASE}"
