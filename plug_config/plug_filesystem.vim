"   _____                        _____  _                
"  / ____|                      |  __ \(_)               
" | |     __ _ _ __ _ __   ___  | |  | |_  ___ _ __ ___  
" | |    / _` | '__| '_ \ / _ \ | |  | | |/ _ \ '_ ` _ \ 
" | |___| (_| | |  | |_) |  __/ | |__| | |  __/ | | | | |
"  \_____\__,_|_|  | .__/ \___| |_____/|_|\___|_| |_| |_|
"                  | |                                   
"                  |_|                                   
" Author: Kwon-Young Choi
" Date: 05/10/2016
"
" Description:
"   This file configure file system plugins
"
" Compatibility: Vim and Neovim
"

" fzf mapping
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>m :Marks<CR>

" vim_esearch configuration {{{
let g:esearch = {
      \ 'adapter':    'rg',
      \ 'backend':    'nvim',
      \ 'out':        'win',
      \ 'batch_size': 1000,
      \ 'use':        ['visual', 'hlsearch', 'last'],
      \}
" }}}
