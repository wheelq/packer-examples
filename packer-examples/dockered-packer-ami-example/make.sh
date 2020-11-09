#!/bin/sh

docker run -it \
    --env-file ./.env \
    --mount type=bind,source=${PWD}/,target=/tmp \
    hashicorp/packer:latest build \
    --var-file /tmp/vars.json \
    /tmp/template.json
