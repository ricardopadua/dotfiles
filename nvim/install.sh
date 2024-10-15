#!/bin/bash

# Extract and install nvim config
if [ -f ".init.lua" ]; then
    echo "move config..."
    mv init.lua 	 ~/.config/nvim/
    mv lua 		 ~/.config/nvim/
    mv plugin		 ~/.config/nvim/
    echo "Neovim custom installed."
fi

echo "Installation completed! You may need to restart your terminal or log out and log back in."


