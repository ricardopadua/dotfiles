#!/bin/bash

# Check if the system is Debian-based or Red Hat-based
if [ -x "$(command -v apt)" ]; then
    PACKAGE_MANAGER="apt"
elif [ -x "$(command -v yum)" ]; then
    PACKAGE_MANAGER="yum"
elif [ -x "$(command -v dnf)" ]; then
    PACKAGE_MANAGER="dnf"
else
    echo "unsupported package manager."
    exit 1
fi

# Update package manager cache
if [ "$PACKAGE_MANAGER" == "apt" ]; then
    sudo apt update
elif [ "$PACKAGE_MANAGER" == "yum" ]; then
    sudo yum makecache
elif [ "$PACKAGE_MANAGER" == "dnf" ]; then
    sudo dnf makecache
fi

# Install dependencies
if [ "$PACKAGE_MANAGER" == "apt" ]; then
    sudo apt install -y curl git
elif [ "$PACKAGE_MANAGER" == "yum" ] || [ "$PACKAGE_MANAGER" == "dnf" ]; then
    sudo $PACKAGE_MANAGER install -y curl git
fi

# Clone the ASDF GitHub repository
if [ ! -d ~/.asdf ]; then
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1
fi

# Add ASDF to your shell (BASH)
if ! grep -q 'asdf.sh' ~/.bashrc; then
    echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc
fi

if ! grep -q 'asdf.bash' ~/.bashrc; then
    echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc
fi

# install DroidSansMono Nerd Font --> u can choose another at: https://www.nerdfonts.com/font-downloads
if [ ! -d ~/.fonts ]; then
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/DroidSansMono.zip
    unzip DroidSansMono.zip -d ~/.fonts
    fc-cache -fv
fi

# Load ASDF into current shell
source ~/.bashrc

# Install my plugins
if ! asdf plugin-list | grep -q 'erlang'; then
      asdf plugin add erlang
      asdf install erlang 26.0.2
      asdf global erlang 26.0.2
fi

if ! asdf plugin-list | grep -q 'elixir'; then
      asdf plugin add elixir
      asdf install elixir 1.15.4-otp-26
      asdf global elixir 1.15.4-otp-26
fi

if ! asdf plugin-list | grep -q 'rust'; then
      asdf plugin add rust
      asdf isntall rust 1.71.0
      asdf global rust 1.71.0
fi

if ! asdf plugin-list | grep -q 'nodejs'; then
      asdf plugin add nodejs
      asdf install nodejs 18.17.10
      asdf global nodejs 18.17.10
fi

if ! asdf plugin-list | grep -q 'neovim'; then
      asdf plugin add neovim
      asdf install neovim 0.9.2
      asdf global neovim 0.9.2
fi

if ! asdf plugin-list | grep -q 'fzf'; then
      asdf plugin add fzf
      asdf install fzf 0.42.0
      asdf global fzf 0.42.0
fi

