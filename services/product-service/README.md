# CloudCart Product Service

The Product Service is responsible for managing the product catalog within the CloudCart Platform. It provides REST APIs to create, retrieve, update, and delete products while persisting data in PostgreSQL.

## Features

- Product CRUD APIs
- FastAPI REST service
- SQLAlchemy ORM
- Shared PostgreSQL database
- Prometheus metrics (`/metrics`)
- Health endpoints
- OpenAPI (Swagger) documentation

## API Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/products` | Create a product |
| GET | `/products` | List all products |
| GET | `/products/{product_id}` | Get product by ID |
| PUT | `/products/{product_id}` | Update a product |
| DELETE | `/products/{product_id}` | Delete a product |
| GET | `/health` | Service health check |
| GET | `/db-health` | Database connectivity check |
| GET | `/metrics` | Prometheus metrics |

## Technology Stack

- Python 3.12
- FastAPI
- SQLAlchemy
- PostgreSQL
- Uvicorn
- Prometheus FastAPI Instrumentator
- Docker

## Running Locally

```bash
docker compose up -d
```

Swagger UI:

```
http://localhost:8001/docs
```

Health Check:

```
http://localhost:8001/health
```

Database Health:

```
http://localhost:8001/db-health
```

## Project Structure

```
product-service/
├── app/
│   ├── api/
│   ├── core/
│   ├── models/
│   ├── schemas/
│   ├── services/
│   └── main.py
├── tests/
├── Dockerfile
├── requirements.txt
└── README.md
```

## Current Status

**Status:** ✅ Version 1 Complete

Implemented:

- Product CRUD API
- Dockerized service
- PostgreSQL integration
- Health endpoints
- Prometheus metrics
- Swagger documentation

Planned Enhancements:

- Product search and filtering
- Pagination
- Image upload support
- Authentication & authorization
- Service-to-service authentication
- Unit and integration tests
- Kubernetes & Helm deployment
