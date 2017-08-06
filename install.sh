#!/bin/bash

#-------------------------------------------------
# Script to install my dotfile configurations
# Inspired by the install script of Martin Toma
# @author Gilad Oved
# @version 1.0
#-------------------------------------------------

echo -e "Installing Gilad's dotfiles...\n"

#-------------------------------------------------
# Configuring tmux
#-------------------------------------------------
echo -e "~~~ tmux ~~~"


if [ ! -f ~/.tmux.conf ]; then
	echo -e "Applying tmux configs...\n"
	ln -sf $PWD/tmux/tmux.conf ~/.tmux.conf
elif [[ $1 = "-f" ]]; then
	echo -e "Replacing current tmux configs with new ones...\n"
	rm ~/.tmux.conf
	ln -sf $PWD/tmux/tmux.conf ~/.tmux.conf
else
	echo -e "Tmux configs already exist on this machine. Rerun this script with the option '-f' to replace the current configs with the ones from the repo.\n"
fi

if [ ! -d ~/.tmux/plugins/tpm ]; then
  echo -e "Installing tpm for tmux"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  tmux source ~/.tmux.conf
fi

#-------------------------------------------------
# Configuring vim
#-------------------------------------------------
echo -e "~~~ vim ~~~"

if [ ! -f ~/.vim/autoload/plug.vim ]; then
  echo -e "Installing Vim Plug"
  mkdir -p ~/.vim/autoload
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if [ ! -f ~/.vimrc ]; then
	echo -e "Applying vim configs...\n"
  mkdir ~/.vim/colors
	ln -sf $PWD/vim/base16-oceanicnext.vim ~/.vim/colors/base16-oceanicnext.vim
	ln -sf $PWD/vim/vimrc_background ~/.vimrc_background
	ln -sf $PWD/vim/vimrc.bundles ~/.vimrc.bundles
	ln -sf $PWD/vim/vimrc ~/.vimrc
elif [[ $1 = "-f" ]]; then
	echo -e "Replacing current vim configs with new ones...\n"
	rm ~/.vimrc
	rm ~/.vimrc.bundles
	rm ~/.vimrc_background
	rm -rf ~/.vim
	ln -sf $PWD/vim/base16-oceanicnext.vim ~/.vim/colors/base16-oceanicnext.vim
	ln -sf $PWD/vim/vimrc_background ~/.vimrc_background
	ln -sf $PWD/vim/vimrc.bundles ~/.vimrc.bundles
	ln -sf $PWD/vim/vimrc ~/.vimrc
else
	echo -e "Vim configs already exist on this machine. Rerun this script with the option '-f' to replace the current configs with the ones from the repo.\n"
fi


#-------------------------------------------------
# Configuring zsh
#-------------------------------------------------
echo -e "~~~ zsh ~~~"

if [ ! -f ~/.zshrc ]; then
	echo -e "Applying zsh configs...\n"
	ln -sf $PWD/zsh/zshrc ~/.zshrc
elif [[ $1 = "-f" ]]; then
	echo -e "Replacing current zsh configs with new ones...\n"
	rm ~/.zshrc
	ln -sf $PWD/zsh/zshrc ~/.zshrc
else
	echo -e "zsh configs already exist on this machine. Rerun this script with the option '-f' to replace the current configs with the ones from the repo.\n"
fi

source ~/.zshrc

echo -e "\nThank you for installing Gilad's dotfiles!"
