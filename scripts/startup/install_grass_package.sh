#!/bin/bash

# Remove unwanted packages
echo "Removing grass package..."
sudo apt remove -y grass && sudo apt purge -y grass && sudo apt autoremove -y

# Install package from Desktop (assuming it's a .deb file)
PACKAGE_PATH="$HOME/Desktop/Grass*.deb"
echo "Installing package from Desktop..."
sudo dpkg -i $PACKAGE_PATH

# Fix any missing dependencies
sudo apt-get install -f -y

echo "Grass Installed Successfully"
