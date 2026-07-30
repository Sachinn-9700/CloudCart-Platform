#!/bin/bash

set -e

echo "Creating CloudCart Motors frontend structure..."

mkdir -p frontend/src/{assets/{cars,bikes,logos,icons,videos,images},components/{common,layout,vehicle,home,ui,status},config,context,hooks,layouts,pages/{Home,Cars,Bikes,Vehicle,Login,Register,Cart,Checkout,Profile,NotFound},routes,services,styles,utils,api}

touch frontend/src/api/auth.js
touch frontend/src/api/product.js
touch frontend/src/api/cart.js
touch frontend/src/api/index.js

touch frontend/src/config/constants.js

touch frontend/src/layouts/MainLayout.jsx

touch frontend/src/routes/AppRoutes.jsx

touch frontend/src/styles/globals.css
touch frontend/src/styles/variables.css
touch frontend/src/styles/animations.css

echo "CloudCart Motors frontend structure created successfully."
