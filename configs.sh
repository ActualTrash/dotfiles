#!/bin/bash

# ---------------------------------------------------------------
# Sets up configuration files
# ---------------------------------------------------------------

# Dependencies
# - bash
# - sh

source bashutils.sh

# Make backup dir
if [ ! -d ./bak ]; then
    mkdir ./bak
    new "Made backup directory ${GREEN}${B}./bak${NC}. Files that conflict the install process will show up here."
fi


# Configure nvim
info 'Configuring nvim'
./config-nvim/install.sh
info 'Configuring fish'
./config-fish/install.sh
