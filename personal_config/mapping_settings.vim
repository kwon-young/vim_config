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

" layout specific {{{

let s:max_layout = 2

if exists("s:layout")
  "echo "layout exist"
else
  let s:layout = 0
endif

if s:layout == 0
  let mapleader = "'"
elseif s:layout == 1
  let mapleader = "ù"
  let maploca = ","
endif

function! SetLayout()
  if s:layout == 0
    "echo "using qwerty layout"
    nnoremap ; :
    nnoremap : ;
    vnoremap ; :
    vnoremap : ;
  elseif s:layout == 1
    "echo "using azerty layout"
    nunmap ;
    nunmap :
  endif
endfunction

function! ToggleLayout()
  let s:layout = (s:layout + 1) % s:max_layout
  echo "now source your conf"
endfunction

call SetLayout()

" }}}

" Insert mode mappings {{{

" Escape
inoremap jk <Esc>
inoremap kj <Esc>

" U command in insert mode
inoremap <a-u> <esc>viw~ea
" remap i_ctrl-r to alt-r
inoremap <a-r> <c-r>
" }}}

" Normal mode mappings {{{

"Edit and source vimrc {{{
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>eg :vsplit $MYGVIMRC<cr>
nnoremap <leader>sg :source $MYGVIMRC<cr>
" }}}

" Edit note file {{{
nnoremap <leader>en :edit $HOME/.local/share/nvim/note.md<CR>
nnoremap <leader>exn :vsplit $HOME/.local/share/nvim/note.md<CR>
nnoremap <leader>esn :split $HOME/.local/share/nvim/note.md<CR>
nnoremap <leader>etn :tabedit $HOME/.local/share/nvim/note.md<CR>
" }}}

" delete buffer without deleting split
nnoremap <leader>d :bp\|bd #<cr>

" alt mappings {{{
" switching split
nnoremap <a-l> :wincmd l<CR>
nnoremap <a-k> :wincmd k<CR>
nnoremap <a-j> :wincmd j<CR>
nnoremap <a-h> :wincmd h<CR>
" scroll with alt
nnoremap <a-f> <c-e><c-e>
nnoremap <a-d> <c-y><c-y>
" move to comfortable_motion plugin
" }}}

" Add ; at the end of line
nnoremap <leader>; mqA;<esc>`q

" Show/unshow trailing space
nnoremap <leader>w :match ExtraWhiteSpace /\v\s+$/<cr>
nnoremap <leader>W :match none<cr>
" Remove search highlight
noremap <leader>h :nohlsearch<cr>
" Next and previous quickfix error
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

" macros {{{
" }}}
