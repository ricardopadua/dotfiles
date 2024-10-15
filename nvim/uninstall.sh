#!/bin/bash

# Remove Neovim custom
echo "Removing Tmux..."
rm -rfv $HOME/.config/nvim/*
sudo rm -rf ~/.local/share/nvim/site/pack/packer/start/*  
sudo rm -rf ~/.local/share/nvim/site/pack/packer/opt/*

echo "Uninstallation completed! You may need to restart your terminal or log out and log back in."

