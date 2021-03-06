#!/bin/bash

set -euxo pipefail

# login to Docker Hub
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

# push latest amd64, arm32v7 and arm64v8 images
docker push "__DOCKER_HUB_USERNAME__/__CONTAINER__:latest-amd64"
docker push "__DOCKER_HUB_USERNAME__/__CONTAINER__:latest-arm32v7"
docker push "__DOCKER_HUB_USERNAME__/__CONTAINER__:latest-arm64v8"

# read version from Docker container
version=$(./read-version.sh amd64)

# push multi-arch image
./push-multi-arch-image.sh "${version}"

