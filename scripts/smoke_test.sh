#!/bin/bash

# Endpoint to check
ENDPOINT="http://localhost:8800/books"

# Expected status code
EXPECTED_STATUS_CODE=200

# Make a curl request to the backend endpoint
response=$(curl --write-out "%{http_code}" --silent --output /dev/null "$ENDPOINT")

# Check if the response is what we expect
if [ "$response" -eq "$EXPECTED_STATUS_CODE" ]; then
  echo "Smoke test passed: HTTP $response"
  exit 0
else
  echo "Smoke test failed: Expected HTTP $EXPECTED_STATUS_CODE, got HTTP $response"
  exit 1
fi
