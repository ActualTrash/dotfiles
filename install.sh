#!/bin/bash

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install kitty
#curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# Install useful utilities
brew install lsd yq jq fzf
