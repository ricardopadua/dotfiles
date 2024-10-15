#!/bin/bash

# Extract and install nvim config
if [ -f "nvim/.init.lua" ]; then
    echo "move config..."
    cp -rfvp nvim/init.lua 	 ~/.config/nvim/
    cp -rfvp nvim/lua 		 ~/.config/nvim/
    cp -rfvp nvim/plugin		 ~/.config/nvim/
    echo "Neovim custom installed."
fi

echo "Installation completed! You may need to restart your terminal or log out and log back in."


