#!/bin/bash

# Update system and install required packages
sudo pacman -Syu --noconfirm base-devel git

# Clone AUR helper (yay) from GitHub
git clone https://aur.archlinux.org/yay.git
cd yay

# Build and install yay
makepkg -si --noconfirm

# Remove yay directory after installation
cd ..
rm -rf yay

# Print a message to let the user know the script has completed
echo "yay installation completed"

