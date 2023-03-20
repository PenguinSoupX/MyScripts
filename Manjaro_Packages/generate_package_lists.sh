#!/bin/bash

# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Define the output file names and locations
official_packages_file="$SCRIPT_DIR/package_lists/official_packages.txt"
aur_packages_file="$SCRIPT_DIR/package_lists/aur_packages.txt"
flatpak_packages_file="$SCRIPT_DIR/package_lists/flatpak_packages.txt"

# Create directory for output files if it doesn't exist
mkdir -p "$SCRIPT_DIR/package_lists"

# Run the pacman command to get a list of all installed packages, and pipe the output to awk to extract the package names
pacman -Qqen | awk '{print $1}' > "$official_packages_file"

# Append the names of any packages installed from the AUR to the AUR output file
pacman -Qqem | awk '{print $1}' > "$aur_packages_file"

# Use flatpak to get a list of all installed flatpaks, and pipe the output to awk to extract the package names
flatpak list --app --columns=application | awk '{print $1}' > "$flatpak_packages_file"

# Print a message to let the user know the script has completed
echo "List of installed programs saved to $SCRIPT_DIR/package_lists/ directory"
