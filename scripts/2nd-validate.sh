# Add more fields to check for duplicates
is_duplicate=$(jq --argjson csr "$csr_info" '.csrs[] | select(
  .pubkey == $csr.pubkey or 
  .subject == $csr.subject or 
  # Add more conditions here
)' .github/csr_db.json)