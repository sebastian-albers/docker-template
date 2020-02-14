#!/bin/bash

if [ $# != 2 ] ; then
  echo "Usage: $0 <path to repository> <container name>"
  exit 1
fi

# parameters
repo_path=$(cd "$1" && pwd)
container_name=$2

# variables
DOCKER_HUB_USERNAME=sebastianalbers
GITHUB_USERNAME=sebastian-albers
GITHUB_REPO_NAME="docker-${container_name}"

# copy all files from './files/'
pushd "${BASH_SOURCE%/*}/files" > /dev/null
for file in $(find . -type f) ; do
  dst_file="${repo_path}/${file}"
  cp "${file}" "${dst_file}"
  sed -i'' "s|__CONTAINER__|${container_name}|g" "${dst_file}"
  sed -i'' "s|__DOCKER_HUB_USERNAME__|${DOCKER_HUB_USERNAME}|g" "${dst_file}"
  sed -i'' "s|__GITHUB_USERNAME__|${GITHUB_USERNAME}|g" "${dst_file}"
  sed -i'' "s|__GITHUB_REPO_NAME__|${GITHUB_REPO_NAME}|g" "${dst_file}"
done
popd > /dev/null

# copy all non-existent files from './templates/'
pushd "${BASH_SOURCE%/*}/templates" > /dev/null
for file in $(find . -type f) ; do
  dst_file="${repo_path}/${file}"
  if [ ! -f "${dst_file}" ] ; then
    cp "${file}" "${dst_file}"
    sed -i'' "s|__CONTAINER__|${container_name}|g" "${dst_file}"
    sed -i'' "s|__DOCKER_HUB_USERNAME__|${DOCKER_HUB_USERNAME}|g" "${dst_file}"
    sed -i'' "s|__GITHUB_USERNAME__|${GITHUB_USERNAME}|g" "${dst_file}"
    sed -i'' "s|__GITHUB_REPO_NAME__|${GITHUB_REPO_NAME}|g" "${dst_file}"
  fi
done
popd > /dev/null

echo "Done."
