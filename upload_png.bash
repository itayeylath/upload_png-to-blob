#!/bin/bash

STORAGE_ACCOUNT=""
CONTAINER=""

FILE_PATH="$1"
shift

if [ ! -f "$FILE_PATH" ]; then
  echo "File does not exist: $FILE_PATH"
  exit 1
fi

if [[ "$FILE_PATH" != *.png && "$FILE_PATH" != *.PNG ]]; then
  echo "Only PNG files are supported"
  exit 1
fi

FILE_NAME=$(basename "$FILE_PATH")

if [ "$#" -eq 0 ]; then
  echo "No folders provided"
  exit 1
fi

for FOLDER in "$@"