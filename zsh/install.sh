#!/bin/bash


# Detect the operating system package manager
if command -v apk &> /dev/null; then
    OS="alpine"
    PKG_INSTALL="apk add --no-cache"
elif command -v apt &> /dev/null; then
    OS="debian"
    PKG_INSTALL="apt update -y && apt install -y"
elif command -v dnf &> /dev/null; then
    OS="fedora"
    PKG_INSTALL="dnf install -y"
else
    echo "Unsupported operating system!"
    exit 1
fi

echo "Detected OS: $OS"

# Install required packages
echo "Installing Zsh, fontconfig, fzf, and ripgrep..."
$PKG_INSTALL zsh fzf fontconfig ripgrep git curl

# Check if Zsh was installed successfully
if ! command -v zsh &> /dev/null; then
    echo "Zsh could not be installed. Aborting."
    exit 1
fi

# Clone Oh My Zsh repository
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    git clone https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh"
else
    echo "Oh My Zsh already exists at $HOME/.oh-my-zsh."
    echo "Removing Oh My Zsh..."
    rm -rf $HOME/.oh-my-zsh
    rm -rf $HOME/.zshrc
    git clone https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh"
fi

# Clone essential Oh My Zsh plugins
git clone "https://github.com/zsh-users/zsh-syntax-highlighting.git" ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone "https://github.com/zsh-users/zsh-autosuggestions.git" ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone "https://github.com/zsh-users/zsh-completions.git" ~/.oh-my-zsh/custom/plugins/zsh-completions
git clone "https://github.com/romkatv/powerlevel10k.git" ~/.oh-my-zsh/custom/themes/powerlevel10k

# Change the default shell to Zsh
chsh -s $(which zsh)

{
    echo "# Enable Powerlevel10k instant prompt."
    echo "if [[ -r \"\${XDG_CACHE_HOME:-\$HOME/.cache}/p10k-instant-prompt-\${(%):-%n}.zsh\" ]]; then"
    echo "  source \"\${XDG_CACHE_HOME:-\$HOME/.cache}/p10k-instant-prompt-\${(%):-%n}.zsh\""
    echo "fi"
    echo ""
    echo "export ZSH=\"\$HOME/.oh-my-zsh\""
    echo "export EDITOR='nvim'"
    echo ""
    echo "ZSH_THEME=\"powerlevel10k/powerlevel10k\""
    echo ""
    echo "plugins=(git zsh-syntax-highlighting fzf zsh-autosuggestions zsh-completions)"
    echo ""
    echo "source \$ZSH/oh-my-zsh.sh"
    echo ""
    echo "[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh"
    echo "[ -f ~/.asdf/asdf.sh ] && . ~/.asdf/asdf.sh"
    echo ""
    echo "[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh"
} >> ~/.zshrc

echo "Installation completed! You may need to restart your terminal or log out and log back in."

# Extract and install fonts globally
if [ -f "fonts.tar.xz" ]; then
    echo "Extracting fonts..."
    mkdir -p ~/.fonts
    tar -xf fonts.tar.xz -C ~/.fonts --strip-components=1
    echo "Fonts installed globally."
    fc-cache -fv
fi
