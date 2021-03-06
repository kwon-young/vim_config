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
"   This file is used to configure the status bar with plugins.
"
" Compatibility: Vim and Neovim
"

"airline configuration {{{
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 1
if has('win32')
  let g:airline_left_sep = '⮀'
  let g:airline_left_alt_sep = '⮁'
  let g:airline_right_sep = '⮂'
  let g:airline_right_alt_sep = '⮃'
  let g:airline_symbols.readonly = '⭤'
  let g:airline_symbols.linenr = '⭡'
else
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif
let g:airline_exclude_preview = 1
let g:airline_detect_spell=0
"let g:airline_theme= 'simple'
let g:airline_theme='zenburn'
"let g:airline#extensions#tabline#enabled = 1
" Show just the filename
"let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline_section_b = '%{strftime("%c")}'
"if exists('g:airline_section_b')
  "let g:airline_section_b = airline#section#create('%{virtualenv#statusline()}')
"endif
" }}}

" lightline configuration {{{
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'condaenv', 'fugitive', 'filename' ] ],
      \   'right':  [ [ 'lineinfo' ], [ 'percent' ],
      \               [ 'fileformat', 'fileencoding', 'filetype', 'neomake_working',
      \                 'neomake_errors', 'neomake_warnings'  ] ]
      \ },
      \ 'tabline': {
      \   'left': [ [ 'tabs' ] ],
      \   'right': [ [ 'close' ] ]
      \ },
      \ 'tab': {
      \   'active': [ 'pwd' ],
      \   'inactive': [ 'pwd' ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'readonly': 'LightLineReadonly',
      \   'modified': 'LightLineModified',
      \   'filename': 'LightLineFilename',
      \   'condaenv': 'LightLineCondaEnv',
      \   'neomake_errors': 'LightLineNeomakeErrors',
      \   'neomake_warnings': 'LightLineNeomakeWarnings',
      \   'neomake_working': 'LightLineNeomakeWorking'
      \ },
      \ 'tab_component_function': {
      \   'pwd': 'LightLinePwd'
      \ },
      \ 'component': {
      \   'lineinfo': '%3l:%-2v',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! LightLinePwd(n)
  return split(getcwd(-1, a:n), '/')[-1]
endfunction

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightLineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return ''
  else
    return ""
  endif
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  if exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? ''.branch : ''
  endif
  return ''
endfunction

function! LightLineCondaEnv()
  let condaenv = $CONDA_DEFAULT_ENV
  return condaenv
endfunction

function! LightLineNeomakeWorking()
  if !exists(":Neomake")
    return ''
  elseif neomake#statusline#GetRunningStatus() == ''
    return ''
  else
    return 'T:'.neomake#statusline#GetRunningStatus()
  endif
endfunction

function! LightLineNeomakeErrors()
  if !exists(":Neomake") || ((get(neomake#statusline#QflistCounts(), "E", 0) + get(neomake#statusline#LoclistCounts(), "E", 0)) == 0)
    return ''
  endif
  return 'E:'.(get(neomake#statusline#LoclistCounts(), 'E', 0) + get(neomake#statusline#QflistCounts(), 'E', 0))
endfunction

function! LightLineNeomakeWarnings()
  if !exists(":Neomake") || ((get(neomake#statusline#QflistCounts(), "W", 0) + get(neomake#statusline#LoclistCounts(), "W", 0)) == 0)
    return ''
  endif
  return 'W:'.(get(neomake#statusline#LoclistCounts(), 'W', 0) + get(neomake#statusline#QflistCounts(), 'W', 0))
endfunction
" }}}
