#!/bin/bash

# Install required packages
sudo apt install python3 python3-pip

pip3 install -U grafana_api

# Setup environment and install grafana
echo "Pulling Images from dockerhub"
docker image pull grafana/grafana
docker image pull httpd:2.4
docker image pull google/cloud-sdk

echo "Setting up docker images"
bash docker_install_grafana.sh

