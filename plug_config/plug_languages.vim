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
"   This file contains language plugins configuration.
"
" Compatibility: Vim and Neovim
"

" gutentags configuration
let g:gutentags_cscope_executable="gtags-cscope"

" You Complete Me Configuration {{{
let g:ycm_filetype_whitelist = { 'cpp': 1, 'tex': 1, 'python':1, 'snippets':1}
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_confirm_extra_conf = 0

" UltiSnips You Complete Me Association
let g:UltiSnipsExpandTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<s-c-j>"

" You Complete Me map
nnoremap <leader>jd :YcmCompleter GoTo<CR>
nnoremap <leader>jf :YcmCompleter FixIt<CR>

let g:ycm_python_binary_path = 'python3'
" }}}

" UltiSnips configuration {{{
let g:UltiSnipsSnippetsDir = "$MYCONFIG_DIR/UltiSnips"
" }}}

" Syntastic configuration {{{
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" }}}

" Braceless configuration {{{
autocmd FileType python BracelessEnable +indent
" }}}

" vim-ipy configuration {{{
"let g:nvim_ipy_perform_mappings = 0

" }}}

" deoplete configuration {{{
let g:deoplete#enable_at_startup = 1
" }}}

" Chromatica configuration {{{
let g:chromatica#libclang_path = '/usr/lib/llvm-3.8/lib/libclang.so'
"let g:chromatica#enable_debug=1
let g:chromatica#responsive_mode = 1
"let g:chromatica#highlight_feature_level = 1
" }}}

" IndentLine configuration {{{
"let g:indentLine_setColors = 0
let g:indentLine_char = '¦'
" }}}
