# Backend Container Image Optimization

## Objective

The goal of this optimization exercise was to identify the most efficient container image for the CloudCart Auth Service by benchmarking multiple Python base images. The evaluation focused on three key metrics:

1. Image Size (Disk Usage & Content Size)
2. Build Time
3. Application Functionality

Each image was built, deployed, and validated against the following endpoints:

* `/health`
* `/db-health`

An image was considered successful only if the application started correctly and established a successful connection with PostgreSQL.

---

## Benchmark Results

| Image              | Build Time | Disk Usage | Content Size | Health Check | Database Check |
| ------------------ | ----------   | ---------- | ------------ | ------------ | -------------- |
| python:3.12        | 04:31 Min    | 1.67 GB    | 427 MB       | Passed       | Passed         |
| python:3.11-slim   | 02:28 Min    | 266 MB     | 63.8 MB      | Passed       | Passed         |
| python:3.12-slim   | 00:27.8 Sec  | 255 MB     | 61.3 MB      | Passed       | Passed         |
| python:3.12-alpine | 00:31 Sec    | 153 MB     | 36.7 MB      | Passed       | Passed         |

---

## Analysis

### python:3.12 (Baseline)

The initial implementation used the standard Python 3.12 image. While the application functioned correctly, the image size was significantly larger than required.

Observations:

* Large image footprint (1.67 GB)
* Longer build time
* Increased storage consumption
* Higher network transfer cost during deployments

---

### python:3.11-slim

The slim variant reduced the image size dramatically while maintaining full application compatibility.

Improvements:

* Approximately 84% reduction in image size
* Faster build time
* Successful application startup
* Successful database connectivity

---

### python:3.12-slim

The Python 3.12 slim image provided additional improvements while keeping the latest Python runtime.

Improvements:

* Smaller image than python:3.11-slim
* Faster build process
* Latest Python version
* Fully functional application and database connectivity

---

### python:3.12-alpine

The Alpine-based image delivered the best storage efficiency among all tested images.

Improvements:

* Smallest image size (153 MB)
* Approximately 90% reduction compared to the baseline image
* Successful application startup
* Successful PostgreSQL connectivity
* Latest Python runtime

---

## Final Decision

After evaluating all images against build time, image size, and application functionality, the selected image for the CloudCart Auth Service is:

**python:3.12-alpine**

### Reasons for Selection

* Smallest image footprint
* Latest Python version
* Successful health checks
* Successful database connectivity tests
* Reduced storage requirements
* Reduced container registry usage
* Faster image transfer during deployments
* Improved Kubernetes pod startup efficiency

---

## Optimization Outcome

### Before Optimization

* Base Image: python:3.12
* Disk Usage: 1.67 GB
* Content Size: 427 MB

### After Optimization

* Base Image: python:3.12-alpine
* Disk Usage: 153 MB
* Content Size: 36.7 MB

### Overall Improvement

* Disk Usage Reduced: ~90%
* Content Size Reduced: ~91%
* Application Functionality Maintained: 100%
* Database Connectivity Maintained: 100%

The optimization successfully reduced the backend container image size while preserving full application functionality and database connectivity.
