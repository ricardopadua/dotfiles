#!/bin/bash

# Update system packages
sudo dnf update -y

# Install Zsh
sudo dnf install tmux -y

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


