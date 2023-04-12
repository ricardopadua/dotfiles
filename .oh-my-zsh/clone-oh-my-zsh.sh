#!/bin/bash

# Clone the Oh My Zsh repository from Github
rm -rfv /tmp/.oh-my-zsh 
git clone https://github.com/ohmyzsh/ohmyzsh.git /tmp/.oh-my-zsh

# Make a copy of the Oh My Zsh default configuration file
cp -rfv /tmp/.oh-my-zsh  ~/.oh-my-zsh

# Set the default shell to Zsh
chsh -s $(which zsh)

# Restart the terminal to activate the new shell
exec zsh
