#!/bin/zsh

# List of compromised packages with their affected versions
# Format: "package@version"
CHECKS=(
  "@ctrl/tinycolor@4.1.1" "@ctrl/tinycolor@4.1.2"
)

for entry in "${CHECKS[@]}"; do
  pkg="${entry%@*}"
  ver="${entry##*@}"
  
  echo
  echo "--- Checking for '${pkg}', compromised version is '${ver}' ---"

  found_files=$(find . -type f -path "*/node_modules/$pkg/package.json" 2>/dev/null)

  if [[ -z "$found_files" ]]; then
    echo "✅ Package not found."
    continue
  fi

  # Loop through each package.json found for the package
  for file in ${(f)found_files}; do
    # Extract the installed version from the file.
    # We use grep to find the line and awk to extract the 4th field using " as a delimiter.
    installed_ver=$(grep '"version":' "$file" | awk -F'"' '{print $4}')

    if [[ -z "$installed_ver" ]]; then
        echo "⚠️  Could not determine version in: $file"
        continue
    fi

    # Compare the installed version with the compromised one
    if [[ "$installed_ver" == "$ver" ]]; then
      echo "🚨 VULNERABLE: Found matching version $installed_ver in: $file"
    else
      echo "ℹ️  Found different version: $installed_ver in: $file"
    fi
  done
done
