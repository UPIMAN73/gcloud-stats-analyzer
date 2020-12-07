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


# Docker Run Instances
docker run -d --name gcp-grafana -p 3010:3000 -v $GRAFANA_DIR:/home/grafana/gcp_grafana -e "GF_INSTALL_PLUGINS=grafana-clock-panel,grafana-simple-json-datasource" grafana/grafana
docker run -d --name gcp-stats-hoster -p 8083:80 -v $GRAFANA_DIR:/usr/local/apache2/htdocs/ httpd:2.4
docker run -d --name gcp-stats-manager -v $GRAFANA_DIR:/etc/gcp-stats-analyzer google/cloud-sdk /bin/bash

# Docker login to google cloud sdk environment execute cron command
docker exec -it gcp-stats-manager "apt install -y nano crontab && gcloud auth login"
docker exec -d gcp-stats-manager "bash /etc/gcp-stats-analyzer/run.sh" 
docker restart gcp-stats-manager