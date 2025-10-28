#!/bin/bash

# Kali Linux Maintenance Script
# Purpose: Perform basic system maintenance and security checks
# Usage: Save as 'kali_maintenance.sh', make executable with 'chmod +x kali_maintenance.sh', then run with './kali_maintenance.sh'

echo "Starting Kali Linux Maintenance Script..."
echo "----------------------------------------"

# Check if running as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root (use sudo)"
  exit 1
fi

# Update package lists
echo "Updating package lists..."
apt update

# Upgrade installed packages
echo "Upgrading installed packages..."
apt upgrade -y

# Clean package cache
echo "Cleaning package cache..."
apt autoremove -y
apt autoclean

# Show system information
echo "System Information:"
uname -a

# Check disk usage
echo "Disk Usage:"
df -h

# Check running services (first 10)
echo "Running Services (first 10):"
systemctl list-units --type=service --state=running | head -10

# Show listening ports (first 10)
echo "Listening Ports (first 10):"
ss -tuln | head -10

echo "----------------------------------------"
echo "Maintenance complete!"
