FROM ubuntu:16.04

USER root

RUN apt-get update &&        \
    apt-get install -y cmake \
    libssl-dev               \
    libcurl4-openssl-dev     \
    libboost-all-dev         \
    libopenblas-base         \
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

COPY /audris/eecsCA_v3.crt /etc/ssl/ 
COPY /audris/sssd.conf /etc/sssd/ 
COPY /audris/common* /etc/pam.d/ 
RUN  chmod 0600 /etc/sssd/sssd.conf /etc/pam.d/common* 

RUN if [ ! -d /var/run/sshd ]; then mkdir /var/run/sshd; chmod 0755 /var/run/sshd; fi
RUN for users in {'jhuber6','thuber1','mgoin','tdixon12'}; do \
        useradd -m -s /bin/bash $users; \ 
        echo "$users ALL=(ALL) NOPASSWD: ALL"; done

USER jhuber6
WORKDIR /home/jhuber6
COPY jhuber6/dotfiles/* ./
