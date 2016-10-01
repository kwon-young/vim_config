"   _____                        _____  _                
"  / ____|                      |  __ \(_)               
" | |     __ _ _ __ _ __   ___  | |  | |_  ___ _ __ ___  
" | |    / _` | '__| '_ \ / _ \ | |  | | |/ _ \ '_ ` _ \ 
" | |___| (_| | |  | |_) |  __/ | |__| | |  __/ | | | | |
"  \_____\__,_|_|  | .__/ \___| |_____/|_|\___|_| |_| |_|
"                  | |                                   
"                  |_|                                   
" Author: Kwon-Young Choi
" Date: 30/09/2016
"
" Description:
"   This is used to install a plugin manager and manage plugins.
"
" Compatibility: Vim and Neovim
"

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

if !empty(glob("~/.vim/autoload/plug.vim"))
  call plug#begin()
  Plug 'https://gist.github.com/5dff641d68d20ba309ce.git',
        \ {'as': 'vimawesome', 'do': 'mkdir -p plugin; cp -f *.vim plugin/'}
  call plug#end()
else
  echom "vim-plug couldn't be installed, check if curl and " . &shell " is installed."
endif
