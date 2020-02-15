# Docker Multi-Arch Template

## How it works
1. Travis CI
    1. Build is triggered automatically every day and on push
    1. For each platform …
        1. build Docker image
        1. test image: run image to check application version
    1. On success: trigger Docker Hub build
1. Docker Hub
    1. For each platform …
        1. build Docker image
        1. push Docker image
    1. Create and push latest multi-arch image
    1. Read application version from amd64 image
    1. Create and push multi-arch image with version


## Instructions
* Create GitHub repository, e.g. `docker-foo`
* Create Docker Hub repository, e.g. `foo`
    * Add GitHub repository as source repository
    * Add build rule:
        * Source Type: Branch
        * Source: master
        * Docker Tag: latest-amd64
        * Dockerfile: Dockerfile.cross
        * Autobuild: false
        * Build Caching: false
    * Add build trigger:
        * multi-arch-build
    * Activate GitHub repository in Travis CI
    * Environment variables:
        * DOCKER_HUB_TRIGGER_URL: Docker Hub trigger url
    * Cron Job:
        * Branch: master
        * Interval: Daily
        * Options: Do not run if there has been a build in the last 24h
