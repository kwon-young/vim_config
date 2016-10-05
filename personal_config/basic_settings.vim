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
"   This file contains basic and common vim customization.
"
" Compatibility: Vim and Neovim
"

" Enable filetype detection {{{
filetype indent plugin on
" Enable syntax highlighting
syntax on
" }}}

" Change directory for swp, undo and backup file {{{
" Enable undo files and backup files
set undofile
set backup
" Use full path of the file to name the backup file
augroup backup_file
   autocmd!
   autocmd BufWritePre * let &backupext=substitute(expand("%:p"), ":\\=\\", "%%", "g")
augroup END
" customize path for each platform configuration
if has("win32")
  let s:rt_dir=$HOME . "/vimfiles/"
elseif has("nvim")
  let s:rt_dir=$HOME . "/.local/share/nvim/"
else
  let s:rt_dir=$HOME . "/.vim/"
endif
" set s:rt_dir for undo, backup and swap files
let &undodir=s:rt_dir . "undo//"
let &backupdir=s:rt_dir . "backup//"
let &directory=s:rt_dir . "swp//"
" }}}

" folding settings {{{
" set folding method and level by filetype
augroup ft
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType vim setlocal foldlevel=0
  autocmd FileType cpp setlocal foldmethod=syntax
  "autocmd FileType cpp setlocal foldlevel=2
augroup END
" else set no folding
set foldlevel=999
" }}}

" Exclude quickfix from buflist {{{
augroup qf
    autocmd!
    autocmd FileType qf set nobuflisted
augroup END
" }}}

" various built in settings {{{
set fenc=utf-8
set encoding=utf-8
set number
set hidden
set ignorecase
set incsearch
set hlsearch
set smartcase
set showmatch
set autoindent
set ruler
set showcmd
set mouse=a
set history=1000
set undolevels=1000
set relativenumber
let loaded_spellfile_plugin=0
set spell
set spelllang=en_us
set tabstop=2
set shiftwidth=2
set expandtab
set grepprg=grep
set backspace=2
set noerrorbells
set scrolloff=4
set listchars=tab:>-,trail:-
set wrap
set showtabline=0
" disable bell of vim
set noeb vb t_vb=
" }}}

"Set the status line options. Make it show more information. {{{
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
" }}}

