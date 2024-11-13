#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Define colors for echo
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Define the theme directory
THEME_DIR="/boot/grub/themes/Grub-Theme"

echo -e "${CYAN}Installing Grub Theme...${NC}"

# Step 1: Clone the theme from GitHub to /tmp
echo -e "${YELLOW}Getting theme from GitHub...${NC}"
cd /tmp
git clone https://github.com/Datta-Lohith/Grub-Theme.git

# Step 2: Check if the Grub themes directory exists, if not, create it
echo -e "${YELLOW}Checking if the Grub themes directory exists...${NC}"
if [ -d "/boot/grub/themes" ]; then
    echo -e "${GREEN}Directory '/boot/grub/themes' already exists.${NC}"
else
    echo -e "${YELLOW}Creating directory: /boot/grub/themes${NC}"
    sudo mkdir -p /boot/grub/themes
fi

# Step 3: Copy the theme to the Grub themes directory, excluding install.sh and README.md
echo -e "${YELLOW}Copying theme files, excluding 'install.sh' and 'README.md'...${NC}"
sudo rsync -av --exclude='install.sh' --exclude='.git' --exclude='README.md' /tmp/Grub-Theme/ "$THEME_DIR"

# Step 4: Update the Grub configuration to use the new theme
echo -e "${YELLOW}Updating Grub configuration to use the new theme...${NC}"
sudo grep -q '^GRUB_THEME=' /etc/default/grub || echo 'GRUB_THEME="$THEME_DIR"' | sudo tee -a /etc/default/grub > /dev/null

sudo update-grub

# Step 5: Clean up temporary files
echo -e "${YELLOW}Cleaning up...${NC}"
rm -rf /tmp/Grub-Theme

# Step 6: Notify the user of successful installation
echo -e "${GREEN}Theme installed successfully!${NC}"
echo -e "${CYAN}Please reboot your system to see the new Grub theme.${NC}"
