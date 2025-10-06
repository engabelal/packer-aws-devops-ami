#!/bin/bash
set -e

echo "=== Installing Core Tools ==="

sudo apt-get install -y \
    git \
    curl \
    wget \
    vim \
    nano \
    unzip \
    tar \
    htop \
    tree \
    jq \
    net-tools \
    dnsutils

# Verify installations
echo "Verifying installations..."
git --version
curl --version
wget --version
vim --version

echo "✅ Core tools installed successfully"
