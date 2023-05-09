if status is-interactive
    # Commands to run in interactive sessions can go here
end

set HW '/Users/Chase/Documents/school/UVA/2023-spring'

alias ls='lsd'
alias l='ls -lah'
alias c='clear'
alias hw="cd $HW"
alias vfzf='nvim (fzf)'
alias docs='cd ~/Documents'
alias wd='whatsdue'

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

set fish_prompt_pwd_dir_length 0

#set fish_key_bindings fish_user_key_bindings
source ~/.config/fish/functions/fish_user_keybindings.fish
set fish_key_bindings fish_user_key_bindings

fish_add_path ~/scripts

# CS4620 (Compilers) Environment stuff for TIPC
export LLVM_DIR=/usr/local/opt/llvm@14/lib/cmake
export TIPCLANG=/usr/local/opt/llvm@14/bin/clang
