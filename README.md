# CloudCart Platform

## 🛒 Production-Grade Cloud-Native E-Commerce Platform

CloudCart Platform is a production-inspired microservices e-commerce application built to demonstrate modern DevOps, Kubernetes, GitOps, observability, autoscaling, and platform engineering practices.

The project starts locally on Minikube and is designed for future migration to AWS EKS.

---

# 🚀 Tech Stack

## Frontend

* React

## Backend

* FastAPI (Python)

## Database & Cache

* PostgreSQL
* Redis

## DevOps & Platform

* Docker
* Kubernetes
* Minikube
* Helm
* NGINX Ingress

## CI/CD & GitOps

* GitHub Actions
* ArgoCD
* Argo Rollouts (Canary Deployments)

## Observability

* Prometheus
* Grafana
* Loki
* Slack Alerts

## Security & Governance

* Trivy

## Future Additions

* KEDA
* Istio
* OpenTelemetry
* Vault

---

# 🏗️ Architecture

```text id="ltjlwm"
User
  ↓
Ingress
  ↓
Frontend Service
  ↓
API Services
 ├── Auth Service
 ├── Product Service
 ├── Cart Service
 ├── Payment Service
 └── Order Service
  ↓
PostgreSQL + Redis
```

---

# ☸️ Kubernetes Design

Namespaces:

* frontend
* backend
* database
* monitoring
* argocd

Features:

* resource quotas
* autoscaling
* GitOps deployments
* monitoring & logging
* canary rollouts

---

# 🎯 Project Goals

This project focuses on:

* Kubernetes engineering
* GitOps workflows
* Docker optimization
* observability
* DevSecOps
* autoscaling
* progressive delivery
* platform engineering

---

# 🔮 Future Improvements

* AWS EKS migration
* KEDA autoscaling
* Istio service mesh
* OpenTelemetry tracing
* Vault secret management

---

# 📌 Project Philosophy

> Build small, engineer properly, scale gradually.
