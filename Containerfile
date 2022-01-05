FROM vagrantlibvirt/vagrant-libvirt:latest

ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true

RUN apt update && \
    apt install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt clean

RUN apt update && \
    apt install -y python3.9 sshpass && \
    apt clean