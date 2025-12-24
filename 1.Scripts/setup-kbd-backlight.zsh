#!/usr/bin/env zsh

# Create keyboard backlight service for MacBook
echo "Creating keyboard backlight service..."

# Create the service file with sudo
sudo tee /etc/systemd/system/kbd-backlight.service >/dev/null <<'EOF'
[Unit]
Description=Set MacBook keyboard backlight at boot
After=network.target

[Service]
Type=oneshot
ExecStart=/usr/bin/brightnessctl -d spi::kbd_backlight set 50%
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF

# Check if service file was created successfully
if [[ -f /etc/systemd/system/kbd-backlight.service ]]; then
  echo "Service file created successfully"

  # Reload systemd daemon
  echo "Reloading systemd daemon..."
  sudo systemctl daemon-reload

  # Enable the service
  echo "Enabling kbd-backlight service..."
  sudo systemctl enable kbd-backlight.service

  # Start the service
  echo "Starting kbd-backlight service..."
  sudo systemctl start kbd-backlight.service

  # Check service status
  echo "Checking service status..."
  sudo systemctl status kbd-backlight.service --no-pager
else
  echo "Failed to create service file"
  exit 1
fi

echo "Keyboard backlight service setup complete!"

