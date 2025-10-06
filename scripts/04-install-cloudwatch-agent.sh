#!/bin/bash
set -e

echo "=== Installing CloudWatch Agent ==="

# Download CloudWatch agent
cd /tmp
wget -q https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb

# Install agent
sudo dpkg -i amazon-cloudwatch-agent.deb

# Copy config if exists
if [ -f /tmp/cloudwatch-config.json ]; then
    sudo cp /tmp/cloudwatch-config.json /opt/aws/amazon-cloudwatch-agent/etc/
fi

# Cleanup
rm -f amazon-cloudwatch-agent.deb

# Verify installation (use status instead of query)
/opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a status || echo "CloudWatch Agent installed (not running yet)"

echo "✅ CloudWatch Agent installed successfully"
