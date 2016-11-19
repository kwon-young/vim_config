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
"   This file contains settings for the neovim terminal
"
" Compatibility: Neovim only
"

" Terminal settings {{{
augroup terminal
  autocmd!
  autocmd TermOpen * setlocal nospell
augroup END
set shell=zsh
" }}}

" Mappings {{{
" exit insert mode in terminal
tnoremap jk <C-\><C-n>
" Switching split with alt
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
" }}}

" neovim terminal emulator colorscheme {{{
let g:terminal_color_0 = "#4E4E4E"
let g:terminal_color_1 = "#d68787"
let g:terminal_color_2 = "#5f865f"
let g:terminal_color_3 = "#d8af5f"
let g:terminal_color_4 = "#85acd4"
let g:terminal_color_5 = "#D7AFAF"
let g:terminal_color_6 = "#87AFAF"
let g:terminal_color_7 = "#D0D0D0"
let g:terminal_color_8 = "#626262"
let g:terminal_color_9 = "#D75F87"
let g:terminal_color_10 = "#87AF87"
let g:terminal_color_11 = "#FFD787"
let g:terminal_color_12 = "#ACD4FA"
let g:terminal_color_13 = "#FFAFAF"
let g:terminal_color_14 = "#87D7D7"
let g:terminal_color_15 = "#E4E4E4"
let g:terminal_color_background="#171717"
let g:terminal_color_foreground="#D0D0D0"
" }}}
