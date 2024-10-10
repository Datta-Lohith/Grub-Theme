#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Define the theme directory
THEME_DIR="/boot/grub/themes/Grub-Theme"

echo "Installing Grub Theme..."

# Step 1: Clone the theme from GitHub to /tmp
echo "Getting theme from GitHub..."
cd /tmp
git clone https://github.com/Datta-Lohith/Grub-Theme.git

# Step 2: Check if the Grub themes directory exists, if not, create it
echo "Copying theme to the Grub themes directory..."
if [ -d "/boot/grub/themes" ]; then
    echo "Directory '/boot/grub/themes' already exists."
else
    echo "Creating directory: /boot/grub/themes"
    sudo mkdir -p /boot/grub/themes
fi

# Step 3: Copy the theme to the Grub themes directory
echo "Copying theme files..."
sudo cp -r /tmp/Grub-Theme "$THEME_DIR"

# Step 4: Update the Grub configuration to use the new theme
echo "Updating Grub configuration to use the new theme..."
sudo sed -i 's|^GRUB_THEME=.*|GRUB_THEME="'"$THEME_DIR"'/theme.txt"|' /etc/default/grub
sudo update-grub

# Step 5: Clean up temporary files
echo "Cleaning up..."
rm -rf /tmp/Grub-Theme

# Step 6: Notify the user of successful installation
echo "Theme installed successfully!"
echo "Please reboot your system to see the new Grub theme."
