# Useful Loki Queries

## Auth Service Logs

```logql
{namespace="cloudcart"} |= "auth-service"
```

---

## Frontend Logs

```logql
{namespace="cloudcart"} |= "frontend"
```

---

## Errors

```logql
{namespace="cloudcart"} |= "ERROR"
```

---

## Exceptions

```logql
{namespace="cloudcart"} |= "Exception"
```

---

## Warnings

```logql
{namespace="cloudcart"} |= "WARNING"
```

---

## PostgreSQL Logs

```logql
{namespace="cloudcart"} |= "postgres"
```

---

## Failed Requests

```logql
{namespace="cloudcart"} |= "401"
```

---

## Internal Server Errors

```logql
{namespace="cloudcart"} |= "500"
```

---

## Last 100 Log Lines

```logql
{namespace="cloudcart"}
```

Limit results to the latest 100 entries in Grafana Explore.
