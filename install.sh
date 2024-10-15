#!/bin/bash

REPO_URL=https://github.com/ricardopadua/dotfiles
DIR_NAME=~/.dotfiles

# Clone the repository
git clone "$REPO_URL" ~/.dotfiles

# Check if the clone was successful
if [ $? -ne 0 ]; then
  echo "Failed to clone the repository."
  exit 1
fi

cd "$DIR_NAME" || exit

if [ -f "asdf/install.sh" ]; then
   cd asdf
   ./install.sh
   asdf install
   cd ..
fi

if [ -f "zsh/install.sh" ]; then
   cd zsh
   ./install.sh
   cd ..
fi

if [ -f "tmux/install.sh" ]; then
   cd tmux
   ./install.sh
   cd ..
fi

if [ -f "nvim/install.sh" ]; then
   mv nvim ~/.config/
fi

echo "Scripts executed successfully."

