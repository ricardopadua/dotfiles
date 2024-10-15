#!/bin/bash

# Remove Tmux
echo "Removing Tmux..."
rm -rf $HOME/.tmux.conf
sudo dnf remove tmux

echo "Uninstallation completed! You may need to restart your terminal or log out and log back in."

