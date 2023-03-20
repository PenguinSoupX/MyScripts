#!/bin/bash

# Get the directory where the script is located
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Define the input file names and locations
official_packages_file="$script_dir/package_lists/official_packages.txt"
aur_packages_file="$script_dir/package_lists/aur_packages.txt"
flatpak_packages_file="$script_dir/package_lists/flatpak_packages.txt"

# Define function to install packages from a file
install_packages() {
    local package_file="$1"
    while read package; do
        echo "Installing $package..."
        if [[ $package_file == "$official_packages_file" ]]; then
            if [[ $use_pacman == true ]]; then
                sudo pacman -S --noconfirm "$package"
            else
                yay -S --noconfirm "$package"
            fi
        elif [[ $package_file == "$aur_packages_file" ]]; then
            yay -S --noconfirm "$package"
        elif [[ $package_file == "$flatpak_packages_file" ]]; then
            flatpak install --assumeyes "$package"
        fi
    done < "$package_file"
}

# Ask user which file(s) to install packages from
echo "Which package file(s) do you want to install packages from?"
echo "1. official_packages_file"
echo "2. aur_packages_file"
echo "3. flatpak_packages_file"
echo "4. Both official and AUR packages"
echo "5. All three files"
read choice

# Ask user which package manager to use for installing official packages
echo "Which package manager do you want to use for installing official packages?"
echo "1. pacman"
echo "2. yay"
read pm_choice

case $pm_choice in
    1) use_pacman=true;;
    2) use_pacman=false;;
    *) echo "Invalid choice. Please choose 1 or 2."; exit 1;;
esac

case $choice in
    1) install_packages "$official_packages_file";;
    2) install_packages "$aur_packages_file";;
    3) install_packages "$flatpak_packages_file";;
    4) install_packages "$official_packages_file"; install_packages "$aur_packages_file";;
    5) install_packages "$official_packages_file"; install_packages "$aur_packages_file"; install_packages "$flatpak_packages_file";;
    *) echo "Invalid choice. Please choose 1, 2, 3, 4, or 5."; exit 1;;
esac

# Print a message to let the user know the script has completed
echo "Package installation completed"
