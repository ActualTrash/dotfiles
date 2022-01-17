#!/bin/bash

# ---------------------------------------------------------------
# Linux install script - linux.sh
# ---------------------------------------------------------------

# Dependencies
# - pacman

source bashutils.sh

# ---------------------------------------------------------------
# Installs program(s) using the specified package manager
# Arguments
# $1 - Package manager. Either 'pac' (for pacman) or 'yay'
# $2 - Install type. 'core' if this package should always be installed
# $3 - Program(s) to install
i() {
    # Check whether we are doing a core install or a all install
    # If we are only doing a core install and 
    if [ $3 != 'core' && install_type = 'core' ]; then
        return
    fi

    # If the program is already installed, skip it
    prog="${BLUE}${B}$1${NC}"
    if which $1 &>/dev/null; then
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
if [ $1 = 'all' ]; then
    install_type='all'
fi

# A list of programs to install all at once to improve speed
pac_queue="" # pacman
yay_queue="" # yay
# ---------------------------------------------------------------


# Install kitty
if ! which kitty &>/dev/null; then
    ins 'Installing Kitty terminal'
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
fi

# Install good software

## The one and only good text editor
i pac 'core' nvim

## Package managers
i pac 'core' yay

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

## Pretty Printers
i pac 'core' yq
i pac 'core' jq
i pac 'core' delta

## Find / replace
i pac 'core' fzf
i pac 'core' rg
i pac 'core' fd

## Information / Documentation
i pac 'core' tldr
i pac 'core' cheat
i pac 'core' gotop

## Comms
i pac 'x-only' discord

## Browser
i pac 'x-only' brave


# Install everything in the queue
pacman -S $pac_queue
yay $yay_queue


# Configure everything
./configs-nvim/install.sh
#./configs-fish/install.sh
./configs-i3/install.sh # Make sure to put a check for x-only here
