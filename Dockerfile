FROM ubuntu:20.04

RUN useradd -ms /bin/bash testuser
WORKDIR /home/testuser
USER testuser
