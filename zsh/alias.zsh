alias n=nvim
alias cc=clear
alias cat=bat
alias install="sudo pacman -S"
alias lg=lazygit

alias rm="rm -rf"
alias :q="exit"

# $HOME cleanup
# specify config files for programs that don't follow XDG
alias wget="wget --hsts-file $HOME/.cache/wget/history"

alias ls="eza --icons -1"
alias ll="eza --icons -l --no-permissions --no-user --git"
alias la="eza --icons -la --no-permissions --no-user --git"

alias tn="project.sh"
alias ta="tmux attach"

alias nr="npm run"
alias login="aws codeartifact login --tool npm --repository livspace_npm_group --domain livspace-private"

