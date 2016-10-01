#!/bin/sh
#   _____                        _____  _                
#  / ____|                      |  __ \(_)               
# | |     __ _ _ __ _ __   ___  | |  | |_  ___ _ __ ___  
# | |    / _` | '__| '_ \ / _ \ | |  | | |/ _ \ '_ ` _ \ 
# | |___| (_| | |  | |_) |  __/ | |__| | |  __/ | | | | |
#  \_____\__,_|_|  | .__/ \___| |_____/|_|\___|_| |_| |_|
#                  | |                                   
#                  |_|                                   
# Author: Kwon-Young Choi
# Date: 01/10/2016
#
# Description:
#   Automated installation script for installing my vim config.
#
# Compatibility: Vim and Neovim
#

# Cleaning installation
rm -rf $HOME/.vim
rm -rf $HOME/.vimrc
rm -rf $HOME/.gvimrc
rm -rf $HOME/.config/nvim
rm -rf $HOME/.local/share/nvim

# Making directories and symbolic links
# For Vim
mkdir -p $HOME/.vim
mkdir -p $HOME/.vim/autoload
mkdir -p $HOME/.vim/plugged
mkdir -p $HOME/.vim/undo
mkdir -p $HOME/.vim/backup
mkdir -p $HOME/.vim/swp

ln -sf "$(readlink -e "vimrc")" $HOME/.vimrc
ln -sf "$(readlink -e "gvimrc")" $HOME/.gvimrc
ln -sf "$(readlink -e "init.vim")" $HOME/.vim/init.vim
ln -sf "$(readlink -e "ginit.vim")" $HOME/.vim/ginit.vim
ln -sf "$(readlink -e "personal_config")" $HOME/.vim/personal_config
ln -sf "$(readlink -e "plug_config")" $HOME/.vim/plug_config

# For Neovim
mkdir -p $HOME/.local/share/nvim/swp

ln -sf $HOME/.vim $HOME/.config/nvim
ln -sf $HOME/.config/nvim/backup $HOME/.local/share/nvim/backup
ln -sf $HOME/.config/nvim/undo $HOME/.local/share/nvim/undo
