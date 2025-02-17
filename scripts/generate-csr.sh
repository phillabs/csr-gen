#!/bin/bash
DIR="./scripts"

for file in "$DIR"/*
do
  echo "Processing $file"
  openssl req -new -newkey rsa:2048 -nodes -keyout "$file-key.pem" -out "$file-csr.csr" -subj "/CN=$(basename "$file")"
done

