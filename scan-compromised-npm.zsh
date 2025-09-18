#!/bin/zsh

# List of compromised packages with their affected versions
# Format: "package@version"
CHECKS=(
  #testing
  "@nuxt/eslint@1.9.0" "@nuxt/eslint@1.8.0"
  "@ctrl/tinycolor@4.1.1" "@ctrl/tinycolor@4.1.2"
)

for entry in "${CHECKS[@]}"; do
  pkg="${entry%@*}"
  ver="${entry##*@}"
  
  echo "--- Checking for '${pkg}', compromised version is '${ver}' ---"

  found_files=$(find . -type f -path "*/node_modules/$pkg/package.json" 2>/dev/null)

  if [[ -z "$found_files" ]]; then
    echo "✅ Package not found."
    continue
  fi

  # Loop through each package.json found for the package
  for file in ${(f)found_files}; do
    # Extract the installed version from the file.
    installed_ver=$(grep '"version":' "$file" | awk -F'"' '{print $4}')

    if [[ -z "$installed_ver" ]]; then
        echo "⚠️  Could not determine version in: $file"
        continue
    fi

    # Compare the installed version with the compromised one
    if [[ "$installed_ver" == "$ver" ]]; then
      echo "🚨 VULNERABLE: Found matching version $installed_ver in: $file"
      # Add the vulnerable path to our summary array
      vulnerable_paths+=("$file")
    else
      echo "ℹ️  Found different version: $installed_ver in: $file"
    fi
  done
done

# --- Print the summary at the end ---
echo
echo "========================================"
echo "          Scan Summary"
echo "========================================"

if [[ ${#vulnerable_paths[@]} -gt 0 ]]; then
  echo "🚨 Found ${#vulnerable_paths[@]} vulnerable package installation(s):"
  # Loop through the array and print each affected path
  for path in "${vulnerable_paths[@]}"; do
    echo "  - $path"
  done
else
  echo "✅ No packages with specifically compromised versions were found."
fi
