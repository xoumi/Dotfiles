ZSH_CONFIG=$HOME/dot/zsh

source $ZSH_CONFIG/plugins.zsh
source $ZSH_CONFIG/prompt.zsh
source $ZSH_CONFIG/opts.zsh
source $ZSH_CONFIG/exports.zsh
source $ZSH_CONFIG/compinstall.zsh
source $ZSH_CONFIG/alias.zsh


[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
