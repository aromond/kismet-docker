# syntax=docker/dockerfile:1
FROM ubuntu:22.04
RUN apt update && \
apt -y install wget gnupg rtl-sdr && \
wget -O - https://www.kismetwireless.net/repos/kismet-release.gpg.key | apt-key add - && \
echo 'deb https://www.kismetwireless.net/repos/apt/git/jammy jammy main' | tee /etc/apt/sources.list.d/kismet.list && \
apt update && \
apt -y install kismet && \
apt clean && \
rm -rf /var/lib/apt/lists/*
CMD kismet
EXPOSE 2501
