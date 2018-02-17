FROM ubuntu:16.04

USER root

RUN apt-get update &&        \
    apt-get install -y cmake \
    libssl-dev               \
    libcurl4-openssl-dev     \
    libopenblas-base         \
    libboost-dev-all         \
    openssh-server           \
    python                   \
    lsof                     \
    sudo                     \
    sssd                     \
    sssd-tools               \
    vim                      \
    git                      \
    wget                     \
    zip                      \
    g++                      \
    gcc                      \
    zsh

RUN if [ ! -d /var/run/sshd ]; then mkdir /var/run/sshd; chmod 0755 /var/run/sshd; fi
RUN for users in {'jhuber6','thuber1','mgoin','tdixon12'}; do \
        useradd -m -s /bin/zsh $users \ 
        echo "$users ALL=(ALL) NOPASSWD: ALL"; \
    done

USER jhuber6
WORKDIR /home/jhuber6
COPY jhuber6/dotfiles/* ./
