#!/bin/bash

DOTFILES=$(cd $(dirname $0); pwd)

files=(
	.zshrc
	.tmux.conf
	.emacs
)

for file in ${files[@]}; do
	ln -vsf $DOTFILES/$file $HOME/$file
done
