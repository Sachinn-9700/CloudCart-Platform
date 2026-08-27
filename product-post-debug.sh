#!/bin/bash

set -u

NAMESPACE="cloudcart"
SERVICE="product-service"
LOCAL_PORT="8001"

echo "=========================================="
echo " CloudCart - Product POST Debug"
echo "=========================================="

cleanup() {
    echo
    echo ">>> Cleaning up port-forward"
    if [ -n "${PF_PID:-}" ] && kill -0 "$PF_PID" 2>/dev/null; then
        kill "$PF_PID" 2>/dev/null
        wait "$PF_PID" 2>/dev/null
    fi
}
trap cleanup EXIT

echo
echo ">>> 1. Product Service"
kubectl get svc "$SERVICE" -n "$NAMESPACE"

echo
echo ">>> 2. Product Service Pod"
kubectl get pods -n "$NAMESPACE" -l app="$SERVICE" -o wide

POD=$(kubectl get pods -n "$NAMESPACE" -l app="$SERVICE" \
    -o jsonpath='{.items[0].metadata.name}')

if [ -z "$POD" ]; then
    echo "FAIL: Product Service pod not found"
    exit 1
fi

echo
echo "Using Pod: $POD"

echo
echo ">>> 3. Starting port-forward"
kubectl port-forward -n "$NAMESPACE" \
    svc/"$SERVICE" "$LOCAL_PORT":8000 >/tmp/product-post-pf.log 2>&1 &

PF_PID=$!

echo "Waiting for Product Service..."

for i in {1..20}; do
    if curl -s --max-time 2 \
        "http://127.0.0.1:$LOCAL_PORT/health" >/dev/null 2>&1; then
        echo "PASS: Product Service reachable"
        break
    fi
    sleep 1
done

if ! curl -s --max-time 2 \
    "http://127.0.0.1:$LOCAL_PORT/health" >/dev/null 2>&1; then

    echo "FAIL: Product Service not reachable"

    echo
    echo "Port-forward log:"
    cat /tmp/product-post-pf.log

    exit 1
fi

echo
echo ">>> 4. Product Service Health"
curl -s "http://127.0.0.1:$LOCAL_PORT/health"
echo

echo
echo ">>> 5. Database Health"
curl -s "http://127.0.0.1:$LOCAL_PORT/db-health"
echo

echo
echo ">>> 6. Creating Test Product"

TEST_PRODUCT='{
  "slug": "debug-bmw-m3-test",
  "type": "car",
  "brand": "BMW",
  "model": "M3",
  "variant": "Competition",
  "year": 2024,
  "mileage": 5000,
  "imported_from": "Germany",
  "engine": "3.0L Twin Turbo",
  "horsepower": 503,
  "drivetrain": "AWD",
  "transmission": "Automatic",
  "fuel_type": "Petrol",
  "exterior_color": "Black",
  "interior_color": "Black",
  "owners": 1,
  "original_price": 9500000,
  "current_price": 8500000,
  "savings": 1000000,
  "certified": true,
  "featured": false,
  "collector_edition": false,
  "arrival": "Available",
  "tagline": "Debug test product",
  "description": "Temporary product used for API debugging",
  "image_url": null,
  "ownership_story": null,
  "collector_notes": null,
  "inspection": "Passed",
  "delivery": "Available",
  "recommended_for": "Performance enthusiasts"
}'

RESPONSE_FILE="/tmp/product-post-response.json"

HTTP_CODE=$(curl -s \
    -o "$RESPONSE_FILE" \
    -w "%{http_code}" \
    -X POST \
    "http://127.0.0.1:$LOCAL_PORT/products" \
    -H "Content-Type: application/json" \
    -d "$TEST_PRODUCT")

echo
echo "HTTP Status: $HTTP_CODE"

echo
echo "Response:"
cat "$RESPONSE_FILE"
echo

echo
echo ">>> 7. Product Service Logs After POST"
echo "------------------------------------------"

kubectl logs "$POD" -n "$NAMESPACE" --since=2m

echo
echo ">>> 8. Previous Container Logs"
echo "------------------------------------------"

kubectl logs "$POD" -n "$NAMESPACE" --previous --tail=100 2>/dev/null || \
    echo "No previous container logs available."

echo
echo ">>> 9. Product Service Events"
echo "------------------------------------------"

kubectl describe pod "$POD" -n "$NAMESPACE" | \
    sed -n '/Events:/,$p'

echo
echo "=========================================="

if [ "$HTTP_CODE" = "201" ]; then
    echo " POST /products PASSED"
else
    echo " POST /products FAILED"
    echo
    echo "The important information is the traceback"
    echo "shown in the Product Service logs above."
fi

echo "=========================================="
