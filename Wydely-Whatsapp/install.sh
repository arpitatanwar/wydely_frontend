#!/bin/bash
set -e

cd "$(dirname "$0")"

# Retry logic for npm install
MAX_RETRIES=3
RETRY_COUNT=0

while [ $RETRY_COUNT -lt $MAX_RETRIES ]; do
  echo "Attempting npm install (attempt $((RETRY_COUNT + 1))/$MAX_RETRIES)..."
  
  if npm install --legacy-peer-deps --no-audit --no-fund; then
    echo "npm install succeeded!"
    exit 0
  fi
  
  RETRY_COUNT=$((RETRY_COUNT + 1))
  
  if [ $RETRY_COUNT -lt $MAX_RETRIES ]; then
    echo "npm install failed, retrying in 5 seconds..."
    sleep 5
    # Clean up any partial install
    rm -rf node_modules/.bin
  fi
done

echo "npm install failed after $MAX_RETRIES attempts"
exit 1
