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

brewInstall() { if brew ls --versions "$1"; then brew upgrade "$1"; else brew list "$1" || brew install "$1"; fi }

BACKUP_DIR=~/.backup

# backup current configs
echo -e "Backing up to ~/.backup"
mkdir -p $BACKUP_DIR
[ -f ~/.vimrc ] && cat ~/.vimrc > $BACKUP_DIR/vimrc && rm ~/.vimrc
[ -f ~/.nvim/nvimrc ] && cat ~/.nvim/nvimrc > $BACKUP_DIR/nvimrc && rm ~/.nvim/nvimrc
[ -f ~/.zshrc ] && cat ~/.zshrc > $BACKUP_DIR/zshrc && rm ~/.zshrc
[ -f ~/.tmux.conf ] && cat ~/.tmux.conf > $BACKUP_DIR/.tmux.conf && rm ~/.tmux.conf


#-------------------------------------------------
# Configuring neovim
#-------------------------------------------------
echo -e "~~~~~~ NEOVIM ~~~~~~\n"

echo -e "Installing neovim\n"
brewInstall neovim
echo -e "Installing fzf\n"
brewInstall fzf
/usr/local/opt/fzf/install

# setup neovim dir
NEOVIM_DIR=~/.config/nvim
mkdir -p $NEOVIM_DIR

# apply neovim configs
echo -e "Applying neovim configs\n"
ln -sf $PWD/neovim/init.vim $NEOVIM_DIR/init.vim
echo -e "~~~~~~~~~~~~~~~~~~~~\n"


#-------------------------------------------------
# Configuring tmux
#-------------------------------------------------
echo -e "~~~~~~ TMUX ~~~~~~"
echo -e "Installing tmux\n"
brewInstall tmux
brewInstall reattach-to-user-namespace
echo -e "Applying tmux configs...\n"
ln -sf $PWD/tmux/tmux.conf ~/.tmux.conf
if [ ! -d ~/.tmux/plugins/tpm ]; then
  echo -e "Installing tpm for tmux\n"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  tmux source ~/.tmux.conf
fi
echo -e "~~~~~~~~~~~~~~~~~~~~\n"

#-------------------------------------------------
# Configuring zsh
#-------------------------------------------------
echo -e "~~~~~~ ZSH ~~~~~~"

# install color theme
COLORTHEME_DIR=~/.config/oceanic-next-shell
if [ ! -d $COLORTHEME_DIR ]; then
  echo -e "Installing color theme"
  git clone https://github.com/mhartington/oceanic-next-shell.git ~/.config/oceanic-next-shell
fi

echo -e "Importing zsh configs"
ln -sf $PWD/zsh/zshrc ~/.zshrc
echo -e "~~~~~~~~~~~~~~~~~~~~\n"


# last steps and thank you
echo -e "Installation complete. The following actions are required before usage:"
echo -e "iTerm - add this command by sending the following text at start: tmux attach -t mysession || tmux new -s mysession"
echo -e "Ctrl-A I to install tmux plugins"
echo -e "1. Restart the terminal"
echo -e "2. Open vim"
echo -e "3. Enter the command :PlugInstall"
echo -e "4. Restart the terminal\n"
echo -e "Thank you for installing Gilad's dotfiles!"
