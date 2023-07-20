FROM ubuntu:20.04

MAINTAINER Nirav Desai "nirav.p.desai@slscorp.com"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get -y install sudo gawk wget git-core diffstat unzip texinfo gcc-multilib build-essential chrpath socat cpio python \
    python3 python3-pip python3-pexpect xz-utils debianutils iputils-ping python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev pylint3 xterm \
    dosfstools e2fsprogs gawk mtools parted locales zip

RUN groupadd -g 2000 dev \
            && useradd -u 2000 -g dev -d /home/dev dev \
            && mkdir /home/dev \
            && chown -R dev:dev /home/dev

RUN echo '%sysadmin ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN locale-gen en_US.UTF-8

ENV LANG en_US.UTF-8

USER dev 

WORKDIR /home/dev
