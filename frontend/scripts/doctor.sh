#!/bin/bash

echo "===== CloudCart Doctor ====="

echo "Checking build..."
npm run build || exit 1

echo "Checking git status..."
git status

echo "Checking tree..."
tree src -L 2

echo "Done."
