#!/bin/bash

#-------------------------------------------------
# Script to install my dotfile configurations
# Inspired by the install script of Martin Toma
# @author Gilad Oved
# @version 1.0
#-------------------------------------------------

echo -e "Installing Gilad's dotfiles...\n"

#-------------------------------------------------
# Configuring neovim
#-------------------------------------------------
echo -e "~~~ NEOVIM ~~~"

# install neovim
echo -e "Installing neovim"
brew install neovim

# install vim plug
VIM_PLUG_DIR=~/.local/share/nvim/site/autoload/
if [ ! -f $VIM_PLUG_DIR/plug.vim ]; then
    echo -e "Installing Vim Plug"
    mkdir -p $VIM_PLUG_DIR
    curl -fLo $VIM_PLUG_DIR/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# backup current vim configs
BACKUP_VIM_DIR=~/.backup/vim
mkdir -p $BACKUP_VIM_DIR
mv ~/.vimrc $BACKUP_VIM_DIR
mv -r ~/.vim $BACKUP_VIM_DIR
# remove vim configs
rm ~/.vimrc
rm -rf ~/.vim

# backup current neovim configs
BACKUP_NEOVIM_DIR=~/.backup/neovim
mkdir -p $BACKUP_NEOVIM_DIR
mv -r ~/.nvim $BACKUP_NEOVIM_DIR
# remove neovim configs
rm -rf ~/.nvim

# create neovim folder
mkdir -p ~/.nvim

# apply neovim configs
echo -e "Applying neovim configs...\n"
ln -sf $PWD/neovim/nvimrc ~/.nvim/nvimrc


#-------------------------------------------------
# Configuring tmux
#-------------------------------------------------
# echo -e "~~~ tmux ~~~"


# if [ ! -f ~/.tmux.conf ]; then
# 	echo -e "Applying tmux configs...\n"
# 	ln -sf $PWD/tmux/tmux.conf ~/.tmux.conf
# elif [[ $1 = "-f" ]]; then
# 	echo -e "Replacing current tmux configs with new ones...\n"
# 	rm ~/.tmux.conf
# 	ln -sf $PWD/tmux/tmux.conf ~/.tmux.conf
# else
# 	echo -e "Tmux configs already exist on this machine. Rerun this script with the option '-f' to replace the current configs with the ones from the repo.\n"
# fi

# if [ ! -d ~/.tmux/plugins/tpm ]; then
#   echo -e "Installing tpm for tmux"
#   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
#   tmux source ~/.tmux.conf
# fi

#-------------------------------------------------
# Configuring zsh
#-------------------------------------------------
# echo -e "~~~ zsh ~~~"

# if [ ! -f ~/.zshrc ]; then
# 	echo -e "Applying zsh configs...\n"
# 	ln -sf $PWD/zsh/zshrc ~/.zshrc
# elif [[ $1 = "-f" ]]; then
# 	echo -e "Replacing current zsh configs with new ones...\n"
# 	rm ~/.zshrc
# 	ln -sf $PWD/zsh/zshrc ~/.zshrc
# else
# 	echo -e "zsh configs already exist on this machine. Rerun this script with the option '-f' to replace the current configs with the ones from the repo.\n"
# fi

# source ~/.zshrc

echo -e "\nThank you for installing Gilad's dotfiles!"
