#!/bin/bash

set -u

NAMESPACE="cloudcart"
SERVICE="product-service"
LOCAL_PORT="8001"

echo "=========================================="
echo " CloudCart - Product API Functional Test"
echo "=========================================="

cleanup() {
    if [ -n "${PF_PID:-}" ]; then
        kill "$PF_PID" 2>/dev/null
    fi
}
trap cleanup EXIT

echo
echo ">>> 1. Checking Product Service"
kubectl get svc "$SERVICE" -n "$NAMESPACE"

echo
echo ">>> 2. Starting temporary port-forward"
kubectl port-forward -n "$NAMESPACE" svc/$SERVICE $LOCAL_PORT:8000 >/tmp/product-port-forward.log 2>&1 &
PF_PID=$!

sleep 3

if ! kill -0 "$PF_PID" 2>/dev/null; then
    echo "ERROR: Port-forward failed"
    cat /tmp/product-port-forward.log
    exit 1
fi

echo "Port-forward active: localhost:$LOCAL_PORT"

echo
echo ">>> 3. Testing /health"

HEALTH=$(curl -s -o /tmp/product-health.json \
    -w "%{http_code}" \
    http://127.0.0.1:$LOCAL_PORT/health)

echo "HTTP Status: $HEALTH"

if [ "$HEALTH" = "200" ]; then
    echo "PASS: Product Service health endpoint"
    cat /tmp/product-health.json
else
    echo "FAIL: Product Service health endpoint"
    cat /tmp/product-health.json
    exit 1
fi

echo
echo ">>> 4. Checking OpenAPI specification"

OPENAPI_STATUS=$(curl -s -o /tmp/product-openapi.json \
    -w "%{http_code}" \
    http://127.0.0.1:$LOCAL_PORT/openapi.json)

if [ "$OPENAPI_STATUS" = "200" ]; then
    echo "PASS: OpenAPI available"
else
    echo "WARNING: OpenAPI endpoint unavailable"
    echo "HTTP Status: $OPENAPI_STATUS"
    exit 0
fi

echo
echo ">>> 5. Product API endpoints"
echo "------------------------------------------"

python3 - <<'PY'
import json

with open("/tmp/product-openapi.json") as f:
    data = json.load(f)

paths = data.get("paths", {})

if not paths:
    print("No API paths found.")
else:
    for path, methods in paths.items():
        for method, details in methods.items():
            if method.lower() in [
                "get", "post", "put", "patch", "delete"
            ]:
                summary = details.get("summary", "")
                print(f"{method.upper():7} {path}  {summary}")
PY

echo
echo "=========================================="
echo " API endpoint discovery complete"
echo "=========================================="

echo
echo "The script did NOT create/delete/update any product."
echo "Next we will use the discovered GET endpoint"
echo "to perform the real Product functional test."
