[[ -r ~/.cache/zsh/znap/znap.zsh ]] ||
  git clone --depth 1 -- \
    https://github.com/marlonrichert/zsh-snap.git ~/.cache/zsh/znap
source ~/.cache/zsh/znap/znap.zsh

znap source zsh-users/zsh-syntax-highlighting
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-completions
znap source agkozak/zsh-z

