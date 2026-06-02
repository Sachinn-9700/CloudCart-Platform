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

| Image          | Build Time | Disk Usage | Content Size | Container Startup |
| -------------- | ---------- | ---------- | ------------ | ----------------- |
| node:20        | 02:41 Min  | 1.8 GB     | 467 MB       | Passed            |
| node:20-slim   | 01:01 Min  | 518 MB     | 140 MB       | Passed            |
| node:22-slim   | 58.7 Sec   | 558 MB     | 149 MB       | Passed            |
| node:22-alpine | 52.9 Sec   | 461 MB     | 126 MB       | Passed            |

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

The Alpine variant delivered the smallest frontend image.

Improvements:

* Smallest disk usage
* Smallest content size
* Fastest build among tested frontend images
* Successful startup validation

---

## Frontend Final Decision

### Selected Image

**node:22-alpine**

### Reasons

* Smallest image footprint
* Latest Node.js runtime
* Fastest build performance
* Successful startup validation
* Reduced storage requirements
* Reduced registry transfer cost
* Better Kubernetes deployment efficiency

---

## Frontend Optimization Outcome

### Before Optimization

| Metric       | Value   |
| ------------ | ------- |
| Base Image   | node:20 |
| Disk Usage   | 1.8 GB  |
| Content Size | 467 MB  |

### After Optimization

| Metric       | Value          |
| ------------ | -------------- |
| Base Image   | node:22-alpine |
| Disk Usage   | 461 MB         |
| Content Size | 126 MB         |

### Improvement

* Disk Usage Reduced: ~74%
* Content Size Reduced: ~73%
* Frontend Functionality Maintained: 100%
* Container Startup Validation: 100%

---

# Overall Platform Result

## Backend

**Winner:** python:3.12-alpine

* Disk Usage: 153 MB
* Content Size: 36.7 MB

## Frontend

**Winner:** node:22-alpine

* Disk Usage: 461 MB
* Content Size: 126 MB

---

## Conclusion

A complete container image optimization exercise was performed across both backend and frontend services.

The platform successfully migrated from large default runtime images to lightweight Alpine-based images while preserving application functionality and service reliability.

Final selected production images:

* Backend: python:3.12-alpine
* Frontend: node:22-alpine

The optimization significantly reduced image sizes, registry storage requirements, deployment transfer times, and overall Kubernetes deployment overhead while maintaining full application functionality.
