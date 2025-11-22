#!/bin/bash

# Script to upgrade Ubuntu OS and packages
# This script performs the following steps:
# 1. apt update - Refresh package list
# 2. apt upgrade - Upgrade packages
# 3. apt full-upgrade - Full upgrade (dist-upgrade)
# 4. apt autoremove - Remove unused packages

set -e  # Exit on error

echo "=========================================="
echo "Ubuntu OS and Package Upgrade Script"
echo "=========================================="
echo ""

# Step 1: Update package list
echo "[1/4] Updating package list..."
sudo apt update
if [ $? -eq 0 ]; then
    echo "✓ Package list updated successfully"
else
    echo "✗ Failed to update package list"
    exit 1
fi
echo ""

# Step 2: Upgrade packages
echo "[2/4] Upgrading packages..."
sudo apt upgrade -y
if [ $? -eq 0 ]; then
    echo "✓ Packages upgraded successfully"
else
    echo "✗ Failed to upgrade packages"
    exit 1
fi
echo ""

# Step 3: Full upgrade (dist-upgrade)
echo "[3/4] Performing full upgrade..."
sudo apt full-upgrade -y
if [ $? -eq 0 ]; then
    echo "✓ Full upgrade completed successfully"
else
    echo "✗ Failed to perform full upgrade"
    exit 1
fi
echo ""

# Step 4: Remove unused packages
echo "[4/4] Removing unused packages..."
sudo apt autoremove -y
if [ $? -eq 0 ]; then
    echo "✓ Unused packages removed successfully"
else
    echo "✗ Failed to remove unused packages"
    exit 1
fi
echo ""

echo "=========================================="
echo "Upgrade process completed successfully!"
echo "=========================================="
