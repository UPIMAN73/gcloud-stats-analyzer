docker build \
  --build-arg "GRAFANA_VERSION=latest" \
  --build-arg "GF_INSTALL_PLUGINS=grafana-clock-panel,grafana-simpod-json-datasource,grafana-simple-json-datasource" \
  -t grafana-gcloud-stats-analyzer -f ubuntu.Dockerfile .

