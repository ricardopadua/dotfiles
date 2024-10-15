#!/bin/bash

# Define the ASDF directory for the current user
ASDF_DIR="$HOME/.asdf"

# Check if asdf directory exists
if [ -d "$ASDF_DIR" ]; then
  echo "Removing ASDF directory at $ASDF_DIR..."
  rm -rf "$ASDF_DIR"
  echo "ASDF directory removed."
else
  echo "ASDF directory does not exist. Nothing to remove."
fi

# Define the file to modify
BASH_FILE="$HOME/.zshrc"

# Define the line to remove
LINE='. "$HOME/.asdf/asdf.sh"'

# Check and remove the line from the file
if grep -qF "$LINE" "$BASH_FILE"; then
  echo "Removing line: $LINE"
  sed -i "\|$LINE|d" "$BASH_FILE"
else
  echo "Line not found: $LINE"
fi

# Optionally, remove the .tool-versions file if it exists
TOOL_VERSIONS_FILE="$HOME/dotfiles/asdf/.tool-versions"
if [ -f "$TOOL_VERSIONS_FILE" ]; then
  echo "Removing .tool-versions file at $TOOL_VERSIONS_FILE..."
  rm "$TOOL_VERSIONS_FILE"
  echo ".tool-versions file removed."
else
  echo ".tool-versions file does not exist."
fi

echo "Cleanup script completed."

