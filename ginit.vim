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
"   Configuration file of GUI like Neovim-Qt
"
" Compatibility: Neovim
"

" Configure font
if has('unix')
  GuiFont Inconsolata\ for\ Powerline:b:h12
elseif has('win32')
  GuiFont! Powerline Consolas:h11
endif
