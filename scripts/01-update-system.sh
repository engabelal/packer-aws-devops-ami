#!/bin/bash
set -e

echo "=== Updating System ==="

# Update package lists
sudo apt-get update

# Upgrade all packages
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

# Install essential packages
sudo apt-get install -y \
    build-essential \
    software-properties-common \
    apt-transport-https \
    ca-certificates \
    gnupg \
    lsb-release

# Set timezone to UTC
sudo timedatectl set-timezone UTC

echo "✅ System updated successfully"
