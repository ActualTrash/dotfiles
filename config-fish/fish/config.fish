if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Remove welcome message
set fish_greeting

alias ls='lsd'
alias l='ls -lah'
alias c='clear'
alias hw="cd $HW"
alias vfzf='nvim (fzf)'
alias docs='cd ~/Documents'
alias ip='ip -c'

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

set fish_prompt_pwd_dir_length 0

source ~/.config/fish/functions/fish_user_keybindings.fish
set fish_key_bindings fish_user_key_bindings

fish_add_path ~/.cargo/bin
alias steamcmd='sudo -u steam steamcmd'
alias key='cat ~/.ssh/id_ed25519.pub | wl-copy'

starship init fish | source
