#!/usr/bin/env bash

## update the HOST_IP for all configuration files
sed_cmd="sed -i"
OS=$(uname)
if [[ "$OS" == "Darwin" ]]; then
    sed_cmd="sed -i ''"
fi
${sed_cmd} "s/__HOST_IP__/$HOST_IP/g" prometheus/prometheus.yml grafana/datasources/datasource.yml

docker rm -f prometheus grafana node_exporter redis redis_exporter  > /dev/null
echo "starting prometheus ..."
docker run -d \
    -v "$(pwd)"/prometheus/prometheus.yml:/etc/prometheus/prometheus.yml \
    -p 9090:9090 \
    --name prometheus \
    prom/prometheus > /dev/null

echo "starting grafana ..."
docker run -d \
    -v "$(pwd)"/grafana/datasources:/etc/grafana/provisioning/datasources \
    -v "$(pwd)"/grafana/dashboards:/etc/grafana/provisioning/dashboards \
    -v "$(pwd)"/grafana/grafana.ini:/etc/grafana/grafana.ini \
    --name grafana \
    -p 3000:3000 \
    grafana/grafana > /dev/null

echo "starting node_exporter ..."
docker run -d \
    --name node_exporter \
    -p 9100:9100 \
    --name=node_exporter prom/node-exporter > /dev/null

echo "starting redis ..."
docker run --name redis -p 6379:6379 -d redis > /dev/null

echo "starting redis_exporter ..."
docker run -d \
    --name redis_exporter \
    -p 9121:9121 oliver006/redis_exporter \
    --redis.addr redis://"${HOST_IP}":6379  > /dev/null

