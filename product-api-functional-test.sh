#!/bin/bash

set -u

NAMESPACE="cloudcart"
SERVICE="product-service"
LOCAL_PORT="8001"
BASE_URL="http://127.0.0.1:${LOCAL_PORT}"

PRODUCT_ID=""
PF_PID=""

PASS_COUNT=0
FAIL_COUNT=0

echo "=========================================="
echo " CloudCart - Product API Functional Test"
echo "=========================================="

# --------------------------------------------------
# Cleanup
# --------------------------------------------------

cleanup() {
    echo
    echo ">>> Cleaning up port-forward"

    if [ -n "${PF_PID}" ]; then
        kill "${PF_PID}" 2>/dev/null
    fi
}

trap cleanup EXIT

# --------------------------------------------------
# Helper functions
# --------------------------------------------------

pass() {
    echo "PASS: $1"
    PASS_COUNT=$((PASS_COUNT + 1))
}

fail() {
    echo "FAIL: $1"
    FAIL_COUNT=$((FAIL_COUNT + 1))
}

# --------------------------------------------------
# 1. Verify Product Service
# --------------------------------------------------

echo
echo ">>> 1. Checking Product Service"

kubectl get svc "$SERVICE" -n "$NAMESPACE"

if [ $? -ne 0 ]; then
    echo "Product Service not found."
    exit 1
fi

# --------------------------------------------------
# 2. Start port-forward
# --------------------------------------------------

echo
echo ">>> 2. Starting temporary port-forward"

kubectl port-forward \
    -n "$NAMESPACE" \
    svc/"$SERVICE" \
    "${LOCAL_PORT}:8000" \
    >/tmp/product-api-port-forward.log 2>&1 &

PF_PID=$!

echo "Waiting for Product Service..."

READY=0

for i in {1..20}; do

    HTTP_CODE=$(curl -s \
        -o /dev/null \
        -w "%{http_code}" \
        "${BASE_URL}/health")

    if [ "$HTTP_CODE" = "200" ]; then
        READY=1
        break
    fi

    sleep 1

done

if [ "$READY" -ne 1 ]; then

    echo "FAIL: Product Service did not become reachable."

    echo
    echo "Port-forward log:"
    cat /tmp/product-api-port-forward.log

    exit 1
fi

pass "Product Service reachable"

# --------------------------------------------------
# 3. Health check
# --------------------------------------------------

echo
echo ">>> 3. Testing /health"

HEALTH_RESPONSE=$(curl -s \
    -w "\n%{http_code}" \
    "${BASE_URL}/health")

HEALTH_BODY=$(echo "$HEALTH_RESPONSE" | sed '$d')
HEALTH_CODE=$(echo "$HEALTH_RESPONSE" | tail -n1)

echo "HTTP Status: $HEALTH_CODE"
echo "$HEALTH_BODY"

if [ "$HEALTH_CODE" = "200" ]; then
    pass "/health"
else
    fail "/health"
fi

# --------------------------------------------------
# 4. Database health
# --------------------------------------------------

echo
echo ">>> 4. Testing /db-health"

DB_RESPONSE=$(curl -s \
    -w "\n%{http_code}" \
    "${BASE_URL}/db-health")

DB_BODY=$(echo "$DB_RESPONSE" | sed '$d')
DB_CODE=$(echo "$DB_RESPONSE" | tail -n1)

echo "HTTP Status: $DB_CODE"
echo "$DB_BODY"

if [ "$DB_CODE" = "200" ]; then
    pass "Database connection"
else
    fail "Database connection"
fi

# --------------------------------------------------
# 5. OpenAPI
# --------------------------------------------------

echo
echo ">>> 5. Testing OpenAPI"

OPENAPI_CODE=$(curl -s \
    -o /tmp/product-openapi-functional.json \
    -w "%{http_code}" \
    "${BASE_URL}/openapi.json")

if [ "$OPENAPI_CODE" = "200" ]; then
    pass "OpenAPI available"
else
    fail "OpenAPI available"
    exit 1
fi

# --------------------------------------------------
# 6. Create temporary product
# --------------------------------------------------

echo
echo ">>> 6. POST /products - Create Test Product"

TIMESTAMP=$(date +%s)

SLUG="cloudcart-functional-test-${TIMESTAMP}"

PRODUCT_JSON=$(cat <<EOF
{
  "slug": "${SLUG}",
  "type": "car",
  "brand": "BMW",
  "model": "M3",
  "variant": "Competition",
  "year": 2024,
  "mileage": 12000,
  "imported_from": "Germany",
  "engine": "3.0L Twin Turbo",
  "horsepower": 503,
  "drivetrain": "AWD",
  "transmission": "Automatic",
  "fuel_type": "Petrol",
  "exterior_color": "Black",
  "interior_color": "Red",
  "owners": 1,
  "original_price": 9000000,
  "current_price": 8500000,
  "savings": 500000,
  "certified": true,
  "featured": false,
  "collector_edition": false,
  "arrival": "2026-08",
  "tagline": "CloudCart functional test product",
  "description": "Temporary product created by automated functional testing.",
  "image_url": null,
  "ownership_story": "Test data",
  "collector_notes": null,
  "inspection": "Passed",
  "delivery": "Available",
  "recommended_for": "Functional testing"
}
EOF
)

CREATE_RESPONSE=$(curl -s \
    -w "\n%{http_code}" \
    -X POST \
    "${BASE_URL}/products" \
    -H "Content-Type: application/json" \
    -d "$PRODUCT_JSON")

CREATE_BODY=$(echo "$CREATE_RESPONSE" | sed '$d')
CREATE_CODE=$(echo "$CREATE_RESPONSE" | tail -n1)

echo "HTTP Status: $CREATE_CODE"
echo "$CREATE_BODY"

if [ "$CREATE_CODE" != "201" ]; then
    fail "Create Product"
    echo
    echo "Product creation failed. Stopping test."
    exit 1
fi

PRODUCT_ID=$(echo "$CREATE_BODY" | python3 -c '
import sys,json
data=json.load(sys.stdin)
print(data.get("id",""))
')

if [ -z "$PRODUCT_ID" ]; then
    fail "Capture Product ID"
    echo "Could not extract product ID."
    exit 1
fi

pass "Create Product"
pass "Captured Product ID: ${PRODUCT_ID}"

# --------------------------------------------------
# 7. GET all products
# --------------------------------------------------

echo
echo ">>> 7. GET /products - List Products"

LIST_RESPONSE=$(curl -s \
    -w "\n%{http_code}" \
    "${BASE_URL}/products")

LIST_BODY=$(echo "$LIST_RESPONSE" | sed '$d')
LIST_CODE=$(echo "$LIST_RESPONSE" | tail -n1)

echo "HTTP Status: $LIST_CODE"

if [ "$LIST_CODE" = "200" ]; then

    FOUND=$(echo "$LIST_BODY" | python3 -c "
import sys,json
data=json.load(sys.stdin)
print(any(str(p.get('id')) == '${PRODUCT_ID}' for p in data))
")

    if [ "$FOUND" = "True" ]; then
        pass "Product appears in product list"
    else
        fail "Product appears in product list"
    fi

else
    fail "GET /products"
fi

# --------------------------------------------------
# 8. GET specific product
# --------------------------------------------------

echo
echo ">>> 8. GET /products/${PRODUCT_ID}"

GET_RESPONSE=$(curl -s \
    -w "\n%{http_code}" \
    "${BASE_URL}/products/${PRODUCT_ID}")

GET_BODY=$(echo "$GET_RESPONSE" | sed '$d')
GET_CODE=$(echo "$GET_RESPONSE" | tail -n1)

echo "HTTP Status: $GET_CODE"
echo "$GET_BODY"

if [ "$GET_CODE" = "200" ]; then

    GET_SLUG=$(echo "$GET_BODY" | python3 -c '
import sys,json
print(json.load(sys.stdin).get("slug",""))
')

    if [ "$GET_SLUG" = "$SLUG" ]; then
        pass "GET specific Product"
    else
        fail "GET specific Product - slug mismatch"
    fi

else
    fail "GET specific Product"
fi

# --------------------------------------------------
# 9. Update product
# --------------------------------------------------

echo
echo ">>> 9. PUT /products/${PRODUCT_ID} - Update Product"

UPDATE_JSON=$(cat <<EOF
{
  "slug": "${SLUG}-updated",
  "type": "car",
  "brand": "BMW",
  "model": "M3",
  "variant": "Competition Updated",
  "year": 2024,
  "mileage": 12500,
  "imported_from": "Germany",
  "engine": "3.0L Twin Turbo",
  "horsepower": 503,
  "drivetrain": "AWD",
  "transmission": "Automatic",
  "fuel_type": "Petrol",
  "exterior_color": "Black",
  "interior_color": "Red",
  "owners": 1,
  "original_price": 9000000,
  "current_price": 8400000,
  "savings": 600000,
  "certified": true,
  "featured": true,
  "collector_edition": false,
  "arrival": "2026-08",
  "tagline": "Updated CloudCart functional test product",
  "description": "Updated temporary product.",
  "image_url": null,
  "ownership_story": "Updated test data",
  "collector_notes": null,
  "inspection": "Passed",
  "delivery": "Available",
  "recommended_for": "Functional testing"
}
EOF
)

UPDATE_RESPONSE=$(curl -s \
    -w "\n%{http_code}" \
    -X PUT \
    "${BASE_URL}/products/${PRODUCT_ID}" \
    -H "Content-Type: application/json" \
    -d "$UPDATE_JSON")

UPDATE_BODY=$(echo "$UPDATE_RESPONSE" | sed '$d')
UPDATE_CODE=$(echo "$UPDATE_RESPONSE" | tail -n1)

echo "HTTP Status: $UPDATE_CODE"
echo "$UPDATE_BODY"

if [ "$UPDATE_CODE" = "200" ]; then
    pass "Update Product"
else
    fail "Update Product"
fi

# --------------------------------------------------
# 10. Verify update
# --------------------------------------------------

echo
echo ">>> 10. GET /products/${PRODUCT_ID} - Verify Update"

VERIFY_RESPONSE=$(curl -s \
    -w "\n%{http_code}" \
    "${BASE_URL}/products/${PRODUCT_ID}")

VERIFY_BODY=$(echo "$VERIFY_RESPONSE" | sed '$d')
VERIFY_CODE=$(echo "$VERIFY_RESPONSE" | tail -n1)

echo "HTTP Status: $VERIFY_CODE"
echo "$VERIFY_BODY"

if [ "$VERIFY_CODE" = "200" ]; then

    UPDATED=$(echo "$VERIFY_BODY" | python3 -c '
import sys,json
data=json.load(sys.stdin)
print(
    data.get("featured") is True
    and data.get("current_price") == 8400000
    and data.get("variant") == "Competition Updated"
)
')

    if [ "$UPDATED" = "True" ]; then
        pass "Update verification"
    else
        fail "Update verification"
    fi

else
    fail "Update verification"
fi

# --------------------------------------------------
# 11. Delete product
# --------------------------------------------------

echo
echo ">>> 11. DELETE /products/${PRODUCT_ID}"

DELETE_RESPONSE=$(curl -s \
    -w "\n%{http_code}" \
    -X DELETE \
    "${BASE_URL}/products/${PRODUCT_ID}")

DELETE_BODY=$(echo "$DELETE_RESPONSE" | sed '$d')
DELETE_CODE=$(echo "$DELETE_RESPONSE" | tail -n1)

echo "HTTP Status: $DELETE_CODE"

if [ -n "$DELETE_BODY" ]; then
    echo "$DELETE_BODY"
fi

if [ "$DELETE_CODE" = "200" ] || [ "$DELETE_CODE" = "204" ]; then
    pass "Delete Product"
else
    fail "Delete Product"
fi

# --------------------------------------------------
# 12. Verify deletion
# --------------------------------------------------

echo
echo ">>> 12. GET /products/${PRODUCT_ID} - Verify Deletion"

FINAL_RESPONSE=$(curl -s \
    -w "\n%{http_code}" \
    "${BASE_URL}/products/${PRODUCT_ID}")

FINAL_BODY=$(echo "$FINAL_RESPONSE" | sed '$d')
FINAL_CODE=$(echo "$FINAL_RESPONSE" | tail -n1)

echo "HTTP Status: $FINAL_CODE"

if [ "$FINAL_CODE" = "404" ]; then
    pass "Product successfully deleted"
else
    fail "Product deletion verification"
    echo "$FINAL_BODY"
fi

# --------------------------------------------------
# Final Result
# --------------------------------------------------

echo
echo "=========================================="
echo " Product API Functional Test Result"
echo "=========================================="

echo "PASS: $PASS_COUNT"
echo "FAIL: $FAIL_COUNT"

if [ "$FAIL_COUNT" -eq 0 ]; then

    echo
    echo "=========================================="
    echo " PRODUCT SERVICE FUNCTIONAL TEST PASSED"
    echo "=========================================="

    exit 0

else

    echo
    echo "=========================================="
    echo " PRODUCT SERVICE FUNCTIONAL TEST FAILED"
    echo "=========================================="

    exit 1
fi
