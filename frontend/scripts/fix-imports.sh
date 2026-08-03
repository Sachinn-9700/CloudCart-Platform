#!/bin/bash

set -e

echo "====================================="
echo " CloudCart Import Fix Script"
echo "====================================="

FILES=$(find src -type f \( -name "*.js" -o -name "*.jsx" \))

echo "[1/5] Updating VehicleCard component imports..."

echo "$FILES" | xargs sed -i \
's|import VehicleCard from "../VehicleCard";|import InventoryCard from "../../inventory/InventoryCard/InventoryCard";|g'

echo "[2/5] Updating JSX tags..."

echo "$FILES" | xargs sed -i 's/<VehicleCard/<InventoryCard/g'
echo "$FILES" | xargs sed -i 's#</VehicleCard>#</InventoryCard>#g'

echo "[3/5] Updating CSS imports..."

echo "$FILES" | xargs sed -i \
's|"\./VehicleCard\.css"|"./InventoryCard.css"|g'

echo "[4/5] Updating component filename imports..."

echo "$FILES" | xargs sed -i \
's|VehicleCard\.jsx|InventoryCard.jsx|g'

echo "[5/5] Finished."

echo
echo "✔ Imports fixed."
