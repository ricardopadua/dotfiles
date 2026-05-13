#!/bin/bash

echo "Installing packages..."
sudo dnf install -y zsh alacritty fontconfig git curl

rm -rf $HOME/.oh-my-zsh
rm -rf $HOME/.zshrc

git clone https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

if command -v zsh >/dev/null 2>&1; then
  echo "Setting zsh as default shell..."
  grep -qxF 'exec zsh' ~/.bashrc || echo 'exec zsh' >>~/.bashrc
  chsh -s "$(which zsh)"
fi

fc-cache -fv
cp "$HOME/.dotfiles/zsh/.zshrc" "$HOME/.zshrc"
cp "$HOME/.dotfiles/zsh/.p10k.zsh" "$HOME/.p10k.zsh"

echo "Installation completed! You may need to restart your terminal or log out and log back in."
