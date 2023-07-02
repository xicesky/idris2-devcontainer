#!/bin/bash

REGISTRY=${REGISTRY:-"ghcr.io"}
UBUNTU_VERSION=${UBUNTU_VERSION:-"22.04"}
PACKAGE_COLLECTION=${PACKAGE_COLLECTION:-"nightly-230701"}

BASE="ubuntu-${UBUNTU_VERSION}"
IMAGE_NAME_PREFIX="${REGISTRY}/xicesky"

docker push "${IMAGE_NAME_PREFIX}/idris2-base:${BASE}"
docker push "${IMAGE_NAME_PREFIX}/idris2:${PACKAGE_COLLECTION}-${BASE}"
docker push "${IMAGE_NAME_PREFIX}/idris2-devcontainer:${PACKAGE_COLLECTION}-${BASE}"
