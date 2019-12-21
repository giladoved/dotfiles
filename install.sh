#!/bin/bash

#-------------------------------------------------
# Script to install my dotfile configurations
# Inspired by the install script of Martin Toma
# @author Gilad Oved
# @version 1.0
#-------------------------------------------------

echo -e "#-------------------------------------------------"
echo -e "# Setting Gilad Dotfiles"
echo -e "#-------------------------------------------------"
echo -e ""


#-------------------------------------------------
# Util functions
#-------------------------------------------------

brewInstall() { if brew ls --versions "$1"; then brew upgrade "$1"; else brew install "$1"; fi }


#-------------------------------------------------
# Configuring neovim
#-------------------------------------------------
echo -e "~~~~~~ NEOVIM ~~~~~~"

# install neovim
echo -e "... Neovim"
brewInstall neovim

# backup current configs
BACKUP_DIR=~/.backup
mkdir -p $BACKUP_DIR
[ -f ~/.vimrc ] && cat ~/.vimrc > $BACKUP_DIR/vimrc && rm ~/.vimrc
[ -f ~/.nvim/nvimrc ] && cat ~/.nvim/nvimrc > $BACKUP_DIR/nvimrc && rm ~/.nvim/nvimrc

# apply neovim configs
echo -e "Applying neovim configs...\n"
NEOVIM_DIR=~/.config/nvim
mkdir -p $NEOVIM_DIR
ln -sf $PWD/neovim/init.vim $NEOVIM_DIR/init.vim

# install vim plug
VIM_PLUG_DIR=~/.config/nvim/autoload
if [ ! -f $VIM_PLUG_DIR/plug.vim ]; then
    echo -e "... Vim Plug"
    mkdir -p $VIM_PLUG_DIR
    curl -fLo $VIM_PLUG_DIR/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi


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
