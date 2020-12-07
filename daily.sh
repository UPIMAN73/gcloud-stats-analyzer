#!/bin/bash

# Log Files Output Variables
LOG_DIR="$HOME/logs"
ENABLED_SERVICES="enabled_services"
AVAILABLE_SERVICES="available_services"
COMPUTE_ENGINE_LIST="compute_engine_list"
COMPUTE_ENGINE_DISK_LIST="compute_engine_disk_list"
OVERALL_STATS="overall_stats"

# Check to see if log directory exists
if [ ! -d $LOG_DIR ]
then
    # Make Log Directory
    mkdir $LOG_DIR
fi

# Go through and run each command to check status of the cloud services

# Services Stats
gcloud services list --enabled > "$LOG_DIR/$ENABLED_SERVICES"
gcloud services list --available > "$LOG_DIR/$AVAILABLE_SERVICES"

# Compute Stats
gcloud compute instances list &> "$LOG_DIR/$COMPUTE_ENGINE_LIST"
gcloud compute disks list &> "$LOG_DIR/$COMPUTE_ENGINE_DISK_LIST"



#################
# OVERALL Stats #
#################

# Overall stats to be placed in an overall file
NUM_ENABLED="$(wc -l $LOG_DIR/$ENABLED_SERVICES | cut -d ' ' -f1 -)"
NUM_AVAILABLE="$(wc -l $LOG_DIR/$AVAILABLE_SERVICES  | cut -d ' ' -f1 -)"
NUM_CINST="$(cut -d ' ' -f2 $LOG_DIR/$COMPUTE_ENGINE_LIST)"
NUM_CDISK="$(cut -d ' ' -f2 $LOG_DIR/$COMPUTE_ENGINE_DISK_LIST)"


# Writeout to file
echo "Enabled Services: $NUM_ENABLED" > $LOG_DIR/$OVERALL_STATS
echo "Available Services: $NUM_AVAILABLE" >> $LOG_DIR/$OVERALL_STATS
echo "Compute Engine Instances: $NUM_CINST" >> $LOG_DIR/$OVERALL_STATS
echo "Compute Engine Disks: $NUM_CDISK" >> $LOG_DIR/$OVERALL_STATS

# Writeout to console
cat $LOG_DIR/$OVERALL_STATS