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

# Making directories and symbolic links
# For Vim
mkdir -p $HOME/.vim
mkdir -p $HOME/.vim/autoload
mkdir -p $HOME/.vim/plugged
mkdir -p $HOME/.vim/undo
mkdir -p $HOME/.vim/backup
mkdir -p $HOME/.vim/swp

ln -sf vimrc $HOME/.vimrc
ln -sf gvimrc $HOME/.gvimrc
ln -sf init.vim $HOME/.vim/init.vim
ln -sf ginit.vim $HOME/.vim/ginit.vim
ln -sf personal_config $HOME/.vim/personal_config
ln -sf plug_config $HOME/.vim/plug_config

# For Neovim
mkdir -p $HOME/.local/share/nvim/swp

ln -sf $HOME/.vim $HOME/.config/nvim
ln -sf $HOME/.config/nvim/backup $HOME/.local/share/nvim/backup
ln -sf $HOME/.config/nvim/undo $HOME/.local/share/nvim/undo