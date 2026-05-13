#!/bin/bash

set -e

echo "Updating packages..."

echo "Installing dependencies..."
#sudo dnf install -y \
#  autoconf \
#  gcc \
#  ncurses-devel \
#  make \
#  openssl-devel \
#  gcc-c++

DOTFILES_REPO="$1"
DOTFILES_DIR="$2"
SCRIPT_DIR="$DOTFILES_DIR"

if [ -d "$DOTFILES_DIR" ]; then
  TIMESTAMP=$(date +"%Y%m%d%H%M%S")
  BACKUP_DIR="${DOTFILES_DIR}_backup_${TIMESTAMP}"
  echo "Backing up existing directory to $BACKUP_DIR"
  mv "$DOTFILES_DIR" "$BACKUP_DIR"
fi

echo "Cloning..."
git clone "$DOTFILES_REPO" "$DOTFILES_DIR"

safe_link() {
  TARGET="$1"
  SOURCE="$2"

  if [ -L "$TARGET" ] || [ -e "$TARGET" ]; then
    rm -rf "$TARGET"
  fi

  mkdir -p "$(dirname "$TARGET")"

  ln -sfn "$SOURCE" "$TARGET"
}

safe_link "$HOME/.tmux.conf" "$DOTFILES_DIR/tmux/.tmux.conf"
safe_link "$HOME/.config/alacritty" "$DOTFILES_DIR/alacritty"
safe_link "$HOME/.config/nvim" "$DOTFILES_DIR/nvim"
safe_link "$HOME/.local/share/fonts" "$DOTFILES_DIR/zsh/fonts"

bash "$SCRIPT_DIR/zsh/install.sh"
