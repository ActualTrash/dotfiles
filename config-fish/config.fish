if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias ls='lsd'
alias l='ls -lah'
alias c='clear'
alias hw='cd ~/Documents/school/UVA/2021-fall'

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

set fish_prompt_pwd_dir_length 0
