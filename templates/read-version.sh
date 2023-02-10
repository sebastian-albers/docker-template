#!/bin/bash

set -eou pipefail

docker run --rm __DOCKER_HUB_USERNAME__/__CONTAINER__:latest-$1 /path/to/executable --version
