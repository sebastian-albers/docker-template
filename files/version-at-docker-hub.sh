#!/bin/bash

set -eou pipefail

version=$1
url="https://hub.docker.com/v2/repositories/__DOCKER_HUB_USERNAME__/__CONTAINER__/tags/${version}"
curl -s "$url" | jq '.name' | grep "${version}"

