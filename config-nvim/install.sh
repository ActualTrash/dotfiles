#!/bin/bash

# ---------------------------------------------------------
# Script for installing configuration files for nvim
# ---------------------------------------------------------

source bashutils.sh

# Make sure the nvim directory exists
mkdir -pv ~/.config/nvim

vim_path="~/.config/nvim/init.vim"
abs_vim_path="${vim_path/#\~/$HOME}" # Substitute the ~ for the value in the $HOME variable

dotfiles_path="~/dotfiles/config-nvim/init.vim"
abs_dotfiles_path="${dotfiles_path/#\~/$HOME}" # Substitute the ~ for the value in the $HOME variable

if [ -f "$abs_vim_path" ]; then
    mov "Backing up old init.vim file: $vim_path --> ./bak"
    mv $abs_vim_path bak
fi

# Make the links
lnk "Installing ${YELLOW}${B}init.vim${NC}: $vim_path --> $dotfiles_path"
ln -snf $abs_dotfiles_path $abs_vim_path

#cp config-nvim/init.vim $abs_vim_path
