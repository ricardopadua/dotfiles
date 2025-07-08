#!/bin/bash

# Detect the operating system package manager
if command -v apk &> /dev/null; then
    OS="alpine"
    PKG_INSTALL="apk add --no-cache"
elif command -v apt &> /dev/null; then
    OS="debian"
    PKG_INSTALL="apt update -y && apt install -y"
elif command -v dnf &> /dev/null; then
    OS="fedora"
    PKG_INSTALL="dnf install -y"
else
    echo "Unsupported operating system!"
    exit 1
fi

echo "Detected OS: $OS"

# Install required packages
echo "Installing Tmux..."
$PKG_INSTALL tmux

# Check if Tmux was installed successfully
if ! command -v tmux &> /dev/null; then
    echo "Tmux could not be installed. Aborting."
    exit 1
fi

# Extract and install fonts globally
if [ -f ".tmux.conf" ]; then
    echo "move config..."
    mv .tmux.conf ~/.tmux.conf
    echo "Tmux custom installed."
fi

echo "Installation completed! You may need to restart your terminal or log out and log back in."
