#!/bin/sh

dotfiles_dir=`dirname $0`

cd $dotfiles_dir

for f in .??*
do
	[ "$f" = ".git" ] && continue
	ln -snfv "$dotfiles_dir/$f" "$HOME/$f"
done
