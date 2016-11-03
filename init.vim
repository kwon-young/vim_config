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

let $MYCONFIG_DIR = split(&runtimepath, ',')[0]

source $MYCONFIG_DIR/personal_config/basic_settings.vim
source $MYCONFIG_DIR/personal_config/abbrev_settings.vim
source $MYCONFIG_DIR/personal_config/mapping_settings.vim

if has("nvim") && !has("win32")
  source $MYCONFIG_DIR/personal_config/term_settings.vim
endif

source $MYCONFIG_DIR/plug_config/plug_init.vim
