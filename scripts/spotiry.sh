#!/bin/sh

docker run -it \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -e DISPLAY=unix$DISPLAY \
  -v /dev/snd:/dev/snd --privileged \
  --name spotify \
  jess/spotify
