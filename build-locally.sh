#!/bin/bash

REGISTRY=${REGISTRY:-"ghcr.io"}
UBUNTU_VERSION=${UBUNTU_VERSION:-"22.04"}
PACKAGE_COLLECTION=${PACKAGE_COLLECTION:-"nightly-230701"}

BASE_IMAGE="ubuntu:${UBUNTU_VERSION}"
BASE="ubuntu-${UBUNTU_VERSION}"
IMAGE_NAME_PREFIX="${REGISTRY}/xicesky"

set -x

echo "Building ${IMAGE_NAME_PREFIX}/idris2-base:${BASE}" 1>&2
docker build idris2-base \
    --build-arg "BASE_IMAGE=${BASE_IMAGE}" \
    -t "${IMAGE_NAME_PREFIX}/idris2-base:${BASE}" \
    || exit $?

echo "Building ${IMAGE_NAME_PREFIX}/idris2:${PACKAGE_COLLECTION}-${BASE}" 1>&2
docker build idris2 \
    --build-arg "BASE=${BASE}" \
    --build-arg "PACKAGE_COLLECTION=${PACKAGE_COLLECTION}" \
    -t "${IMAGE_NAME_PREFIX}/idris2:${PACKAGE_COLLECTION}-${BASE}" \
    || exit $?

echo "Building ${IMAGE_NAME_PREFIX}/idris2-devcontainer:${PACKAGE_COLLECTION}-${BASE}" 1>&2
docker build idris2-devcontainer \
    --build-arg "BASE=${BASE}" \
    --build-arg "PACKAGE_COLLECTION=${PACKAGE_COLLECTION}" \
    -t "${IMAGE_NAME_PREFIX}/idris2-devcontainer:${PACKAGE_COLLECTION}-${BASE}" \
    || exit $?
