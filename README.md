# Grub-Theme

A custom Grub theme to personalize your bootloader screen. This repository contains an installation script (`install.sh`) that automates the process of downloading, copying, and applying the theme to your Grub bootloader.

## Features
- A sleek, minimal Grub theme.
- Simple installation script.
- Customizable for your needs.

## Installation

### Prerequisites
- Make sure you have `git` installed on your system. You can install it using:

    ```bash
    sudo apt update
    sudo apt install git
    ```

- Your system must support the Grub bootloader (used in most Linux distributions).

### Steps to Install

1. **Clone the repository:**
   Download the theme by cloning the GitHub repository:

    ```bash
    git clone https://github.com/Datta-Lohith/Grub-Theme.git
    ```

2. **Navigate to the directory:**
   Change your current directory to the newly cloned folder:

    ```bash
    cd Grub-Theme
    ```

3. **Run the installation script:**
   Run the provided `install.sh` script to install the theme:

    ```bash
    sudo bash install.sh
    ```

4. **Reboot your system:**
   Once the installation is complete, reboot your system to see the new Grub theme in action:

    ```bash
    sudo reboot
    ```

## Preview
![Grub Theme Preview](https://github.com/Datta-Lohith/Grub-Theme/blob/main/grub_bg.png)


## Uninstallation
To revert to your default Grub theme, open `/etc/default/grub` and remove or comment out the `GRUB_THEME` line. Then, update Grub and reboot your system.

![Project Views](https://hits.seeyoufarm.com/api/count/incr/badge.svg?url=https://github.com/Datta-Lohith/Grub-Theme&title=People%20Used)

