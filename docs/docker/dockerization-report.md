# CloudCart Container Image Optimization

## Objective

The goal of this optimization exercise was to identify the most efficient container images for the CloudCart platform by benchmarking multiple backend and frontend container base images.

The evaluation focused on three key metrics:

1. Build Time
2. Image Size (Disk Usage & Content Size)
3. Application Functionality

An image was considered successful only if:

* The container started successfully.
* Application health checks passed.
* Database connectivity worked correctly (Backend).
* Frontend application launched successfully.

---

# Backend Container Optimization

## Backend Service

**Service:** Auth Service (FastAPI)

### Validation Endpoints

* `/health`
* `/db-health`

---

## Backend Benchmark Results

| Image              | Build Time | Disk Usage | Content Size | Health Check | Database Check |
| ------------------ | ---------- | ---------- | ------------ | ------------ | -------------- |
| python:3.12        | 04:31 Min  | 1.67 GB    | 427 MB       | Passed       | Passed         |
| python:3.11-slim   | 02:28 Min  | 266 MB     | 63.8 MB      | Passed       | Passed         |
| python:3.12-slim   | 27.8 Sec   | 255 MB     | 61.3 MB      | Passed       | Passed         |
| python:3.12-alpine | 31.9 Sec   | 153 MB     | 36.7 MB      | Passed       | Passed         |

---

## Backend Optimization Journey

```text
python:3.12
      ↓
python:3.11-slim
      ↓
python:3.12-slim
      ↓
python:3.12-alpine
```

---

## Backend Analysis

### python:3.12 (Baseline)

The initial implementation used the standard Python 3.12 image.

Observations:

* Very large image footprint
* Long build duration
* Increased storage consumption
* Higher deployment transfer cost

---

### python:3.11-slim

The slim image significantly reduced image size while maintaining application compatibility.

Improvements:

* ~84% reduction in disk usage
* Faster build process
* Successful application startup
* Successful PostgreSQL connectivity

---

### python:3.12-slim

This image provided the latest Python runtime while maintaining a compact footprint.

Improvements:

* Smaller image than python:3.11-slim
* Faster build process
* Latest Python runtime
* Successful health validation
* Successful PostgreSQL connectivity

---

### python:3.12-alpine

The Alpine image delivered the smallest image footprint among all tested backend images.

Improvements:

* Smallest disk usage
* Smallest content size
* Successful application startup
* Successful database connectivity
* Latest Python runtime

---

## Backend Final Decision

### Selected Image

**python:3.12-alpine**

### Reasons

* Smallest image footprint
* Latest Python runtime
* Successful health checks
* Successful database connectivity
* Lower storage consumption
* Reduced registry usage
* Faster image distribution
* Better Kubernetes deployment efficiency

---

## Backend Optimization Outcome

### Before Optimization

| Metric       | Value       |
| ------------ | ----------- |
| Base Image   | python:3.12 |
| Disk Usage   | 1.67 GB     |
| Content Size | 427 MB      |

### After Optimization

| Metric       | Value              |
| ------------ | ------------------ |
| Base Image   | python:3.12-alpine |
| Disk Usage   | 153 MB             |
| Content Size | 36.7 MB            |

### Improvement

* Disk Usage Reduced: ~90%
* Content Size Reduced: ~91%
* Application Functionality Maintained: 100%
* Database Connectivity Maintained: 100%

---

# Frontend Container Optimization

## Frontend Service

**Framework:** React + Vite

---

## Frontend Benchmark Results

| Image               | Build Time | Disk Usage | Content Size | Validation |
| ------------------- | ---------- | ---------- | ------------ | ---------- |
| node:20             | 02:41 Min  | 1.8 GB     | 467 MB       | Passed     |
| node:20-slim        | 01:01 Min  | 518 MB     | 140 MB       | Passed     |
| node:22-slim        | 58.7 Sec   | 558 MB     | 149 MB       | Passed     |
| node:22-alpine      | 52.9 Sec   | 461 MB     | 126 MB       | Passed     |
| Multi-Stage + Nginx | 15 Sec     | 93 MB      | 26.1 MB      | Passed     |

---

## Frontend Optimization Journey

```text
node:20
      ↓
node:20-slim
      ↓
node:22-slim
      ↓
node:22-alpine
      ↓
Multi-Stage Build + Nginx
```

---

## Frontend Analysis

### node:20 (Baseline)

The initial frontend image used the standard Node 20 image.

Observations:

* Very large image size
* Highest storage consumption
* Longest build time
* Suitable for development but inefficient for containerized deployments

---

### node:20-slim

The slim image significantly reduced image size while maintaining compatibility.

Improvements:

* Major reduction in disk usage
* Reduced content size
* Successful container startup

---

### node:22-slim

The latest Node runtime was evaluated using the slim variant.

Improvements:

* Latest Node.js runtime
* Successful startup validation
* Comparable build performance

---

### node:22-alpine

The Alpine variant delivered the smallest frontend image among single-stage builds.

Improvements:

* Smallest disk usage among Node runtime images
* Smallest content size among Node runtime images
* Fastest build among tested Node images
* Successful startup validation

---

## Frontend Production Optimization (Multi-Stage Build)

After selecting node:22-alpine as the best Node runtime image, an additional optimization phase was performed using a multi-stage Docker build.

The React application was compiled during the build stage using Node.js and the generated static assets were served using Nginx.

### Build Stage

* node:22-alpine
* npm install
* npm run build

### Runtime Stage

* nginx:alpine
* Only compiled static assets copied into runtime image

### Validation

* Container startup successful
* Nginx served application correctly
* Frontend accessible successfully
* Static assets loaded successfully

### Benefits

* No Node.js runtime required in production
* Smaller attack surface
* Faster startup time
* Reduced image size
* Lower registry storage consumption
* Better Kubernetes deployment efficiency

---

## Frontend Final Decision

### Selected Image

**Multi-Stage Build (node:22-alpine + nginx:alpine)**

### Reasons

* Smallest image footprint
* Production-grade deployment architecture
* Static assets served by Nginx
* Reduced attack surface
* Faster startup time
* Lower registry storage usage
* Better Kubernetes deployment efficiency
* Improved scalability
* Successful validation testing

---

## Frontend Optimization Outcome

### Before Optimization

| Metric       | Value   |
| ------------ | ------- |
| Base Image   | node:20 |
| Disk Usage   | 1.8 GB  |
| Content Size | 467 MB  |

### After Optimization

| Metric        | Value          |
| ------------- | -------------- |
| Build Image   | node:22-alpine |
| Runtime Image | nginx:alpine   |
| Disk Usage    | 93 MB          |
| Content Size  | 26.1 MB        |

### Improvement

* Disk Usage Reduced: ~95%
* Content Size Reduced: ~94%
* Frontend Functionality Maintained: 100%
* Container Startup Validation: 100%
* Static Asset Delivery Validated: 100%

---

# Docker Compose Validation

After optimization, the complete CloudCart platform was validated using Docker Compose.

### Services Validated

* PostgreSQL Database
* Auth Service (FastAPI)
* Frontend Service (React + Nginx)

### Validation Commands

```bash
docker compose up -d

curl http://localhost:8000/health
curl http://localhost:8000/db-health
curl http://localhost:5173
```

### Results

| Service                            | Validation |
| ---------------------------------- | ---------- |
| PostgreSQL                         | Passed     |
| Auth Service Health Check          | Passed     |
| Auth Service Database Connectivity | Passed     |
| Frontend Accessibility             | Passed     |
| Docker Compose Deployment          | Passed     |

---

# Overall Platform Result

## Backend Winner

**python:3.12-alpine**

* Disk Usage: 153 MB
* Content Size: 36.7 MB

---

## Frontend Winner

**Multi-Stage Build (node:22-alpine + nginx:alpine)**

* Disk Usage: 93 MB
* Content Size: 26.1 MB

---

# Conclusion

A complete container image optimization exercise was performed across both backend and frontend services.

Backend services were optimized using lightweight Alpine-based Python images while maintaining full application functionality and database connectivity.

Frontend services were optimized using a production-grade multi-stage build strategy where Node.js was used only during the build phase and Nginx was used as the runtime image for serving static assets.

Final Production Images:

* Backend: python:3.12-alpine
* Frontend Build Stage: node:22-alpine
* Frontend Runtime Stage: nginx:alpine

Key Achievements:

* Backend image reduced from 1.67 GB to 153 MB
* Frontend image reduced from 1.8 GB to 93 MB
* Registry storage significantly reduced
* Faster image distribution
* Faster Kubernetes deployments
* Smaller attack surface
* Production-ready container architecture

All application functionality, health checks, database connectivity, frontend accessibility, and Docker Compose validations were successfully completed.
