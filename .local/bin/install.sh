#!/usr/bin/env bash

# Install dotfiles

echo ":: Check if rsync is installed"

if [[ $( which rsync ) == 0 ]]
then
	echo ":: OK"
	sleep 0.5
	echo ":: Installing files"
	cd $HOME && rsync -va dotfiles/ $HOME
	return 0
else
	echo "ERR: Rsync is not installed. Dotfiles bootstrap can not be continued"
	return 1
fi 



