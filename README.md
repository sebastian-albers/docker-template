# Docker Multi-Arch Template

## Instructions
* Create GitHub repository, e.g. `docker-foo`
* Create Docker Hub repositoy, e.g. `foo`
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
