#!/bin/bash

set -e

echo "========================================"
echo " Applying CloudCart Sprint"
echo "========================================"

ROOT="$(pwd)"

write_file() {
  FILE="$1"

  mkdir -p "$(dirname "$FILE")"

  echo "Writing $FILE"

  cat > "$FILE"
}

#########################################
# Example
#########################################

write_file src/utils/vehicle/getAllCars.js <<'EOF'
import cars from "../../data/inventory/cars";

export default function getAllCars() {
  return cars;
}
EOF

write_file src/utils/vehicle/getAllBikes.js <<'EOF'
import bikes from "../../data/inventory/bikes";

export default function getAllBikes() {
  return bikes;
}
EOF

write_file src/utils/vehicle/filterVehicles.js <<'EOF'
export default function filterVehicles(vehicles){
  return vehicles;
}
EOF

echo
echo "Done."
