#!/bin/bash

REGISTRY=${REGISTRY:-"ghcr.io"}
UBUNTU_VERSION=${UBUNTU_VERSION:-"22.04"}
IDRIS2_TAG=${IDRIS2_TAG:-"v0.6.0"}

BASE_IMAGE="ubuntu:${UBUNTU_VERSION}"
BASE="ubuntu-${UBUNTU_VERSION}"
IMAGE_NAME_PREFIX="${REGISTRY}/xicesky"

set -x

# echo "Building ${IMAGE_NAME_PREFIX}/idris2-base:${BASE}" 1>&2
# docker build idris2-base \
#     --build-arg "BASE_IMAGE=${BASE_IMAGE}" \
#     -t "${IMAGE_NAME_PREFIX}/idris2-base:${BASE}" \
#     || exit $?

echo "Building ${IMAGE_NAME_PREFIX}/idris2:${IDRIS2_TAG}-${BASE}" 1>&2
docker build idris2 \
    --build-arg "BASE=${BASE}" \
    --build-arg "IDRIS2_TAG=${IDRIS2_TAG}" \
    -t "${IMAGE_NAME_PREFIX}/idris2:${IDRIS2_TAG}-${BASE}" \
    || exit $?

echo "Building ${IMAGE_NAME_PREFIX}/idris2-devcontainer:${IDRIS2_TAG}-${BASE}" 1>&2
docker build idris2-devcontainer \
    --build-arg "BASE=${BASE}" \
    --build-arg "IDRIS2_TAG=${IDRIS2_TAG}" \
    -t "${IMAGE_NAME_PREFIX}/idris2-devcontainer:${IDRIS2_TAG}-${BASE}" \
    || exit $?
