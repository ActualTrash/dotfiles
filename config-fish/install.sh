#!/bin/bash

# ------------------------------------------------------------------------------
# Script for installing configuration files for fish - config-fish/install.sh
# ------------------------------------------------------------------------------

source bashutils.sh

# ~/.config is assumed to exist
path="~/.config/fish"
abs_path="${path/#\~/$HOME}" # Substitute the ~ for the value in the $HOME variable

dotfiles_path="~/dotfiles/config-fish/fish"
abs_dotfiles_path="${dotfiles_path/#\~/$HOME}" # Substitute the ~ for the value in the $HOME variable

# If the directory exists, back it up.
if [ -d "$abs_path" ]; then
    mov "Backing up old config.fish file: $path --> ./bak"
    [ -d "bak/fish" ] && rm -rf bak/fish # Delete the old backup
    mv $abs_path bak
fi

# cpy "Installing fish config: ./config-fish/fish --> $path"
# cp -r config-fish/fish ~/.config/fish
lnk "Installing ${YELLOW}fish${NC} config: $path --> $dotfiles_path"
ln -vsnf $abs_dotfiles_path $abs_path
