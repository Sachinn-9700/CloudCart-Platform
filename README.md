# ☁️ CloudCart Platform

## Production-Style Cloud-Native E-Commerce Platform

CloudCart Platform is a production-inspired cloud-native e-commerce application built to demonstrate modern DevOps engineering practices using Docker, Kubernetes, Helm, GitHub Actions, GitOps, Prometheus, and Grafana.

The project is intentionally built like a real production system rather than a tutorial project. Every stage focuses on automation, reproducibility, observability, and operational best practices.

> **Current Environment:** Local Kubernetes (Minikube)
>
> **Target Environment:** AWS EKS

---

# 🚀 Project Highlights

- Production-style microservices architecture
- Dockerized frontend and backend
- Kubernetes deployments with Helm
- GitOps deployment using ArgoCD
- Automated CI pipeline using GitHub Actions
- Automatic Docker image versioning
- Automatic Helm values update
- Automatic Kubernetes deployment through GitOps
- Prometheus monitoring
- Grafana dashboards
- Horizontal Pod Autoscaler (HPA)
- ConfigMaps, Secrets and Persistent Volumes
- Production-oriented repository structure

---

# 🏗️ Current Architecture

```text
                   Developer
                       │
                  Git Push
                       │
                  GitHub Repo
                       │
             GitHub Actions (CI)
                       │
      ┌────────────────┴───────────────┐
      │                                │
Build Frontend Image            Build Backend Image
      │                                │
      └──────────────┬─────────────────┘
                     │
             Push Images to Docker Hub
                     │
             Update Helm Image Tags
                     │
          Commit Updated values/dev.yaml
                     │
                  Push to GitHub
                     │
                 ArgoCD (GitOps)
                     │
             Kubernetes Cluster
                     │
      ┌──────────────┴───────────────┐
      │                              │
 Frontend Service            Auth Service
      │                              │
      └──────────────┬───────────────┘
                     │
                PostgreSQL
                     │
                  Persistent
                   Storage
                     │
                 NGINX Ingress
                     │
             http://cloudcart.local
```

---

# 🛠️ Technology Stack

## Frontend

- React
- Vite

## Backend

- FastAPI
- Python

## Database

- PostgreSQL

## Containerization

- Docker
- Docker Hub

## Container Orchestration

- Kubernetes
- Minikube

## Kubernetes Package Management

- Helm

## GitOps

- ArgoCD

## CI/CD

- GitHub Actions

## Monitoring

- Prometheus
- Grafana

## Networking

- NGINX Ingress Controller

---

# 📁 Repository Structure

```
CloudCart-Platform/

├── frontend/
├── backend/
│   └── auth-service/
├── database/
├── docker-compose.yml
│
├── helm/
│   └── cloudcart/
│       ├── Chart.yaml
│       ├── templates/
│       └── values/
│           └── dev.yaml
│
├── gitops/
│   └── applications/
│
├── kubernetes/
│
├── docs/
│
└── .github/
    └── workflows/
        └── cloudcart-ci.yaml
```

---

# ✅ Current Features

## Application

- React Frontend
- FastAPI Authentication Service
- PostgreSQL Database

---

## Docker

- Multi-stage frontend image
- Optimized backend image
- Docker Compose
- Docker Hub image publishing

---

## Kubernetes

- Deployments
- Services
- ConfigMaps
- Secrets
- Persistent Volume Claims
- Ingress
- Health Probes
- Resource Limits

---

## Helm

- Parameterized deployments
- Environment-specific values
- Configurable replicas
- Configurable image repositories
- Configurable image tags
- Configurable ingress host
- Configurable HPA

---

## GitHub Actions (CI)

Automatically performs:

- Repository checkout
- Docker image build
- Docker Hub push
- Generate image tag from Git SHA
- Update Helm values
- Commit updated image tags
- Push changes back to GitHub

---

## GitOps (ArgoCD)

Automatically:

- Watches GitHub repository
- Detects Helm value changes
- Synchronizes Kubernetes cluster
- Self-heals drift
- Supports automatic pruning

---

## Monitoring

- Prometheus metrics collection
- Grafana dashboards
- Kubernetes metrics integration
- Application metrics endpoint

---

## Auto Scaling

- Horizontal Pod Autoscaler
- CPU-based scaling

---

# 📊 Current Project Status

| Component | Status |
|-----------|--------|
| React Frontend | ✅ |
| FastAPI Auth Service | ✅ |
| PostgreSQL | ✅ |
| Docker | ✅ |
| Docker Compose | ✅ |
| Kubernetes | ✅ |
| NGINX Ingress | ✅ |
| Helm | ✅ |
| GitHub Actions | ✅ |
| Docker Hub | ✅ |
| ArgoCD | ✅ |
| GitOps | ✅ |
| Prometheus | ✅ |
| Grafana | ✅ |
| Horizontal Pod Autoscaler | ✅ |
| Terraform | 🚧 |
| AWS EKS | 🚧 |
| Product Service | 🚧 |
| Cart Service | 🚧 |
| Payment Service | 🚧 |
| Order Service | 🚧 |

---

# 🔄 CI/CD & GitOps Workflow

```
Developer

↓

Git Push

↓

GitHub Actions

↓

Build Docker Images

↓

Push Images to Docker Hub

↓

Update Helm values/dev.yaml

↓

Commit Updated Image Tag

↓

Push to GitHub

↓

ArgoCD Detects Change

↓

Deploy to Kubernetes

↓

Application Updated
```

---

# 🎯 Project Goals

This project is being developed to gain hands-on experience with:

- Docker
- Kubernetes
- Helm
- GitOps
- CI/CD
- Infrastructure as Code
- Monitoring
- Cloud-native architecture
- Production deployment strategies
- Platform engineering practices

The focus is on understanding **why** each technology is used and how they work together in a real-world deployment pipeline.

---

# 📚 What I Learned

Building CloudCart has provided practical experience with:

- Docker image optimization
- Kubernetes deployments and networking
- Services and Ingress
- ConfigMaps and Secrets
- Persistent Volumes
- Helm templating
- GitHub Actions automation
- GitOps using ArgoCD
- Dynamic image versioning
- Prometheus monitoring
- Grafana visualization
- YAML troubleshooting
- Git rebase with CI-generated commits
- Production-style debugging and troubleshooting

---

# 🚧 Roadmap

## Infrastructure

- Terraform for AWS infrastructure
- AWS EKS deployment
- Remote Terraform state

## Microservices

- Product Service
- Cart Service
- Payment Service
- Order Service

## Security

- Trivy image scanning
- RBAC
- Network Policies
- Secrets management improvements

## Observability

- Alertmanager
- Loki
- Distributed tracing
- OpenTelemetry

## Kubernetes

- Production-grade Helm chart
- Multiple environments
- PodDisruptionBudgets
- Resource optimization

---

# 💡 Engineering Principles

CloudCart follows a few core principles throughout development:

- Build production-style solutions, not tutorial projects.
- Understand every technology before using it.
- Automate repetitive tasks wherever possible.
- Treat Git as the single source of truth.
- Keep infrastructure reproducible.
- Learn through troubleshooting real problems rather than avoiding them.
- Prioritize simplicity over unnecessary complexity.

---

# 🤝 Contributing

Contributions, suggestions, and feedback are always welcome.

If you have ideas for improving the platform or its DevOps workflows, feel free to open an issue or submit a pull request.

---

# 📄 License

This project is licensed under the MIT License.

---

> **CloudCart Platform** is an ongoing DevOps learning project that evolves incrementally toward a production-grade cloud-native platform. Each milestone introduces new tooling and operational practices while preserving a realistic engineering workflow.
