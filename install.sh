#!/bin/bash

# Install required packages
sudo apt install python3 pip3

pip3 install -U grafana_api

# Setup environment and install grafana
#echo "Pulling Grafana Image from dockerhub"
#docker pull grafana/ubuntu-grafana

echo "Creating our own Image of Grafana & running it"
bash docker_build_grafana.sh
bash docker_run_grafana.sh

