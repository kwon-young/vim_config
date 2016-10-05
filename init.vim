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
"   This file is the top config file for my vim configuration.
"   It's mainly used to source other configuration files.
"
" Compatibility: Vim and Neovim
"
if has('win32')
  let s:past_dir=getcwd()
  if has('nvim')
    execute "let s:rt_dir='" . $LOCALAPPDATA . "\\nvim'"
  else
    execute "let s:rt_dir='" . $HOME . "\\vimfiles'"
  endif
  execute "cd " . s:rt_dir
endif

source ./personal_config/basic_settings.vim
source ./personal_config/abbrev_settings.vim
source ./personal_config/mapping_settings.vim

if has("nvim") && !has("win32")
  source ./personal_config/term_settings.vim
endif

source ./plug_config/plug_init.vim

if has('win32')
  execute "cd " . s:past_dir
endif
