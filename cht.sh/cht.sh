#!/bin/bash
selected=`cat ~/.tmux-cht-languages ~/.tmux-cht-command | fzf`
if [[ -z $selected ]]; then
    exit 0
fi

read -p "Enter Query: " query

if grep -qs "$selected" ~/.tmux-cht-languages; then
    tmux neww bash -c "curl cht.sh/$selected/`echo $query | tr ' ' '+'` &  while [ : ]; do sleep 1; done"
else
    tmux neww bash -c "curl cht.sh/$selected~`echo $query | tr ' ' '+'` &  while [ : ]; do sleep 1; done"
fi
