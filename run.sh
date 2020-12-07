#!/bin/bash

GCP_STATS_DIR=/etc/gcp-stats-analyzer 

sudo echo  "* 1 * * * root $GCP_STATS_DIR/daily.sh" >> /etc/crontab
bash $GCP_STATS_DIR/daily.sh
