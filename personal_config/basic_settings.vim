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
if has("win32") && has('nvim')
  let s:rt_dir=$LOCALAPPDATA . "/nvim-data/"
elseif has('win32')
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
silent! set fenc=utf-8
silent! set encoding=utf-8
" Enable 256 colors in ConEmu on Windows
if has('win32') && !has('gui_running') && !empty($CONEMUBUILD)
  set termencoding=utf-8
  set term=xterm
  set t_Co=256
  let &t_AB="\e[48;5;%dm"
  let &t_AF="\e[38;5;%dm"
endif
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
"set spelllang=fr
set tabstop=2
set shiftwidth=2
set expandtab
set grepprg=grep
set backspace=2
set noerrorbells
set scrolloff=4
set listchars=tab:>-,trail:-
set wrap
set showtabline=1
" disable bell of vim
set noeb vb t_vb=
if has('nvim')
  set inccommand=nosplit
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=0
endif
compiler gcc
if executable('rg')
  set grepprg=rg\ --vimgrep
endif
" }}}

"Set the status line options. Make it show more information. {{{
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
" }}}

" Fix backspace problem on Windows {{{
func! Backspace()
  if col('.') == 1
    if line('.')  != 1
      return  "\<ESC>kA\<Del>"
    else
      return ""
    endif
  else
    return "\<Left>\<Del>"
  endif
endfunc
inoremap <BS> <c-r>=Backspace()<CR>
" }}}

" insert date {{{
func! Date()
  if v:lc_time =~ "fr_FR"
    return strftime("%A %d %B %Y")
  else
    return strftime("%B %d, %Y")
  endif
endfunc
" }}}

" update date in file {{{
func! UpdateDate()
  let save_cursor = getpos(".")
  if &filetype =~ "pandoc"
    if v:lc_time =~ "fr_FR"
      keepjumps exe "%s/\\v(date: )\\w+ \\d\\d \\w+ \\d\\d\\d\\d/\\1" . Date()
    else
      keepjumps exe "%s/\\v(date: )\\w+ \\d\\d, \\d\\d\\d\\d/\\1" . Date()
    endif
  endif
  call histdel('search', -1)
  call setpos('.', save_cursor)
endfunc
" }}}

" Fortran configuration {{{
let fortran_ident_less=1
" }}}

" Javascool Conf {{{
augroup javascool
  autocmd!
  autocmd BufEnter *.jvs set filetype=java
augroup END
" }}}
