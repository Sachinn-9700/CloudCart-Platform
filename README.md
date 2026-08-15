# ☁️ CloudCart Platform

## Production-Style Cloud-Native Microservices Platform

CloudCart is a production-inspired cloud-native platform built to demonstrate modern DevOps engineering practices using Docker, Kubernetes, Helm, GitHub Actions, GitOps, Prometheus, and Grafana.

The project is developed incrementally to simulate how a real platform evolves—from application containerization to Kubernetes orchestration, CI/CD automation, GitOps deployment, observability, and infrastructure automation.

The platform currently consists of a React frontend, three backend services, and PostgreSQL.

> **Current Environment:** Local Kubernetes (Minikube)
>
> **Target Environment:** AWS EKS

---

# 🚀 Project Highlights

- Production-style repository structure
- Microservices-based architecture
- React frontend
- FastAPI backend services
- PostgreSQL database
- Dockerized application components
- Docker Compose for local development
- Kubernetes deployments using raw manifests
- Helm-based Kubernetes deployment
- GitHub Actions CI pipeline
- GitOps deployment using ArgoCD
- Automated Docker image versioning
- Prometheus monitoring
- Grafana dashboards
- Horizontal Pod Autoscaler (HPA)
- ConfigMaps and Secrets
- Persistent storage
- Automated service testing

---

# 📌 Current Implementation

Currently implemented:

- ✅ React Frontend
- ✅ FastAPI Auth Service
- ✅ FastAPI Product Service
- 🟡 Payment Service
- ✅ PostgreSQL
- ✅ Docker
- ✅ Docker Compose
- ✅ Kubernetes Manifests
- ✅ Helm Chart
- ✅ GitHub Actions CI
- ✅ ArgoCD GitOps configuration
- ✅ Prometheus configuration
- ✅ Grafana dashboards
- ✅ Horizontal Pod Autoscaler
- ✅ Product Service API Tests

The application architecture intentionally focuses on three backend services:

- **Auth Service** — authentication and user-related functionality
- **Product Service** — product/catalog management and product APIs
- **Payment Service** — payment-related functionality

Cart and Order services were intentionally removed to keep the platform architecture focused and avoid introducing services that do not provide meaningful value to the project.

---

# 🏗️ Platform Architecture

```text
                              Developer
                                  │
                              Git Push
                                  │
                                  ▼
                         GitHub Repository
                                  │
                                  ▼
                         GitHub Actions (CI)
                                  │
                    ┌─────────────┴─────────────┐
                    │                           │
             Build Docker Images          Run Tests
                    │
                    ▼
                 Docker Hub
                    │
                    ▼
          Update Helm Image Tags
                    │
                    ▼
               Git Commit
                    │
                    ▼
                 ArgoCD
                (GitOps)
                    │
                    ▼
           Kubernetes Cluster
                    │
          ┌─────────┴─────────┐
          │                   │
          ▼                   ▼
     NGINX Ingress        PostgreSQL
          │
          ▼
     React Frontend
          │
          ▼
   ┌──────┼──────────┐
   │      │          │
   ▼      ▼          ▼
 Auth   Product    Payment
Service  Service    Service
   │      │          │
   └──────┴──────────┘
          │
          ▼
      PostgreSQL


          Kubernetes Observability
                    │
          ┌─────────┴─────────┐
          ▼                   ▼
      Prometheus            Grafana
          │
          ▼
       Metrics
````

---

# 🛠️ Technology Stack

### Application

* React
* FastAPI
* PostgreSQL

### Containerization

* Docker
* Docker Compose
* Docker Hub

### Orchestration

* Kubernetes
* Minikube
* Helm
* NGINX Ingress Controller

### CI/CD & GitOps

* GitHub Actions
* ArgoCD
* GitOps

### Observability

* Prometheus
* Grafana

### Infrastructure

* Terraform — planned
* AWS VPC — planned
* Amazon EKS — planned

---

# ✅ Features

## Containerization

* Multi-stage frontend image
* Optimized backend container images
* Docker Compose development environment
* Service-specific Dockerfiles

## Microservices

### Auth Service

Handles authentication-related backend functionality.

### Product Service

Provides product/catalog functionality including:

* Create product
* List products
* Retrieve product
* Update product
* Delete product
* Filter products by brand
* Filter products by featured status
* Product validation
* Error handling

### Payment Service

Provides the payment-service foundation for payment-related functionality.

---

# 🧪 Testing

The Product Service includes automated API tests using:

* pytest
* FastAPI TestClient
* PostgreSQL test database

Current Product Service test coverage includes:

* Product creation
* Product listing
* Product retrieval
* Brand filtering
* Featured filtering
* Product update
* Product deletion
* Product-not-found handling
* Invalid payload validation

The test suite is executed inside the Docker environment against the dedicated test database.

---

# ☸️ Kubernetes

The project contains Kubernetes manifests for:

* Namespace
* Frontend
* Auth Service
* Product Service
* Payment Service
* PostgreSQL
* Services
* ConfigMaps
* Secrets
* Persistent Volume Claims
* Health probes
* Resource requests and limits
* NGINX Ingress
* Horizontal Pod Autoscaler
* Monitoring configuration

The Kubernetes configuration is currently being cross-checked and validated end-to-end on the local Minikube environment.

---

# ⛵ Helm

CloudCart includes a Helm chart for deploying the platform to Kubernetes.

The chart provides:

* Parameterized deployments
* Environment-specific values
* Configurable image tags
* Configurable replicas
* Configurable ingress
* Configurable HPA
* Kubernetes resource templates

Environment-specific values are maintained under:

```text
helm/cloudcart/values/
├── dev.yaml
└── prod.yaml
```

---

# 🔄 CI/CD

GitHub Actions is used as the CI pipeline.

The pipeline is responsible for:

* Building Docker images
* Pushing images to Docker Hub
* Generating image tags
* Updating Helm image tags
* Committing updated image tags

This allows application changes to progress from source code to container images and GitOps deployment.

---

# 🔁 GitOps

ArgoCD is used to implement the GitOps deployment model.

The intended flow is:

```text
Developer
    │
    ▼
GitHub
    │
    ▼
GitHub Actions
    │
    ▼
Docker Image
    │
    ▼
Helm Values Update
    │
    ▼
Git Repository
    │
    ▼
ArgoCD
    │
    ▼
Kubernetes
```

Git is treated as the source of truth for the desired Kubernetes state.

---

# 📊 Monitoring & Observability

CloudCart includes monitoring components based on:

* Prometheus
* Grafana
* Kubernetes metrics
* Application metrics
* Alerting configuration

Existing monitoring documentation and dashboards are maintained under:

```text
docs/monitoring/
```

The monitoring stack will be validated end-to-end during the infrastructure verification phase.

---

# 📈 Autoscaling

The project includes Kubernetes Horizontal Pod Autoscaler configuration.

The HPA uses Kubernetes resource metrics to allow workloads to scale based on resource utilization.

The HPA configuration will be validated during the Kubernetes testing phase.

---

# 📊 Project Status

| Component                 | Status                     |
| ------------------------- | -------------------------- |
| Repository Restructure    | ✅                          |
| Microservice Architecture | ✅                          |
| React Frontend            | ✅                          |
| Auth Service              | ✅                          |
| Product Service           | ✅                          |
| Payment Service           | 🟡                         |
| PostgreSQL                | ✅                          |
| Docker                    | ✅                          |
| Docker Compose            | ✅                          |
| Product API Tests         | ✅                          |
| Kubernetes Manifests      | 🟡 Verification            |
| Helm                      | 🟡 Verification            |
| GitHub Actions            | ✅                          |
| ArgoCD                    | 🟡 Verification            |
| GitOps                    | 🟡 End-to-End Verification |
| NGINX Ingress             | 🟡 Verification            |
| Prometheus                | 🟡 Verification            |
| Grafana                   | 🟡 Verification            |
| Horizontal Pod Autoscaler | 🟡 Verification            |
| Terraform                 | 🚧 Planned                 |
| AWS VPC                   | 🚧 Planned                 |
| AWS EKS                   | 🚧 Planned                 |
| Showcase Mode             | 🚧 Planned                 |

---

# 🔄 Repository Evolution

```text
React + FastAPI
        │
        ▼
Docker
        │
        ▼
Docker Compose
        │
        ▼
Kubernetes Manifests
        │
        ▼
Helm
        │
        ▼
GitHub Actions (CI)
        │
        ▼
ArgoCD (GitOps)
        │
        ▼
Repository Restructure
        │
        ▼
Microservices
        │
        ▼
Automated API Testing
        │
        ▼
Infrastructure Verification
        │
        ▼
Terraform (Planned)
        │
        ▼
AWS EKS (Planned)
```

---

# 📚 Key Learnings

Building CloudCart provides hands-on experience with:

* Docker image optimization
* Containerized application development
* Docker Compose
* Kubernetes deployments
* Kubernetes networking
* Kubernetes health probes
* Kubernetes resource management
* Helm templating
* GitHub Actions automation
* GitOps with ArgoCD
* Dynamic image versioning
* Prometheus and Grafana
* Horizontal Pod Autoscaling
* Automated API testing
* PostgreSQL integration
* Kubernetes troubleshooting
* Production-style debugging
* Git workflows and repository management

---

# 🚧 Roadmap

## Phase 1 — Platform Verification

* Validate Kubernetes manifests
* Validate Helm deployment
* Validate ArgoCD synchronization
* Validate NGINX Ingress
* Validate Prometheus and Grafana
* Validate HPA
* Perform end-to-end deployment testing

## Phase 2 — Showcase Mode

Add a dedicated CloudCart Showcase Mode that can be activated from the frontend using a keyboard shortcut.

The purpose of Showcase Mode is to demonstrate the engineering and DevOps architecture behind CloudCart rather than provide another marketplace experience.

Planned information includes:

* Platform architecture
* Microservices
* Kubernetes
* Docker
* Helm
* GitHub Actions
* ArgoCD
* GitOps workflow
* Monitoring
* Infrastructure overview
* Deployment flow

## Phase 3 — Infrastructure

* Terraform
* AWS VPC
* Amazon EKS
* Remote Terraform State
* Production-style AWS infrastructure

## Phase 4 — Security

* Trivy image scanning
* Kubernetes RBAC
* Network Policies
* Improved Secret Management
* Container security hardening

## Phase 5 — Advanced Observability

* Alertmanager
* Loki
* OpenTelemetry
* Distributed Tracing
* Application performance monitoring

---

# 💡 Engineering Principles

CloudCart is built around a few core engineering principles:

* Build production-style solutions instead of tutorial projects.
* Understand every technology before introducing it.
* Automate repetitive workflows.
* Treat Git as the single source of truth.
* Keep infrastructure reproducible.
* Learn by solving real operational problems.
* Prefer simplicity over unnecessary complexity.
* Add components only when they provide meaningful architectural value.

---

# 📄 License

This project is licensed under the MIT License.

---

> CloudCart Platform is an evolving DevOps engineering project focused on building a production-style cloud-native platform through incremental improvements. Each milestone introduces new tooling and operational practices while preserving a realistic engineering workflow.

````