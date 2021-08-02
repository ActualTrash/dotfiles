#!/bin/bash

# ---------------------------------------------------------------
# Linux install script - linux.sh
# ---------------------------------------------------------------

# Dependencies
# - pacman

source bashutils.sh

install() {
    prog="${BLUE}${B}$1${NC}"
    if which $1 &>/dev/null; then
        ins "$prog is already installed. Skipping."
    else 
        ins "Installing $prog"
        #sudo pacman -S $1 --noconfirm
    fi
}

#while read line; do
#    prog="${BLUE}${B}$line${NC}"
#    ins "Installing $prog"
    #sudo pacman -S $line --noconfirm
#done <programs.txt
