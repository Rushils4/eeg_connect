#/bin/bash

CONTAINER_NAME=eeg_connect-eeg_connect

docker-compose -f docker-compose.json up --build -d

xhost +local:docker

docker run \
--rm \
-it \
--network=host \
-e DISPLAY=$ip:0 \
-e LIBGL_ALWAYS_SOFTWARE=1 \
-e LIBGL_ALWAYS_INDIRECT=1 \
-e MESA_GL_VERSION_OVERRIDE=3.3 \
-e MESA_GLSL_VERSION_OVERRIDE=330 \
-v /tmp/.X11-unix/:/tmp/.X11-unix \
-v ~/.Xauthority:/root/.Xauthority
$CONTAINER_NAME