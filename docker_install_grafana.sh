#!/bin/bash

# Log Files Output Variables
LOG_DIR="$HOME/logs"
GRAFANA_DIR="$HOME/gcp_grafana"

if [ ! -d $LOG_DIR ]
then
    mkdir $LOG_DIR
elif [ ! -d $GRAFANA_DIR ]
then
    mkdir $GRAFANA_DIR
fi


# Docker Install image
docker pull grafana/grafana

# Docker 
docker -d --name gcp-grafana -p 3010:3010 -v $GRAFANA_DIR:~/gcp_grafana -e "GF_INSTALL_PLUGINS=grafana-clock-panel,grafana-simpod-json-datasource,grafana-simple-json-datasource" grafana/grafana
