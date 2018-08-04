# Pull base image.
FROM ubuntu:18.04
MAINTAINER Pablo Toledo "jptgjuanpablo@gmail.com"

# Install.
RUN apt-get update
RUN apt-get -y upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y qemu uml-utilities libguestfs-tools sudo
RUN rm -rf /var/lib/apt/lists/*

# Add files.
RUN mkdir -p /macos
ADD boot.sh macos/
ADD boot-install.sh macos/
ADD boot-mac.sh macos/
ADD Clover.qcow2 /macos

# Define working directory.
WORKDIR /macos

# Ports open.
EXPOSE 22 5800 5900 5901

# Define default command.
CMD ./boot.sh
