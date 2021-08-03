#!/bin/bash

# ------------------------------------------------------------------------------
# Script for installing configuration files for fish - config-fish/install.sh
# ------------------------------------------------------------------------------

source bashutils.sh

dirpath="~/.config/fish"
abs_dirpath="${dirpath/#\~/$HOME}" # Substitute the ~ for the value in the $HOME variable
path="$dirpath/config.fish"
abs_path="$abs_dirpath/config.fish"

# Make sure the nvim directory exists
[ ! -d "$abs_dirpath" ] && mkdir -p "$abs_dirpath"

if [ -f "$abs_path" ]; then
    mov "Backing up old config.fish file: $path --> ./bak"
    mv $abs_path bak
fi

cpy "Installing init.vim: ./config-nvim/init.vim --> $path"
cp config-fish/config.fish $abs_path
