#!/usr/bin/env bash
# A script that automates user and group management

# Ensure the input file is supplied as argument to the script
if [[ "$#" -lt 2 ]]; then
  echo "Usage: $0 INPUT_FILE"
  exit 1
fi


