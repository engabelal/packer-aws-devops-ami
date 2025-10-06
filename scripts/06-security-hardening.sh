#!/bin/bash
set -e

echo "=== Security Hardening ==="

# Install UFW and Fail2ban
sudo apt-get install -y ufw fail2ban

# Configure SSH
if [ -f /tmp/sshd_config ]; then
    sudo cp /tmp/sshd_config /etc/ssh/sshd_config
    sudo chmod 644 /etc/ssh/sshd_config
fi

# Configure UFW
sudo ufw --force reset
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22/tcp
sudo ufw --force enable

# Configure Fail2ban
sudo systemctl enable fail2ban
sudo systemctl start fail2ban

# Set secure permissions
sudo chmod 700 /root
sudo chmod 700 /home/ubuntu

echo "✅ Security hardening completed"
