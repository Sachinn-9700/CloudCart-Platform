# ☁️ CloudCart Platform

## Production-Style Cloud-Native Microservices Platform

CloudCart is a production-inspired cloud-native e-commerce platform built to demonstrate modern DevOps engineering practices using Docker, Kubernetes, Helm, GitHub Actions, GitOps, Prometheus, and Grafana.

Rather than following a tutorial, the project is developed incrementally to simulate how a real platform evolves—from a single service to a scalable microservices architecture with automated CI/CD, GitOps, observability, and infrastructure automation.

> **Current Environment:** Local Kubernetes (Minikube)
>
> **Target Environment:** AWS EKS

---

# 🚀 Project Highlights

- Production-style repository structure
- Microservices-based architecture
- Dockerized frontend and backend services
- Docker Compose for local development
- Kubernetes deployments using raw manifests and Helm
- GitHub Actions CI pipeline
- GitOps deployment with ArgoCD
- Automated Docker image versioning
- Prometheus monitoring & Grafana dashboards
- Horizontal Pod Autoscaler (HPA)
- ConfigMaps, Secrets and Persistent Storage

---

# 📌 Current Implementation

Currently implemented:

- ✅ React Frontend
- ✅ FastAPI Auth Service
- ✅ PostgreSQL
- ✅ Docker & Docker Compose
- ✅ Kubernetes Manifests
- ✅ Helm Deployment
- ✅ GitHub Actions CI
- ✅ ArgoCD GitOps
- ✅ Prometheus & Grafana
- ✅ Horizontal Pod Autoscaler

Repository scaffold created for:

- 🚧 Product Service
- 🚧 Cart Service
- 🚧 Order Service
- 🚧 Payment Service

---

# 🏗️ Platform Architecture

```text
                     Developer
                         │
                    Git Push
                         │
                  GitHub Repository
                         │
                GitHub Actions (CI)
                         │
            Build & Push Docker Images
                         │
             Update Helm Image Tags
                         │
                    Commit to Git
                         │
                    ArgoCD (GitOps)
                         │
               Kubernetes Cluster
                         │
      ┌──────────────┬──────────────┬──────────────┐
      │              │              │
 Frontend      Auth Service ✓   Product Service 🚧
                                      │
                    Cart / Order / Payment 🚧
                                      │
                                PostgreSQL
                                      │
                             NGINX Ingress
                                      │
                           cloudcart.local
```

---

# 🛠️ Technology Stack

### Application

- React
- FastAPI
- PostgreSQL

### Platform

- Docker
- Docker Compose
- Kubernetes
- Helm

### CI/CD & GitOps

- GitHub Actions
- ArgoCD
- Docker Hub

### Observability

- Prometheus
- Grafana

### Infrastructure (Planned)

- Terraform
- AWS EKS

---

# ✅ Features

### Containerization

- Multi-stage frontend image
- Optimized backend image
- Docker Compose development environment

### Kubernetes

- Deployments
- Services
- ConfigMaps
- Secrets
- Persistent Volume Claims
- NGINX Ingress
- Health Probes
- Resource Limits

### Helm

- Parameterized deployments
- Environment-specific values
- Configurable image tags
- Configurable replicas
- Configurable ingress
- Configurable HPA

### CI/CD

GitHub Actions automatically:

- Builds Docker images
- Pushes images to Docker Hub
- Generates image tags
- Updates Helm values
- Commits updated image tags

### GitOps

ArgoCD automatically:

- Watches the Git repository
- Detects Helm changes
- Synchronizes the cluster
- Self-heals drift
- Supports automatic pruning

### Monitoring

- Prometheus metrics
- Grafana dashboards
- Kubernetes metrics integration

---

# 📊 Project Status

| Component | Status |
|-----------|--------|
| Repository Restructure | ✅ |
| Multi-service Layout | ✅ |
| React Frontend | ✅ |
| Auth Service | ✅ |
| PostgreSQL | ✅ |
| Docker | ✅ |
| Docker Compose | ✅ |
| Kubernetes | ✅ |
| Helm | ✅ |
| GitHub Actions | ✅ |
| ArgoCD | ✅ |
| GitOps | ✅ |
| Prometheus | ✅ |
| Grafana | ✅ |
| Horizontal Pod Autoscaler | ✅ |
| Product Service | 🚧 |
| Cart Service | 🚧 |
| Order Service | 🚧 |
| Payment Service | 🚧 |
| Terraform | 🚧 |
| AWS EKS | 🚧 |

---

# 🔄 Repository Evolution

```text
React + FastAPI
        │
Docker
        │
Docker Compose
        │
Kubernetes Manifests
        │
Helm
        │
GitHub Actions (CI)
        │
ArgoCD (GitOps)
        │
Repository Restructured for Microservices
        │
Terraform (Planned)
        │
AWS EKS (Planned)
```

---

# 📚 Key Learnings

Building CloudCart provided hands-on experience with:

- Docker image optimization
- Kubernetes networking
- Helm templating
- GitHub Actions automation
- GitOps with ArgoCD
- Dynamic image versioning
- Prometheus & Grafana
- Kubernetes troubleshooting
- Production-style debugging
- Git workflows and repository management

---

# 🚧 Roadmap

## Phase 1 — Microservices

- Product Service
- Cart Service
- Order Service
- Payment Service

## Phase 2 — Infrastructure

- Terraform
- AWS VPC
- Amazon EKS
- Remote Terraform State

## Phase 3 — Security

- Trivy Image Scanning
- RBAC
- Network Policies
- Improved Secret Management

## Phase 4 — Observability

- Alertmanager
- Loki
- OpenTelemetry
- Distributed Tracing

---

# 💡 Engineering Principles

CloudCart is built around a few core engineering principles:

- Build production-style solutions instead of tutorial projects.
- Understand every technology before introducing it.
- Automate repetitive workflows.
- Treat Git as the single source of truth.
- Keep infrastructure reproducible.
- Learn by solving real operational problems.
- Prefer simplicity over unnecessary complexity.

---

# 📄 License

This project is licensed under the MIT License.

---

> CloudCart Platform is an evolving DevOps engineering project focused on building a production-style cloud-native platform through incremental improvements. Each milestone introduces new tooling and operational practices while preserving a realistic engineering workflow.