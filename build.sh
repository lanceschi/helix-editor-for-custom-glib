#!/usr/bin/env bash

VERSION="23.03"
TAG="helix-${VERSION}"
OUT_FOLDER="./helix-${VERSION}"
NAME="helix-source-container"

docker build \
  --file ./Dockerfile \
  --build-arg "VERSION=${VERSION}" \
  --pull -t "${TAG}" .

# Start the source built container
docker run --detach --name "${NAME}" "${TAG}"

# Ensure output folder
mkdir $OUT_FOLDER

# Copy
docker cp "${NAME}":/helix/target/release/hx $OUT_FOLDER
docker cp "${NAME}":/helix/runtime "${OUT_FOLDER}/runtime/"

# Stop the running container
docker stop "${NAME}" && docker rm "${NAME}"