"   _____                        _____  _                
"  / ____|                      |  __ \(_)               
" | |     __ _ _ __ _ __   ___  | |  | |_  ___ _ __ ___  
" | |    / _` | '__| '_ \ / _ \ | |  | | |/ _ \ '_ ` _ \ 
" | |___| (_| | |  | |_) |  __/ | |__| | |  __/ | | | | |
"  \_____\__,_|_|  | .__/ \___| |_____/|_|\___|_| |_| |_|
"                  | |                                   
"                  |_|                                   
" Author: Kwon-Young Choi
" Date: 30/12/2016
"
" Description:
"   This file is configure plugins that modify Vim user interface.
"
" Compatibility: Vim and Neovim
"

" comfortable_motion plugin configuration {{{
let g:comfortable_motion_friction = 40.0
let g:comfortable_motion_air_drag = 2.0

nnoremap <silent> <A-f> :call comfortable_motion#flick(40)<CR>
nnoremap <silent> <A-d> :call comfortable_motion#flick(-40)<CR>
" }}}

" vim-highlightedyank plugin configuration {{{
hi HighlightedyankRegion cterm=underline gui=underline
" }}}
