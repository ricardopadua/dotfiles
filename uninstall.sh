#!/bin/bash

DIR_NAME=~/.dotfiles

cd "$DIR_NAME" || exit

if [ -f "asdf/install.sh" ]; then
  ./asdf/uninstall.sh
fi

if [ -f "zsh/install.sh" ]; then
  ./zsh/uninstall.sh
fi

if [ -f "tmux/install.sh" ]; then
  ./tmux/uninstall.sh
fi

if [ -f "nvim/install.sh" ]; then
  ./nvim/uninstall.sh
fi

rm -rfv ~/.dotfiles
echo "Scripts executed successfully."

