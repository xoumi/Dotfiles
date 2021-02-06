alias f="vifm"
alias t="tmux"
alias n="nvim"
alias p="pnpm"
alias cc="clear"
alias install="sudo pacman -S"
alias fire="cd $FIREFOX_DIR" 

# exa is an alternative to ls
alias ls='exa -1'
alias l='exa -al'

# don't try this at home
alias rm="rm -rf"

# yea...
alias :q="exit"

# $HOME cleanup
# specify config files for programs that don't follow XDG
alias wget="wget --hsts-file $HOME/.cache/wget/history"
