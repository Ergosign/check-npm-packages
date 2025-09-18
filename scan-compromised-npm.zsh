#!/bin/zsh

# List of compromised packages with their affected versions
# Format: "package@version"
CHECKS=(
  "@ctrl/tinycolor@4.1.1" "@ctrl/tinycolor@4.1.2"
)

for entry in "${CHECKS[@]}"; do
  pkg="${entry%@*}"
  ver="${entry##*@}"
  
  echo "🔎 Searching for $pkg@$ver ..."
  find . -type f -path "*/node_modules/$pkg/package.json" 2>/dev/null \
    -exec grep -H "\"version\": \"$ver\"" {} \;
done
