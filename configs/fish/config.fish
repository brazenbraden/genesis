starship init fish | source
atuin init fish | source

set -gx BROWSER wslview

alias dc="docker compose"
alias ll="ls -lAh"
alias vim="nvim"
alias vi="nvim"
alias tm="~/.bin/tm"
alias mux="tmuxinator"
alias dev="cd ~/dev"
alias jb="cd ~/dev/brazenbraden/jugglebee"
alias cop="gh copilot explain"
alias g="git"
alias reload="source ~/.config/fish/config.fish"

eval "$(rbenv init -)"

eval (ssh-agent -c)
ssh-add ~/.ssh/jugglebee
