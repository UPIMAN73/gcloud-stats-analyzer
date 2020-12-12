# gcloud-stats-analyzer
This is a basic google cloud project stats analyzer for more concentrated metrics such as services, compute instances, bigqueries, buckets, etc. and forms it into a JSON format.

To install and setup the environment:

`./install.sh`

To change the project that is being monitored goto `docker_install_grafana.sh` and change the `PROJECT_NAME` value or execute:

`docker exec -it gcp-stats-manager gcloud config set project $PROJECT_NAME$`