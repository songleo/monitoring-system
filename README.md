This repository offers a tool for quickly setting up a monitoring system utilizing the Prometheus and Grafana monitoring stack. It's perfect for Proof of Concept (PoC), educational, or testing scenarios. Note that this monitoring setup does not include persistent storage for monitoring data, so restarting the system will reset all statuses.

All components are deployed as Docker containers on the local host, including:

- alertmanager
- grafana
- node-exporter
- prometheus
- redis
- redis_exporter

All [dashboards](grafana/dashboards) are sourced from: https://grafana.com/grafana/dashboards/

### Prerequisites

- docker

### Building Monitoring System

You need to provide the local host ip via env. For example, if you local host ip is `192.168.0.106`, run the following cmd to build the monitoring system.

```
$ git clone git@github.com:songleo/monitoring-system.git
$ cd monitoring-system/
$ export HOST_IP=192.168.0.106
$ ./install.sh
```

### Access Console

- [Prometheus UI](http://localhost:9090/graph)
- [Grafana UI](http://localhost:3000/)
- [Alertmanager UI](http://localhost:9093/#/alerts)

### Metric Endpoint

- [Prometheus Metrics](http://localhost:9090/metrics)
- [Host Metrics](http://localhost:9100/metrics)
- [Redis Metrics](http://localhost:9121/metrics)
