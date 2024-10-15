#!/usr/bin/env bash

# Set to exit immediately on error and pipefail to catch errors in pipelines
set -e
set -o pipefail

# Define log file
LOG_FILE="/config/mediola2mqtt.log"

# Redirect stdout and stderr to log file
exec > >(tee -a "$LOG_FILE") 2>&1

# Print the start time and other info
echo "Starting mediola2mqtt at $(date)"

# Run your main application and capture errors
python3 /mediola2mqtt.py || { echo "Failed to run mediola2mqtt.py"; exit 1; }

# Optionally print completion time
echo "mediola2mqtt completed at $(date)"
