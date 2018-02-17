FROM ubuntu

USER root

RUN apt-get update &&        \
    apt-get install -y cmake \
    libssl-dev               \
    libcurl4-openssl-dev     \
    libopenblas-base         \
    openssh-server           \
    python                   \
    boost                    \
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

RUN useradd -m -g wheel -s /bin/bash jhuber6 &&  \
    echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN if [ ! -d /var/run/sshd ]; then mkdir /var/run/sshd; chmod 0755 /var/run/sshd; fi

USER jhuber6
ENV SHELL /bin/bash
WORKDIR /home/jhuber6
COPY test.txt ./test.txt
