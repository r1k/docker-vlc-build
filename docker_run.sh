#!/bin/bash

docker run -v `pwd`/docker_src:/home/ubuntu/src -it r1k/vlc-build:v1 /bin/bash
