#!/bin/bash

CMD="rustlings watch"
CONTAINER_NAME=rustlings

# Build the container if it doesn't exist
if [[ "$(docker images -q $CONTAINER_NAME:latest 2> /dev/null)" == "" ]]; then
    echo "Building docker image for $CONTAINER_NAME"
    docker build -t $CONTAINER_NAME .
fi

# Run the container
if [[ ! "$(docker ps -q -f name=$CONTAINER_NAME)" ]]; then
    docker run --rm -it \
        --mount type=bind,source=$(pwd)/exercises,target=/home/rustlings/exercises \
        --log-driver=none -a stdin -a stdout -a stderr \
        --name=$CONTAINER_NAME $CONTAINER_NAME:latest $CMD
fi
