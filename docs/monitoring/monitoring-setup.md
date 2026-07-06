# CloudCart Monitoring Stack

## Overview

CloudCart uses a complete Kubernetes monitoring stack for metrics, visualization, logging, and alerting.

## Components

| Component | Purpose |
|----------|---------|
| Prometheus | Collects metrics from Kubernetes and applications |
| Grafana | Visualizes metrics and logs |
| Alertmanager | Sends alert notifications through Gmail SMTP |
| kube-state-metrics | Kubernetes object metrics |
| Node Exporter | Node CPU, memory, filesystem metrics |
| Loki | Centralized log aggregation |
| Promtail | Collects pod logs and forwards them to Loki |

---

## Installed using Helm

### Prometheus Stack

```bash
helm install monitoring prometheus-community/kube-prometheus-stack \
-n monitoring \
--create-namespace
```

### Loki Stack

```bash
helm install loki grafana/loki-stack \
-n monitoring
```

---

## Custom Monitoring

### ServiceMonitor

```
kubernetes/monitoring/auth-service-monitor.yaml
```

Monitors:

- Auth Service
- `/metrics` endpoint
- Scraped automatically by Prometheus

---

## Custom Alert Rules

```
kubernetes/monitoring/auth-service-alerts.yaml
```

Current alerts:

- AuthServiceDown

Condition

```
Deployment replicas == 0
```

Severity

```
critical
```

---

## Email Alerting

Alertmanager is configured using Gmail SMTP.

Features

- Email notifications
- Resolved notifications
- Alert grouping
- Repeat interval
- Watchdog alerts excluded from email

Configuration file

```
kubernetes/monitoring/alertmanager-values.yaml
```

Deployment

```
helm upgrade monitoring prometheus-community/kube-prometheus-stack \
-n monitoring \
-f kubernetes/monitoring/alertmanager-values.yaml
```

---

## Dashboards

Grafana dashboards include

- Kubernetes Cluster
- Nodes
- Pods
- Deployments
- Auth Service Metrics
- Loki Logs

---

## Logging

Loki stores logs collected by Promtail.

Collected logs

- Auth Service
- Frontend
- Kubernetes Events
- Pod Logs

---

## Monitoring Flow

Pods

↓

Prometheus ← ServiceMonitor

↓

Grafana

↓

Alertmanager

↓

Email Notification

Logs

↓

Promtail

↓

Loki

↓

Grafana Explore
