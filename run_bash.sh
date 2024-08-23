#! /bin/sh
xhost +

docker run --gpus all -it --rm \
    -v /dev:/dev \
    --device-cgroup-rule "c 81:* rmw" \
    --device-cgroup-rule "c 189:* rmw" \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    --network=host \
    -e DISPLAY=${DISPLAY} \
    -v /home:/home \
    --name librealsense \
    ddfl0417/librealsense:nvidia-cuda /bin/bash
