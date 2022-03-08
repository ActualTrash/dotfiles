#!/bin/bash

# ---------------------------------------------------------------
# Linux install script - linux.sh
# ---------------------------------------------------------------

# Dependencies
# - pacman
# - curl
# - makepkg

source bashutils.sh

# Exit on errors
# set -e

# ---------------------------------------------------------------
# Installs program(s) using the specified package manager
# Arguments
# $1 - Package manager. Either 'pac' (for pacman) or 'yay'
# $2 - Install type. 'core' if this package should always be installed
# $3 - Program(s) to install
# $4 - [Optional] The name to check if the package is installed
i() {
    # Check whether we are doing a core install or a all install
    # If we are only doing a core install and 
    if [ "$2" != 'core' ] && [ "$install_type" = 'core' ]; then
        return
    fi

    # If the program is already installed, skip it
    prog="${BLUE}${B}$3${NC}"
    if which $3 &>/dev/null; then
        ins "$prog is already installed. Skipping."
        return
    fi

    #ins "Installing $prog"
    ins "Queueing $prog for installation"

    if [ $1 = 'pac' ]; then
        pac_queue="$pac_queue $3"
    elif [ $1 = 'yay' ]; then
        yay_queue="$yay_queue $3"
    else
        error "Invalid argument to install function: $1"
        exit 1
    fi
}
# ---------------------------------------------------------------
# Set the installation type
install_type='core'
if [ "$1" = 'all' ]; then
    install_type='all'
fi

# A list of programs to install all at once to improve speed
pac_queue="" # pacman
yay_queue="" # yay
# ---------------------------------------------------------------

# Install yay

if [ ! which $3 &>/dev/null ]; then
    ins Installing yay
    sudo pacman -S --needed git base-devel
    if [ ! -d yay-bin ]; then
    	git clone https://aur.archlinux.org/yay-bin.git
    fi
    cd yay-bin
    makepkg -si
    cd ..
    rm -rf yay-bin
fi

# Install kitty
# if ! which kitty &>/dev/null; then
#    ins 'Installing Kitty terminal'
#    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
#fi

# Install good software
# Format:
# i <pkg manager> <pkg type> <pkg name> [cmd name]

## The one and only good text editor
i pac 'core' neovim #nvim
i pac 'core' nodejs # Dependency of coc vim plugin

## Shell
i pac 'core' fish

## X Stuff
i pac 'x-only' xserver
i yay 'x-only' i3-gaps
i yay 'x-only' jonaburg-picom
i pac 'x-only' xrandr
i pac 'x-only' feh

## Audio
i pac 'x-only' alsamixer
# TODO: That other audio driver that was good

## General utility
i pac 'core' lsd
i pac 'core' openssh

## Pretty Printers
i pac 'core' yq
i pac 'core' jq
i pac 'core' git-delta #delta

## Find / replace
i pac 'core' fzf
i pac 'core' ripgrep #rg
i pac 'core' fd

## Information / Documentation
i pac 'core' tldr
i yay 'core' cheat
i yay 'core' gotop-bin #gotop

## Comms
i pac 'x-only' discord

## Browser
i pac 'x-only' brave


# Install everything in the queue
sudo pacman -Sy $pac_queue
yay $yay_queue

# Configure everything
# ./configs.sh
# ./config-nvim/install.sh

# Install vimplug (vim plugin manager)
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

#./config-fish/install.sh
# ./config-i3/install.sh # Make sure to put a check for x-only here
