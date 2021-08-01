#!/bin/bash

# ---------------------------------------------------------------
# Linux install script - linux.sh
# ---------------------------------------------------------------

# Dependencies
# - pacman

source bashutils.sh

while read line; do
    prog="${BLUE}${B}$line${NC}"
    ins "Installing $prog"
    sudo pacman -S $line --noconfirm
done <programs.txt
