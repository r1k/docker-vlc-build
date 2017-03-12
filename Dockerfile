FROM ubuntu:16.04
    
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    build-essential git subversion autoconf pkg-config \
    vim apt-utils software-properties-common \
    python python-software-properties python-setuptools \
    wget dpkg-dev autopoint libtool bison flex yasm

RUN apt-get build-dep -y vlc

RUN addgroup --system ubuntu
RUN adduser --system --shell /bin/bash --gecos 'ubuntu' \
  --uid 1000 --disabled-password --home /home/ubuntu ubuntu
RUN adduser ubuntu sudo
RUN echo ubuntu:ubuntu | chpasswd
RUN echo "ubuntu ALL=NOPASSWD:ALL" >> /etc/sudoers
USER ubuntu
ENV HOME /home/ubuntu

RUN mkdir -p /home/ubuntu/src
VOLUME ["/home/ubuntu/src"]

WORKDIR /home/ubuntu/src

# Git config is needed so that cerbero can cleanly fetch some git repos
RUN git config --global user.email "you@example.com"
RUN git config --global user.name "r1k"

