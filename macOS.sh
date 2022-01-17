#!/bin/bash

# ---------------------------------------------------------------
# macOS install script - macOS.sh
# ---------------------------------------------------------------

# Dependencies
# - which
# - bash
# - sh

source bashutils.sh

# -------------------------------------------------------------------
install() { # Finds programs using brew
    prog="${BLUE}${B}$1${NC}"
    if brew list $1 &>/dev/null; then
        ins "$prog is already installed. Skipping."
    else 
        ins "Installing $prog"; brew install $1
    fi
}
install() { # Finds programs using which
    prog="${BLUE}${B}$1${NC}"
    if which $1 &>/dev/null; then
        ins "$prog is already installed. Skipping."
    else 
        ins "Installing $prog"; brew install $1
    fi
}
# -------------------------------------------------------------------

# Exit if any command in this script fails
# set -e
# trap error 'Encoutered a fatal error when executing install script. Exiting'

# Install Homebrew
if ! which brew &>/dev/null; then
    ins 'Homebrew'
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    info 'Homebrew already installed. Skipping'
fi

# Install good software

## The one and only good text editor
install nvim 'core'

## Shell
install fish 'core'

## Other
install lsd

## Pretty Printers
install yq
install jq
install delta

## Find / replace
install fzf
install rg
install fd

## Information / Documentation
install tldr
install cheat
install gotop


# Configure everything
./config-nvim/install.sh
#./config-fish/install.sh
