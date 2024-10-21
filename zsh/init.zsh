MY_HOME=$HOME/str
ZSH_CONFIG=$MY_HOME/doc/dot/zsh

source $ZSH_CONFIG/plugins.zsh
source $ZSH_CONFIG/prompt.zsh
source $ZSH_CONFIG/opts.zsh
source $ZSH_CONFIG/exports.zsh
source $ZSH_CONFIG/compinstall.zsh
source $ZSH_CONFIG/alias.zsh


[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
