#!/bin/ash

set -e
set -x

NAME_IMAGE='poetry'

if [ "$(docker image ls -q ${NAME_IMAGE})" ]; then
    echo "Image ${NAME_IMAGE} already exist."
else
    docker build -t ${NAME_IMAGE} --build-arg INPUT_PYTHON_VERSION=${INPUT_PYTHON_VERSION} --build-arg INPUT_POETRY_VERSION=${INPUT_POETRY_VERSION} -f ./Dockerfile-core ./
fi

docker run poetry ${INPUT_COMMAND}
