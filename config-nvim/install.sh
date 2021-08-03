#!/bin/bash

# ---------------------------------------------------------
# Script for installing configuration files for nvim
# ---------------------------------------------------------

source bashutils.sh

# Make sure the nvim directory exists
[ ! -d ~/.config/nvim ] && mkdir -p ~/.config/nvim

vim_path="~/.config/nvim/init.vim"
abs_vim_path="${vim_path/#\~/$HOME}" # Substitute the ~ for the value in the $HOME variable

if [ -f "$abs_vim_path" ]; then
    mov "Backing up old init.vim file: $vim_path --> ./bak"
    mv $abs_vim_path bak
fi

cpy "Installing init.vim: ./config-nvim/init.vim --> $vim_path"
cp config-nvim/init.vim $abs_vim_path
