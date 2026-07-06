# CloudCart Container Image Optimization Report

## Objective

The objective of this exercise was to identify the most efficient production-ready container images for the CloudCart platform by benchmarking multiple backend and frontend base images.

The evaluation focused on three primary metrics:

1. Build Time
2. Image Size (Disk Usage & Content Size)
3. Application Functionality

Every image was considered successful only if it satisfied all functional requirements.

### Backend Validation

- `/health`
- `/db-health`
- PostgreSQL Connectivity

### Frontend Validation

- React Application Startup
- Static Asset Delivery
- Browser Accessibility

---

# Backend Image Optimization

## Service

**Auth Service (FastAPI)**

---

## Benchmark Results

| Image | Build Time | Disk Usage | Content Size | Health Check | Database Check |
|--------|-----------:|-----------:|-------------:|--------------|----------------|
| python:3.12 | 04:31 Min | 1.67 GB | 427 MB | Passed | Passed |
| python:3.11-slim | 02:28 Min | 266 MB | 63.8 MB | Passed | Passed |
| python:3.12-slim | 27.8 Sec | 255 MB | 61.3 MB | Passed | Passed |
| python:3.12-alpine | 31.9 Sec | 153 MB | 36.7 MB | Passed | Passed |

---

## Optimization Journey

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
### Selected Image

**python:3.12-alpine**

### Reasons

- Smallest image size
- Latest Python runtime
- Reduced registry storage
- Faster image distribution
- Better Kubernetes deployment efficiency
- Full application compatibility

---

## Backend Optimization Result

### Before

| Metric | Value |
|---------|------|
| Base Image | python:3.12 |
| Disk Usage | 1.67 GB |
| Content Size | 427 MB |

### After

| Metric | Value |
|---------|------|
| Base Image | python:3.12-alpine |
| Disk Usage | 153 MB |
| Content Size | 36.7 MB |

### Improvement

- Disk Usage Reduced: ~90%
- Content Size Reduced: ~91%
- Functionality Preserved: 100%

---

# Frontend Image Optimization

## Service

**Frontend (React + Vite)**

---

## Benchmark Results

| Image | Build Time | Disk Usage | Content Size | Validation |
|--------|-----------:|-----------:|-------------:|-----------|
| node:20 | 02:41 Min | 1.8 GB | 467 MB | Passed |
| node:20-slim | 01:01 Min | 518 MB | 140 MB | Passed |
| node:22-slim | 58.7 Sec | 558 MB | 149 MB | Passed |
| node:22-alpine | 52.9 Sec | 461 MB | 126 MB | Passed |
| Multi-Stage (node:22-alpine + nginx:alpine) | 15 Sec | 93 MB | 26.1 MB | Passed |

---

## Optimization Journey

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

## Production Optimization

After selecting **node:22-alpine**, a production-grade multi-stage build was implemented.

### Build Stage

- node:22-alpine
- npm install
- npm run build

### Runtime Stage

- nginx:alpine
- Static assets only

---

## Validation

Successfully verified:

- Container startup
- Nginx serving application
- Browser accessibility
- Static asset delivery

---

## Benefits

- No Node.js runtime in production
- Smaller attack surface
- Faster startup
- Reduced image size
- Lower registry usage
- Improved Kubernetes deployment efficiency

---

## Final Frontend Decision

### Selected Runtime

**Multi-Stage Build (node:22-alpine + nginx:alpine)**

### Reasons

- Smallest image
- Production-ready architecture
- Static assets served by Nginx
- Faster startup
- Better scalability
- Improved security
- Lower storage consumption

---

## Frontend Optimization Result

### Before

| Metric | Value |
|---------|------|
| Base Image | node:20 |
| Disk Usage | 1.8 GB |
| Content Size | 467 MB |

### After

| Metric | Value |
|---------|------|
| Build Image | node:22-alpine |
| Runtime Image | nginx:alpine |
| Disk Usage | 93 MB |
| Content Size | 26.1 MB |

### Improvement

- Disk Usage Reduced: ~95%
- Content Size Reduced: ~94%
- Functionality Preserved: 100%

---

# Platform Validation

After image optimization, the complete platform was validated using Docker Compose.

## Services

- PostgreSQL
- Auth Service
- Frontend

---

## Validation Commands

```bash
docker compose up -d

curl http://localhost:8000/health
curl http://localhost:8000/db-health
curl http://localhost:5173
```

---

## Validation Results

| Component | Status |
|-----------|--------|
| PostgreSQL | Passed |
| Auth Service | Passed |
| Database Connectivity | Passed |
| Frontend | Passed |
| Docker Compose Deployment | Passed |

---

# Final Production Images

| Component | Production Image |
|-----------|------------------|
| Backend | python:3.12-alpine |
| Frontend Build | node:22-alpine |
| Frontend Runtime | nginx:alpine |

---

# Overall Outcome

| Component | Before | After | Improvement |
|-----------|--------|-------|------------:|
| Backend | 1.67 GB | 153 MB | ~90% |
| Frontend | 1.8 GB | 93 MB | ~95% |

---

# Key Achievements

- Optimized backend container by approximately **90%**
- Optimized frontend container by approximately **95%**
- Adopted lightweight Alpine-based production images
- Implemented a production-grade multi-stage frontend build
- Reduced registry storage requirements
- Improved image distribution speed
- Reduced deployment time
- Improved Kubernetes startup efficiency
- Reduced attack surface
- Preserved full application functionality
- Successfully validated using Docker Compose

---

# Conclusion

CloudCart was optimized using production-ready containerization practices. Multiple base images were benchmarked for both backend and frontend services before selecting the final production images.

The backend uses **python:3.12-alpine**, while the frontend follows a **multi-stage build strategy using node:22-alpine and nginx:alpine**. These optimizations significantly reduced image size, improved deployment efficiency, minimized registry storage, and maintained full application functionality, resulting in a lightweight, scalable, and Kubernetes-ready container architecture.