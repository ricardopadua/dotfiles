#!/bin/bash

# Revert default shell to bash
echo "Changing default shell back to bash..."
chsh -s $(which bash)

# Remove Oh My Zsh
echo "Removing Oh My Zsh..."
rm -rf $HOME/.oh-my-zsh

# Remove Zsh configuration
echo "Removing .zshrc..."
rm -rf $HOME/.zshrc

# Remove Zsh
echo "Removing Zsh..."
sudo dnf remove zsh fzf ripgrep -y

# Remove Zsh configuration
echo "Removing .fonts..."
rm -rf $HOME/.fonts/*
fc-cache -fv

echo "Uninstallation completed! You may need to restart your terminal or log out and log back in."

