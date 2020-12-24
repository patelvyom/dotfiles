#!/usr/bin/bash

files=("aliasrc" "bashrc" "p10k.zsh" "profile" "vimrc" "zshrc" "vim")

for file in "${files[@]}"
do
	cp -r ".$file" ~/test/
done

