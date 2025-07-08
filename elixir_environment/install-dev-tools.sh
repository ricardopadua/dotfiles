#!/bin/sh
set -eux


git clone --depth=1 https://github.com/ricardopadua/dotfiles.git /tmp/dotfiles
mkdir -p /root/.config/nvim
cp -r /tmp/dotfiles/nvim/* /root/.config/nvim/

chmod +x /tmp/dotfiles/zsh/install.sh
/tmp/dotfiles/zsh/install.sh

chmod +x /tmp/dotfiles/asdf/install.sh
/tmp/dotfiles/asdf/install.sh

rm -rf /tmp/dotfiles

mkdir -p /opt/data
ln -s /opt/data /data

curl -fsSL --create-dirs https://raw.githubusercontent.com/ricardopadua/dotfiles/main/elixir_environment/.tool-versions -o /opt/data/.tool-versions

curl -fsSL --create-dirs https://raw.githubusercontent.com/ricardopadua/dotfiles/main/zsh/.zshrc.bkp -o /root/.zshrc
sed -i 's/plugins=(.*/plugins=(git zsh-syntax-highlighting fzf zsh-autosuggestions zsh-completions)/' /root/.zshrc
echo "export EDITOR='nvim'" >> /root/.zshrc
echo "source ~/.p10k.zsh" >> /root/.zshrc

curl -fsSL https://raw.githubusercontent.com/ricardopadua/dotfiles/main/zsh/.p10k.zsh.bkp -o /root/.p10k.zsh
