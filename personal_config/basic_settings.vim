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

" Enable filetype detection
filetype indent plugin on
" Enable syntax highlighting
syntax on

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
  let rt_dir="$HOME/vimfiles/"
elseif has("nvim")
  let rt_dir="$HOME/.config/nvim/"
else
  let rt_dir="$HOME/.vim/"
endif
" set rt_dir for undo, backup and swap files
let &undodir=rt_dir . "undo//"
let &backupdir=rt_dir . "backup//"
let &directory=rt_dir . "swp//"
" }}}
