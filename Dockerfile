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

WORKDIR /tmp
RUN wget 'https://dl.bintray.com/boostorg/release/1.66.0/source/boost_1_66_0.tar.bz2' && \
	tar -xf boost_1_66_0.tar.bz2 && \
	./boost_1_66_0/bootsrap.sh && \
	./boost_1_66_0/b2 install -j2 && \

RUN git clone https://github.com/ornl-qci/xacc && \
	mkdir -p xacc/build && \ 
	cd xacc/build && \
	cmake .. && make -j2 install

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

USER thuber1
WORKDIR /home/thuber1
COPY jhuber6/dotfiles/* ./

USER mgoin
WORKDIR /home/mgoin
COPY jhuber6/dotfiles/* ./

USER tdixon12
WORKDIR /home/tdixon12
COPY jhuber6/dotfiles/* ./
