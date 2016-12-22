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
"   This file is used to install a plugin manager and manage plugins.
"
" Compatibility: Vim and Neovim
"

scriptencoding utf-8
set encoding=utf-8
filetype plugin on

if has('win32')
  let s:plug_file = glob('~/vimfiles/autoload/plug.vim')
elseif has('unix')
  let s:plug_file = glob('~/.vim/autoload/plug.vim')
endif

if has('win32') && empty(s:plug_file)
  silent !bitsadmin /transfer vimplug /download /priority normal https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim C:\users\kwon-young\vimfiles\autoload\plug.vim
elseif has('unix') && empty(s:plug_file)
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

if !empty(s:plug_file)
  call plug#begin()

  if has('unix')
    Plug 'https://gist.github.com/5dff641d68d20ba309ce.git',
          \ {'as': 'vimawesome', 'do': 'mkdir -p plugin; cp -f *.vim plugin/'}
  elseif has('win32')
    Plug 'https://gist.github.com/5dff641d68d20ba309ce.git',
          \ {'as': 'vimawesome', 'do': 'mkdir plugin && move *.vim plugin/'}
  endif

  " Neovim GUI
  Plug 'equalsraf/neovim-gui-shim'

  " Appearance {{{
  Plug 'junegunn/seoul256.vim'
  Plug 'itchyny/lightline.vim'
  Plug 'edkolev/tmuxline.vim'
  "Plug 'vim-airline/vim-airline'
  "Plug 'vim-airline/vim-airline-themes'
  " }}}
  
  " Interface {{{
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'
  Plug 'duff/vim-scratch'
  " }}}

  " File system
  if has('unix')
    Plug 'junegunn/fzf', { 'dir': '~/.config/fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-eunuch'
  endif

  " Searching
  Plug 'eugen0329/vim-esearch'
  
  " Git
  Plug 'tpope/vim-fugitive'

  " Text editing
  Plug 'godlygeek/tabular'

  " Languages {{{
  " Generic
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'Valloric/YouCompleteMe' , { 'for': ['cpp', 'c', 'python', 'snippets', 'tex', 'haskell'] }
  Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'scrooloose/nerdcommenter'
  autocmd! User YouCompleteMe call youcompleteme#Enable()

  Plug 'tweekmonster/braceless.vim'

  " !!!! Breaks vim-pandoc-syntax highlighting !!!!
  Plug 'Yggdroot/indentLine' , { 'for': ['python'] }

  "Plug 'Shougo/deoplete.nvim', { 'for': ['vim'], 'do': ':UpdateRemotePlugins' }
  Plug 'shougo/neoinclude.vim'

  Plug 'neomake/neomake'
  Plug 'vim-scripts/DoxygenToolkit.vim'

  " python
  Plug 'cjrh/vim-conda'
  Plug 'bfredl/nvim-ipy', { 'do': ':UpdateRemotePlugins' }
  Plug 'tmhedberg/SimpylFold'
  Plug 'heavenshell/vim-pydocstring'

  " vimscript
  Plug 'Shougo/neco-vim'

  " C++
  Plug 'arakashic/chromatica.nvim'
  "Plug 'octol/vim-cpp-enhanced-highlight'
  
  " Markdown
  Plug 'vim-pandoc/vim-pandoc'
  Plug 'vim-pandoc/vim-pandoc-syntax'
  Plug 'gbgar/pandoc-sections.vim'

  " latex
  Plug 'lervag/vimtex'

  " haskell
  "Plug 'neovimhaskell/haskell-vim'
  Plug 'eagletmt/neco-ghc'
  Plug 'kana/vim-textobj-user'
  Plug 'gilligan/vim-textobj-haskell'
  Plug 'itchyny/vim-haskell-indent'
  Plug 'twinside/vim-haskellfold'
  Plug 'travitch/hasksyn'
  " }}}

  call plug#end()
else
  echom "vim-plug couldn't be installed, check if curl and " . &shell " is installed."
endif

" Settings colorscheme {{{
let g:seoul256_background = 236
silent! colorscheme seoul256
" }}}

" Status bar plugins configuration
source $MYCONFIG_DIR/plug_config/plug_statusbar.vim

" Git plugins configuration
source $MYCONFIG_DIR/plug_config/plug_git.vim

" File system plugins configuration
source $MYCONFIG_DIR/plug_config/plug_filesystem.vim

" Text editing plugins configuration
source $MYCONFIG_DIR/plug_config/plug_textediting.vim

" Languages plugins configuration
source $MYCONFIG_DIR/plug_config/plug_languages.vim
