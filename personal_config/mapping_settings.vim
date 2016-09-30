"   _____                        _____  _                
"  / ____|                      |  __ \(_)               
" | |     __ _ _ __ _ __   ___  | |  | |_  ___ _ __ ___  
" | |    / _` | '__| '_ \ / _ \ | |  | | |/ _ \ '_ ` _ \ 
" | |___| (_| | |  | |_) |  __/ | |__| | |  __/ | | | | |
"  \_____\__,_|_|  | .__/ \___| |_____/|_|\___|_| |_| |_|
"                  | |                                   
"                  |_|                                   
" Author: Kwon-Young Choi
" Date: 29/09/2016
"
" Description:
"   This file contains all my personal mappings
"
" Compatibility: Vim and Neovim
"

let maploca=","
let mapleader="ù"

" Insert mode mappings {{{

" Escape
inoremap jk <Esc>
inoremap kj <Esc>

" U command in insert mode
inoremap <a-u> <esc>viw~ea
" }}}

" Normal mode mappings {{{

"Edit and source vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>eg :vsplit $MYGVIMRC<cr>
nnoremap <leader>sg :source $MYGVIMRC<cr>
" delete buffer without deleting split
nnoremap <leader>d :bp\|bd #<cr>
" }}}
