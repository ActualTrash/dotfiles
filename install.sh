#!/bin/bash

# ---------------------------------------------------------------
# Chase's dotfiles confugiration scirpt
# ---------------------------------------------------------------

# Dependencies
# - bash
# - sh

# Colors
RED='\033[0;31m'
YELLOW='\033[0;33m'
PINK='\033[0;35m'
RED_BG='\033[0;41m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'
B=$(tput bold)

# Loggers
info() { echo -e "[${BLUE}${B}*${NC}] ${@}${NC}"; }
error() { echo -e "[${RED}-${NC}] ${RED}${@}${NC}"; }
panic() { echo -e "[${RED_BG}PANIC${NC}] ${RED_BG}${@}${NC}"; }
success() { echo -e "[${GREEN}+${NC}] ${GREEN}${@}${NC}"; }
# -------------------------------------------------------------------
spinner() {
    pid=$! # Process Id of the previous running command    
    spin='-\|/'
    i=0
    while kill -0 $pid 2>/dev/null
    do
      i=$(( (i+1) %4 ))
      printf "\r[${YELLOW}%s${NC}] %s" "${spin:$i:1}" "$1"
      sleep .1
    done
    printf "\r[${GREEN}Done${NC}] %s\n" "$1"
}
# -------------------------------------------------------------------
smart_brew() {
    prog="${BLUE}${B}$1${NC}"
    if brew list $1 &>/dev/null; then
        info "$prog is already installed. Skipping."
    else 
        info "Installing $prog"; brew install $1
    fi
}
# -------------------------------------------------------------------

# Install Homebrew
#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install kitty
#curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# Install useful utilities
smart_brew lsd
smart_brew yq
smart_brew jq
smart_brew fzf

# Install Shell
smart_brew fish


sleep 3 &
spinner 'Waiting for a long task'


sleep .1 &
spinner 'Installing scripts'
sleep .1 &
spinner 'Installing stuff'
sleep 3.8 &
spinner 'Installing more stuff'
sleep 1.9 &
spinner 'Installing moist stuff'
sleep .3 &
spinner 'Installing ss'
sleep .7 &
spinner 'Installing sussy'
