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

# Install kitty
if ! which kitty &>/dev/null; then
    ins 'Installing Kitty terminal'
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
fi

# Install good software
install yay

#while read line; do
    #prog="${BLUE}${B}$line${NC}"
    #ins "Installing $prog"
    #install $line
#done <programs.txt
