#!/bin/bash
set -e

echo "=== Installing AWS CLI v2 ==="

# Download AWS CLI v2
cd /tmp
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# Unzip and install
unzip -q awscliv2.zip
sudo ./aws/install

# Cleanup
rm -rf aws awscliv2.zip

# Verify installation
aws --version

echo "✅ AWS CLI v2 installed successfully"
