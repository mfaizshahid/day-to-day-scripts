#!/bin/bash

# Define paths
SERVICE_FILE="/etc/systemd/system/setup-grass-installation.service"
SCRIPT_PATH="$HOME/dev/day-to-day-scripts/scripts/startup/install_grass_package.sh"

# making executable
chmod +x "$SCRIPT_PATH"

# Create systemd service file
echo "Creating systemd service..."
sudo bash -c "cat > $SERVICE_FILE <<EOL
[Unit]
Description=Startup Script to Remove unwanted and Install Grass Package
After=network.target

[Service]
ExecStart=$SCRIPT_PATH
Restart=always
User=$USER

[Install]
WantedBy=multi-user.target
EOL"

# Reload systemd, enable and start the service
echo "Enabling startup service..."
sudo systemctl daemon-reload
sudo systemctl enable setup-grass-installation.service
sudo systemctl start setup-grass-installation.service

echo "Setup grass installation successfully enabled"
