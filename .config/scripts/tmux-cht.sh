#!/usr/bin/env bash
selected=`cat ~/.config/scripts/.tmux-cht-languages ~/.config/scripts/.tmux-cht-commands | fzf`
if [[ -z $selected ]]; then
    exit 0
fi

read -p "Enter Query: " query

if grep -qs "$selected" ~/.tmux-cht-languages; then
    query=`echo $query | tr ' ' '+'`
    tmux neww bash -c "echo \"cht.sh $selected $query\" & cht.sh $selected $query & while [ : ]; do sleep 1; done"
else
    tmux neww bash -c "cht.sh $selected $query | less"
fi

