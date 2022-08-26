#!/bin/bash

REGISTRY=${REGISTRY:-"ghcr.io"}
UBUNTU_VERSION=${UBUNTU_VERSION:-"20.04"}
IDRIS2_TAG=${IDRIS2_TAG:-"v0.5.1"}

BASE_IMAGE="ubuntu:${UBUNTU_VERSION}"
BASE="ubuntu-${UBUNTU_VERSION}"
IMAGE_NAME_PREFIX="${REGISTRY}/xicesky"

set -x

docker build idris2-base \
    --build-arg "BASE_IMAGE=${BASE_IMAGE}" \
    -t "${IMAGE_NAME_PREFIX}/idris2-base:${BASE}" \
    || exit $?

docker build idris2 \
    --build-arg "BASE=${BASE}" \
    --build-arg "IDRIS2_TAG=${IDRIS2_TAG}" \
    -t "${IMAGE_NAME_PREFIX}/idris2:${IDRIS2_TAG}-${BASE}" \
    || exit $?

docker build idris2-devcontainer \
    --build-arg "BASE=${BASE}" \
    --build-arg "IDRIS2_TAG=${IDRIS2_TAG}" \
    -t "${IMAGE_NAME_PREFIX}/idris2-devcontainer:${IDRIS2_TAG}-${BASE}" \
    || exit $?
