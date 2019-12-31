# Busbar Nginx Frontend Base Image

Nginx reverse proxy used on all 'web' type Busbar application.

## build_and_push.sh

The build_and_push.sh script can build and push some or all images:

```
build_and_push.sh - Build and push application base images

Usage:
    ./build_and_push.sh <docker_registry> [version]

If no version is passed the script will build and push all available Docker images
```
