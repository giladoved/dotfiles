#!/bin/bash

#-------------------------------------------------
# Script to install my dotfile configurations
# Inspired by the install script of Martin Toma
# @author Gilad Oved
# @version 1.0
#-------------------------------------------------

echo -e "#-------------------------------------------------"
echo -e "# Gilad Dotfiles Installation"
echo -e "#-------------------------------------------------"
echo -e ""


#-------------------------------------------------
# Global vars & functions
#-------------------------------------------------

brewInstall() { if brew ls --versions "$1"; then brew upgrade "$1"; else brew install "$1"; fi }

BACKUP_DIR=~/.backup


#-------------------------------------------------
# Configuring neovim
#-------------------------------------------------
echo -e "~~~~~~ NEOVIM ~~~~~~"

# install neovim
echo -e "... Neovim"
brewInstall neovim

# backup current configs
echo -e "... Backing up to ~/.backup"
mkdir -p $BACKUP_DIR
[ -f ~/.vimrc ] && cat ~/.vimrc > $BACKUP_DIR/vimrc && rm ~/.vimrc
[ -f ~/.nvim/nvimrc ] && cat ~/.nvim/nvimrc > $BACKUP_DIR/nvimrc && rm ~/.nvim/nvimrc
[ -f ~/.zshrc ] && cat ~/.zshrc > $BACKUP_DIR/zshrc && rm ~/.zshrc

# setup neovim dir
NEOVIM_DIR=~/.config/nvim
mkdir -p $NEOVIM_DIR

# apply neovim configs
echo -e "... Applying neovim configs"
ln -sf $PWD/neovim/init.vim $NEOVIM_DIR/init.vim
echo -e "~~~~~~~~~~~~~~~~~~~~\n"


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
echo -e "~~~~~~ ZSH ~~~~~~"

# install color theme
COLORTHEME_DIR=~/.config/oceanic-next-shell
if [ ! -d $COLORTHEME_DIR ]; then
  echo -e "... Color theme"
  git clone https://github.com/mhartington/oceanic-next-shell.git ~/.config/oceanic-next-shell
fi

echo -e "... Importing zsh configs"
ln -sf $PWD/zsh/zshrc ~/.zshrc
echo -e "~~~~~~~~~~~~~~~~~~~~\n"


# last steps and thank you
echo -e "Installation complete. The following actions are required before usage:"
echo -e "1. Open vim"
echo -e "2. Enter the command :PlugInstall"
echo -e "3. Restart the terminal\n"
echo -e "Thank you for installing Gilad's dotfiles!"
