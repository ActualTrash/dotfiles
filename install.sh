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


# Install Shell
install fish

# Install useful utilities
install lsd
install yq
install jq
install fzf
install tldr

# Install config files
./configs.sh
