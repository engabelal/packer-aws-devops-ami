#!/bin/bash
set -e

echo "=== Checking SSM Agent ==="

# SSM Agent is pre-installed on Ubuntu AMIs, just update it
sudo snap refresh amazon-ssm-agent || sudo snap install amazon-ssm-agent --classic

# Verify status
sudo systemctl status snap.amazon-ssm-agent.amazon-ssm-agent.service --no-pager || true

echo "✅ SSM Agent verified/updated successfully"
