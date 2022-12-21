# syntax=docker/dockerfile:1
FROM ubuntu:22.10
WORKDIR /app
RUN apt update && \
apt -y install build-essential git libwebsockets-dev pkg-config zlib1g-dev libnl-3-dev libnl-genl-3-dev libcap-dev libpcap-dev libnm-dev libdw-dev libsqlite3-dev libprotobuf-dev libprotobuf-c-dev protobuf-compiler protobuf-c-compiler libsensors4-dev libusb-1.0-0-dev python3 python3-setuptools python3-protobuf python3-requests python3-numpy python3-serial python3-usb python3-dev python3-websockets librtlsdr0 libubertooth-dev libbtbb-dev rtl-433 && \
git clone https://www.kismetwireless.net/git/kismet.git && \
apt clean && \
rm -rf /var/lib/apt/lists/*
WORKDIR /app/kismet
RUN ./configure && \
make -j6 && \
make suidinstall
WORKDIR /app
RUN rm -rf kismet
CMD kismet
EXPOSE 2501
