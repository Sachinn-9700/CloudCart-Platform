#!/bin/bash

set -u

NAMESPACE="cloudcart"
SERVICE="product-service"
LOCAL_PORT="8001"

echo "=========================================="
echo " CloudCart - Product API Schema Check"
echo "=========================================="

cleanup() {
    if [ -n "${PF_PID:-}" ]; then
        kill "$PF_PID" 2>/dev/null
    fi
}
trap cleanup EXIT

echo
echo ">>> 1. Starting Product Service port-forward"

kubectl port-forward \
    -n "$NAMESPACE" \
    svc/$SERVICE \
    $LOCAL_PORT:8000 \
    >/tmp/product-port-forward.log 2>&1 &

PF_PID=$!

echo "Waiting for Product Service..."

for i in {1..15}; do
    if curl -s -o /dev/null \
        http://127.0.0.1:$LOCAL_PORT/health; then
        echo "PASS: Product Service reachable"
        break
    fi

    sleep 1
done

echo
echo ">>> 2. Health Check"

curl -s \
    http://127.0.0.1:$LOCAL_PORT/health

echo

echo
echo ">>> 3. Database Health Check"

DB_STATUS=$(curl -s \
    -o /tmp/product-db-health.json \
    -w "%{http_code}" \
    http://127.0.0.1:$LOCAL_PORT/db-health)

echo "HTTP Status: $DB_STATUS"

cat /tmp/product-db-health.json

echo

echo
echo ">>> 4. Downloading OpenAPI specification"

OPENAPI_STATUS=$(curl -s \
    -o /tmp/product-openapi.json \
    -w "%{http_code}" \
    http://127.0.0.1:$LOCAL_PORT/openapi.json)

if [ "$OPENAPI_STATUS" != "200" ]; then
    echo "FAIL: Could not retrieve OpenAPI"
    exit 1
fi

echo "PASS: OpenAPI available"

echo
echo ">>> 5. Product API Request/Response Schema"
echo "------------------------------------------"

python3 - <<'PY'
import json

with open("/tmp/product-openapi.json") as f:
    data = json.load(f)

path = data["paths"].get("/products")

if not path:
    print("ERROR: /products endpoint not found")
    exit(1)

for method, details in path.items():

    if method.lower() not in ["get", "post"]:
        continue

    print()
    print("=" * 50)
    print(method.upper(), "/products")
    print("=" * 50)

    print("Summary:")
    print(details.get("summary", ""))

    print("\nDescription:")
    print(details.get("description", ""))

    print("\nParameters:")
    for param in details.get("parameters", []):
        print(
            f"- {param.get('name')} "
            f"({param.get('in')}) "
            f"required={param.get('required')}"
        )

    print("\nRequest Body:")
    body = details.get("requestBody")

    if body:
        print(json.dumps(body, indent=2))
    else:
        print("None")

    print("\nResponses:")
    for code, response in details.get("responses", {}).items():
        print(f"\nHTTP {code}:")
        print(response.get("description", ""))

        content = response.get("content", {})

        for content_type, schema_info in content.items():
            print(f"Content-Type: {content_type}")
            print(json.dumps(schema_info, indent=2))

print()
print("=" * 50)
print("Referenced Schemas")
print("=" * 50)

schemas = data.get("components", {}).get("schemas", {})

for name, schema in schemas.items():
    print()
    print(f"### {name}")
    print(json.dumps(schema, indent=2))
PY

echo
echo "=========================================="
echo " Schema discovery complete"
echo "=========================================="

echo
echo "No product was created, modified or deleted."
echo "The next test will use the exact API schema above."
