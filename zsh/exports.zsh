export HIST_STAMPS="dd.mm.yyyy"
export HISTFILE=$HOME/.cache/zsh/history
export HISTSIZE=1000
export SAVEHIST=1000
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
export STARSHIP_CONFIG=~/.config/zsh/starship.toml
export NVM_DIR="$HOME/.config/nvm"
export DOT_DIR="$MY_HOME/doc/dot"
export PATH="$PATH:$DOT_DIR/bin"
export fpath=($fpath $ZSH_CONFIG/functions)

# Use bat to colorize man
export MANPAGER="zsh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

# silent npm logs
export DISABLE_OPENCOLLECTIVE=1
export ADBLOCK=1

export KEYTIMEOUT=1
export QT_AUTO_SCREEN_SCALE_FACTOR=0 zeal
export BROWSER=/usr/bin/firefox
export EDITOR='nvim'

