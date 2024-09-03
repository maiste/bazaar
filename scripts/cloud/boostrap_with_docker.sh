#!/usr/bin/env bash

set -ue

echo "--> Update packages with APT"
apt update -y
apt upgrade -y
apt install git ufw

echo "--> Install Docker"
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do
    apt-get remove $pkg;
done
apt update
apt install ca-certificates curl
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null
apt update
apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "--> Set up ufw"
ufw allow OpenSSH
ufw enable