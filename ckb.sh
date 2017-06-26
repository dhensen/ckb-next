#!/usr/bin/env bash

docker run \
    -d \
    -u $(id -u) \
    -e DISPLAY=$DISPLAY \
    -e XDG_RUNTIME_DIR=/run/user/$(id -u) \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /run/user/$(id -u):/run/user/$(id -u) \
    -v /dev/input:/dev/input \
    -v $HOME/.config/ckb:/home/ckb/.config/ckb \
    ckb-next-arch:v8 /usr/bin/ckb
