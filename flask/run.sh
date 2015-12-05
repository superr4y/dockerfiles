#!/bin/bash
docker run -p 5000:5000 -it --rm -v "$PWD":/srv/app superr4y/falsk:latest
