#!/bin/bash

# ---------------------------------------------------------------
# macOS install script - macOS.sh
# ---------------------------------------------------------------

# Dependencies
# - bash
# - sh

source bashutils.sh

# -------------------------------------------------------------------
install() {
    prog="${BLUE}${B}$1${NC}"
    if brew list $1 &>/dev/null; then
        ins "$prog is already installed. Skipping."
    else 
        ins "Installing $prog"; brew install $1
    fi
}
# -------------------------------------------------------------------

# Install Homebrew
ins 'Homebrew'
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
