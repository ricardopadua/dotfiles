#!/bin/bash
# Ricardo Padua

# Define the ASDF directory for the current user
ASDF_DIR="$HOME/.asdf"

# Check if asdf directory already exists
if [ -d "$ASDF_DIR" ]; then
  TIMESTAMP=$(date +"%Y%m%d%H%M%S")
  BACKUP_DIR="${ASDF_DIR}_backup_${TIMESTAMP}"
  echo "Directory $ASDF_DIR exists. Renaming to $BACKUP_DIR..."
  mv "$ASDF_DIR" "$BACKUP_DIR"
  echo "Backup created at $BACKUP_DIR"
fi

# Clone the ASDF GitHub repository
echo "Cloning ASDF repository..."
git clone https://github.com/asdf-vm/asdf.git "$ASDF_DIR" --branch v0.14.1

# Define the file to modify
BASH_FILE="$HOME/.zshrc"

# Define the line to ensure is in the file
LINE='. "$HOME/.asdf/asdf.sh"'

# Check and update the line in the file
if grep -qF "$LINE" "$BASH_FILE"; then
  echo "Line already present: $LINE"
  # Replace the line if it exists
  sed -i "s|^\. \"$HOME/.asdf/asdf.sh\"|$LINE|" "$BASH_FILE"
else
  echo "Adding line: $LINE"
  echo "$LINE" >> "$BASH_FILE"
fi

# Reload the configuration
echo "Loading asdf configuration..."
. $HOME/.asdf/asdf.sh

# List all installed plugins
plugins=$(asdf plugin list)

# Check if there are any plugins installed and remove them
if [ -n "$plugins" ]; then
  for plugin in $plugins; do
    echo "Removing plugin: $plugin"
    asdf plugin remove "$plugin"
  done
  echo "All plugins removed."
fi

echo "Adding Erlang plugin..."
asdf plugin add erlang

echo "Adding Elixir plugin..."
asdf plugin add elixir

echo "Adding Rust plugin..."
asdf plugin add rust https://github.com/asdf-community/asdf-rust.git

echo "Adding Lua plugin..."
asdf plugin add lua https://github.com/Stratus3D/asdf-lua.git

echo "Adding Node.js plugin..."
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git

echo "Adding Neovim plugin..."
asdf plugin add neovim

# Ensure the .tool-versions file exists
TOOL_VERSIONS_FILE="$HOME/dotfiles/asdf/.tool-versions"

# Install tools specified in .tool-versions
echo "Installing tools specified in $TOOL_VERSIONS_FILE..."
cd "$HOME/dotfiles/asdf" && asdf install
echo "Tools installed."

# Set global versions for tools based on the .tool-versions file
echo "Setting global tool versions from $TOOL_VERSIONS_FILE..."
while IFS= read -r line; do
  tool=$(echo "$line" | cut -d ' ' -f 1)
  version=$(echo "$line" | cut -d ' ' -f 2)
  echo "Setting global version for $tool to $version..."
  asdf global $tool $version

done < "$TOOL_VERSIONS_FILE"

cd ~/.dotfiles/asdf/
asdf install
echo "Installation script completed."


