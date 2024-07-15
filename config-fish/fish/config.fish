if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Remove welcome message
set fish_greeting
#set HW '/Users/Chase/Documents/school/UVA/2023-fall'

alias ls='lsd'
alias l='ls -lah'
alias c='clear'
#alias hw="cd $HW"
alias vfzf='nvim (fzf)'
alias docs='cd ~/Documents'
alias ip='ip -c'
#alias key='pbcopy < ~/.ssh/id_ed25519.pub' # macOS
alias key='cat ~/.ssh/id_ed25519.pub | wl-copy' # Linux
alias steamcmd='sudo -u steam steamcmd'

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

set fish_prompt_pwd_dir_length 0

source ~/.config/fish/functions/fish_user_keybindings.fish
set fish_key_bindings fish_user_key_bindings

fish_add_path ~/.cargo/bin

starship init fish | source
