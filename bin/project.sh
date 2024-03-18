#!/bin/zsh

WORK_DIR=$HOME/str/doc/work
SELECTED_DIR=$(ls $WORK_DIR | fzf-tmux -p)

if [[ ! "$TERM_PROGRAM" = tmux ]]; then
  tmux new -n $SELECTED_DIR -c $WORK_DIR/$SELECTED_DIR
else
  tmux new-window -n $SELECTED_DIR -c $WORK_DIR/$SELECTED_DIR
fi
