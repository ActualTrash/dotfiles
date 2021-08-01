#!/bin/bash

# ---------------------------------------------------------------
# Chase's dotfiles configuration scirpt
# ---------------------------------------------------------------

# Dependencies
# - bash
# - sh

source bashutils.sh

# Detect OS
os="$(uname)"

if [ "$os" = 'Darwin' ]; then
    info 'Detected macOS operating system'
    source macOS.sh
elif [ "$os" = 'Linux' ]; then
    info 'Detected Linux operating system'
    source linux.sh
else
    error "Unknown operating system $os"
    exit 1
fi

# Install kitty
#curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# Install useful utilities
install lsd
install yq
install jq
install fzf

# Install Shell
install fish


# ----< Set up shell >----
# Make backup dir
if [ ! -d ./bak ]; then
    mkdir ./bak
    new "Made backup directory ${GREEN}${B}./bak${NC}. Files that conflict the install process will show up here."
fi

sleep 2 &
spinner 'Waiting for a thing'
