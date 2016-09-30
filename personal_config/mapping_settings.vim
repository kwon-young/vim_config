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
" Switching split with alt {{{
nnoremap <a-l> :wincmd l<CR>
nnoremap <a-k> :wincmd k<CR>
nnoremap <a-j> :wincmd j<CR>
nnoremap <a-h> :wincmd h<CR>
" scroll with alt
nnoremap <a-f> <c-e><c-e>
nnoremap <a-d> <c-y><c-y>

" Add ; at the end of line
nnoremap <leader>; mqA;<esc>`q

" Show/unshow trailing space
nnoremap <leader>w :match ExtraWhiteSpace /\v\s+$/<cr>
nnoremap <leader>W :match none<cr>
" Remove search highlight
noremap <leader>h :nohlsearch<cr>
nnoremap <leader>n :cnext<cr>
nnoremap <leader>N :cprevious<cr>
" diffupdate to du
nnoremap du :diffupdate<CR>

" Add very magic to search command
nnoremap / /\v
nnoremap ? ?\v
" }}}

" F1-12 mappings {{{
" }}}
