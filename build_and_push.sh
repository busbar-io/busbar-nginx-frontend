#!/bin/bash

#
# build_and_push.sh - Build and push application base images
#

# Variables
registry=$1

# Functions
usage () {
    echo
    echo "build_and_push.sh - Build and push application base images"
    echo
    echo "Usage:"
    echo "    $0 <docker_registry> [version]"
    echo
    echo "If no version is passed the script will build and push all available Docker images"
    echo
}

build_and_push () {
    image="busbario/nginx-frontend"
    version=$1

    # Docker build
    docker build --rm --force-rm -t ${image}:${version} -t ${image}:latest ${image}/${version} || exit 1

    # Docker tag
    docker tag ${image}:${version} ${registry}/${image}:${version}
    docker tag ${image}:latest ${registry}/${image}:latest

    # Docker push
    docker push ${registry}/${image}:${version}
    docker push ${registry}/${image}:latest
}

# Validation
if [[ $# < 1 ]]; then
    usage
    exit 1
fi

# Action
if [[ $# == 1 ]]; then
    for version in $(ls versions); do
        build_and_push $version
    done

elif [[ $# == 2 ]]; then
    version=$2
    build_and_push $version
fi

exit 0
