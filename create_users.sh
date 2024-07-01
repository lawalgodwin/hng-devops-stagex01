#!/usr/bin/env bash
# A script that automates user and group management

# Ensure the input file is supplied as argument to the script
if [[ "$#" -lt 1 ]]; then
  echo "Usage: $0 INPUT_FILE"
  exit 1
fi

# Ensure the given input file exists before reading the content
input_file="$1"
if [[ -f "$input_file" ]]; then
# Read the content line by line
  while read -r line; do
# Extract the username and groups on every line
    username=$(echo "$line" | cut -d ";" -f 1)
    usergroups=$(echo "$line" | cut -d ";" -f 2 | sed -e s/","/" "/g)
    echo "$username ---> ${usergroups[*]}"
  done < "$input_file"
fi
