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


docker -d --name gcp-grafana -p 3010:3010 -v $GRAFANA_DIR:~/gcp_grafana  grafana-gcloud-stats-analyzer
