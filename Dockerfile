FROM ubuntu

USER root

RUN apt-get update &&        \
    apt-get install -y cmake \
    libssl-dev               \
    libcurl4-openssl-dev     \
    libopenblas-base         \
    openssh-server           \
    python                   \
    libboost-all-dev         \
    lsof                     \
    sudo                     \
    sssd                     \
    sssd-tools               \
    vim                      \
    git                      \
    wget                     \
    zip                      \
    g++                      \
    gcc

RUN if [ ! -d /var/run/sshd ]; then mkdir /var/run/sshd; chmod 0755 /var/run/sshd; fi
RUN useradd -m -s /bin/bash jhuber6

USER jhuber6
ENV SHELL /bin/bash
WORKDIR /home/jhuber6
COPY test.txt ./test.txt
