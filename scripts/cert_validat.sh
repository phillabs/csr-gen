# Add to the Process CSR files step
# Validate CSR format
openssl req -in "$csr_file" -verify -noout || echo "Invalid CSR format: $csr_file"

# Check key size
key_size=$(openssl req -in "$csr_file" -noout -text | grep "Public-Key:" | grep -o "[0-9]\+")
if [ "$key_size" -lt 2048 ]; then
  echo "Warning: Weak key size in $csr_file"
fi