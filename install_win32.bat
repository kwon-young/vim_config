@echo off
REM   _____                        _____  _                
REM  / ____|                      |  __ \(_)               
REM | |     __ _ _ __ _ __   ___  | |  | |_  ___ _ __ ___  
REM | |    / _` | '__| '_ \ / _ \ | |  | | |/ _ \ '_ ` _ \ 
REM | |___| (_| | |  | |_) |  __/ | |__| | |  __/ | | | | |
REM  \_____\__,_|_|  | .__/ \___| |_____/|_|\___|_| |_| |_|
REM                  | |                                   
REM                  |_|                                   
REM Author: Kwon-Young Choi
REM Date: 01/10/2016
REM
REM Description:
REM   Automated installation script for installing my vim config on windows.
REM
REM Compatibility: Vim and Neovim
REM

REM Cleaning installation
rmdir /S /Q %USERPROFILE%\vimfiles
del %USERPROFILE%\_vimrc
del %USERPROFILE%\_gvimrc
rmdir /S /Q %USERPROFILE%\AppData\Local\nvim
rmdir /S /Q %USERPROFILE%\AppData\Local\nvim-data

REM Making directories and symbolic links
REM For Vim
mkdir %USERPROFILE%\vimfiles
mkdir %USERPROFILE%\vimfiles\autoload
mkdir %USERPROFILE%\vimfiles\plugged
mkdir %USERPROFILE%\vimfiles\undo
mkdir %USERPROFILE%\vimfiles\backup
mkdir %USERPROFILE%\vimfiles\swp

mklink %USERPROFILE%\_vimrc %CD%\vimrc
mklink %USERPROFILE%\_gvimrc %CD%\gvimrc
mklink %USERPROFILE%\vimfiles\init.vim %CD%\init.vim
mklink %USERPROFILE%\vimfiles\ginit.vim %CD%\ginit.vim
mklink /D %USERPROFILE%\vimfiles\personal_config %CD%\personal_config
mklink /D %USERPROFILE%\vimfiles\plug_config %CD%\plug_config
mklink /D %USERPROFILE%\vimfiles\spell %CD%\spell

REM For Neovim
mkdir %USERPROFILE%\AppData\Local\nvim-data\swp

mklink /D %USERPROFILE%\AppData\Local\nvim %USERPROFILE%\vimfiles
mklink /D %USERPROFILE%\AppData\Local\nvim-data\backup %USERPROFILE%\AppData\Local\nvim\backup
mklink /D %USERPROFILE%\AppData\Local\nvim-data\undo %USERPROFILE%\AppData\Local\nvim\undo

echo "Please manually install fonts"
