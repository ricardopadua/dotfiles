#!/bin/bash

DOTFILES_REPO="$1"
DOTFILES_DIR="$2"

mkdir -p "$(dirname "$DOTFILES_DIR")"
mkdir -p ~/.config

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

  [ -L "$TARGET" ] || [ -e "$TARGET" ] && rm -rf "$TARGET"
  ln -sf "$SOURCE" "$TARGET"
}

safe_link "$HOME/.tmux.conf" "$DOTFILES_DIR/tmux/.tmux.conf"
safe_link "$HOME/.config/alacritty" "$DOTFILES_DIR/alacritty"
safe_link "$HOME/.config/nvim" "$DOTFILES_DIR/nvim"


