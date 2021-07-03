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
ins() { echo -e "[${BLUE}${B}INS${NC}] ${@}${NC}"; }
mov() { echo -e "[${RED}${B}MOV${NC}] ${@}${NC}"; }
new() { echo -e "[${GREEN}${B}NEW${NC}] ${@}${NC}"; }
# -------------------------------------------------------------------
spinner() {
    pid=$! # Process Id of the previous running command    
    spin=('-' '\' '|' '/')
    #spin=('o--' '-o-' '--o' '-o-')
    #spin=("${RED}o${YELLOW}---" "-${RED}o${YELLOW}--" "--${RED}o${YELLOW}-" "---${RED}o${YELLOW}" "--${RED}o${YELLOW}-" "-${RED}o${YELLOW}--") # Only works if spin substitution is substituted without %s in the printf
    #spin=('o---' '-o--' '--o-' '---o' '--o-' '-o--')
    #spin=('----' 'o---' '-o--' '--o-' '---o' '----' '---o' '--o-' '-o--' 'o---')
    #spin=('----' 'o---' 'Oo--' 'oOo-' '-oOo' '--oO' '---o' '----' '---o' '--oO' '-oOo' 'oOo-' 'Oo--' 'o---')
    i=0
    while kill -0 $pid 2>/dev/null; do
      printf "\r[${YELLOW}%s${NC}] %s" "${spin[$i]}" "$1"
      sleep .1
      i=$(( (i+1) % ${#spin[@]} ))
    done
    printf "\r[${GREEN}Done${NC}] %s\n" "$1"
}
# -------------------------------------------------------------------
smart_brew() {
    prog="${BLUE}${B}$1${NC}"
    if brew list $1 &>/dev/null; then
        ins "$prog is already installed. Skipping."
    else 
        ins "Installing $prog"; brew install $1
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


# ----< Set up shell >----
# Make backup dir
if [ ! -d ./bak ]; then
    mkdir ./bak
    new "Made backup directory ${GREEN}${B}./bak${NC}. Files that conflict the install process will show up here."
fi

sleep 2 &
spinner 'Waiting for a thing'
