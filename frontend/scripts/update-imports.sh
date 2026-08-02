#!/bin/bash

echo "Updating brand imports..."
find src -type f \( -name "*.js" -o -name "*.jsx" \) \
-exec sed -i \
's#\.\./\.\./\.\./data/brands#../../../data/catalog/brands#g' {} +

echo "Updating feature imports..."
find src -type f \( -name "*.js" -o -name "*.jsx" \) \
-exec sed -i \
's#\.\./\.\./\.\./data/features#../../../data/catalog/features#g' {} +

echo "Updating cars imports..."
find src -type f \( -name "*.js" -o -name "*.jsx" \) \
-exec sed -i \
's#data/cars#data/inventory/cars#g' {} +

echo "Updating bikes imports..."
find src -type f \( -name "*.js" -o -name "*.jsx" \) \
-exec sed -i \
's#data/bikes#data/inventory/bikes#g' {} +

echo "Done."
