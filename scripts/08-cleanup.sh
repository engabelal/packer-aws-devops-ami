#!/bin/bash
set -e

echo "=== Cleanup ==="

# Remove temporary files
sudo rm -rf /tmp/*

# Clear apt cache
sudo apt-get clean
sudo apt-get autoclean
sudo apt-get autoremove -y

# Clear logs
sudo find /var/log -type f -name "*.log" -exec truncate -s 0 {} \;
sudo rm -rf /var/log/*.gz

# Clear bash history
cat /dev/null > ~/.bash_history
history -c

# Clear cloud-init logs
sudo cloud-init clean --logs

echo "✅ Cleanup completed"
