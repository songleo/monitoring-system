This repository provides a tool for rapidly establishing a monitoring system, ideal for Proof of Concept (PoC), educational or testing purposes.

All components are installed and initiated on local host as Docker containers. It primarily includes the following components:

- alertmanager
- grafana
- node-exporter
- prometheus
- redis
- redis_exporter

All [dashboards](grafana/dashboards) are sourced from: https://grafana.com/grafana/dashboards/

### Prerequisites

- Docker

### Building Monitoring System

```
$ export HOST_IP=192.168.0.106
$ ./install.sh
```

### Access Consoles

- [Prometheus UI](http://localhost:9090/graph)
- [Grafana UI](http://localhost:3000/)
- [Alertmanager UI](http://localhost:9093/#/alerts)

### Metric Endpoint

- [Prometheus Metrics](http://localhost:9090/metrics)
- [Host Metrics](http://localhost:9100/metrics)
- [Redis Metrics](http://localhost:9121/metrics)
