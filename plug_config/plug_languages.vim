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
let g:ycm_filetype_whitelist = { 'cpp': 1, 'python':1, 'snippets':1, 'tex':1, 'haskell':1, 'pandoc':1, 'vim':1}
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

let g:ycm_python_binary_path = 'python'
" }}}

" UltiSnips configuration {{{
let g:UltiSnipsSnippetsDir = "$MYCONFIG_DIR/UltiSnips"
" }}}

" Syntastic configuration {{{
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = { "level": "warnings" }
" }}}

" Braceless configuration {{{
autocmd FileType python BracelessEnable +indent
" }}}

" vim-ipy configuration {{{
"let g:nvim_ipy_perform_mappings = 0
" }}}

" SimplyFold configuration {{{
let g:SimpylFold_docstring_preview = 1
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<
" }}}

" deoplete configuration {{{
let g:deoplete#enable_at_startup = 1
" }}}

" Chromatica configuration {{{
let g:chromatica#libclang_path = '/usr/lib/llvm-3.8/lib/libclang.so'
"let g:chromatica#enable_debug=1
let g:chromatica#responsive_mode = 1
let g:chromatica#highlight_feature_level = 0
" }}}

" IndentLine configuration {{{
"let g:indentLine_setColors = 0
let g:indentLine_char = '¦'
" }}}

" pandoc configuration {{{
let g:pandoc#modules#disabled = ["chdir"]
augroup Pandoc
  " this one is which you're most likely to use?
  autocmd!
  autocmd Filetype pandoc set makeprg=do-pandoc.rb\ % 
  autocmd BufWritePost *.md Neomake!
augroup end

" }}}

" vimtex {{{
let g:tex_flavor = "latex"
if !exists('g:ycm_semantic_triggers')
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = [
      \ 're!\\[A-Za-z]*cite[A-Za-z]*(\[[^]]*\]){0,2}{[^}]*',
      \ 're!\\[A-Za-z]*ref({[^}]*|range{([^,{}]*(}{)?))',
      \ 're!\\hyperref\[[^]]*',
      \ 're!\\includegraphics\*?(\[[^]]*\]){0,2}{[^}]*',
      \ 're!\\(include(only)?|input){[^}]*',
      \ 're!\\\a*(gls|Gls|GLS)(pl)?\a*(\s*\[[^]]*\]){0,2}\s*\{[^}]*',
      \ 're!\\includepdf(\s*\[[^]]*\])?\s*\{[^}]*',
      \ 're!\\includestandalone(\s*\[[^]]*\])?\s*\{[^}]*',
      \ ]
" }}}

" neco-ghc configuration {{{
let g:ycm_semantic_triggers = {'haskell' : ['.']}
let g:necoghc_enable_detailed_browse = 1
" }}}

" lldb.vim mappings {{{
"nnoremap <leader>lb <Plug>LLBreakSwitch
nnoremap <leader>lb :execute ":LL breakpoint set -f " . expand("%:t") . " -l " . getcurpos()[1]<CR>
nnoremap <leader>lB :LL breakpoint delete 
"vmap <F2> <Plug>LLStdInSelected
"nnoremap <F4> :LLstdin<CR>
nnoremap <leader>ld :LLmode debug<CR>
nnoremap <leader>lc :LLmode code<CR>
nnoremap <F9> :LL thread continue<CR>
nnoremap <F10> :LL thread step-over<CR>
nnoremap <F11> :LL thread step-in<CR>
nnoremap <F12> :LL process kill<CR>
nnoremap <F8> :LL process launch<CR>
nnoremap <leader>lp :LL print <C-R>=expand('<cword>')<CR>
vnoremap <leader>lp :<C-U>LL print <C-R>=lldb#util#get_selection()<CR><CR>
" }}}

" Ack.vim configuration {{{
let g:ackprg = "ag --vimgrep"
" }}}

" Clamp configuration {{{
let g:clamp_libclang_file = '/usr/lib/llvm-3.8/lib/libclang.so'
" }}}

" Neomake configuration {{{
" autocmd in pandoc configuration
" For python
"let g:neomake_python_enabled_makers = ['pylama']
augroup python_maker
  au!
  au BufWritePost *.py Neomake pylama
augroup END
augroup cpp_maker
  autocmd!
  autocmd FileType cpp set makeprg=make\ -C\ build\ -j8
augroup END
nnoremap <F5> :Neomake!<CR>
let g:neomake_verbose = 0
" }}}

" A.vim configuration {{{
nnoremap <leader>a :A<CR>
" }}}

" LanguageClient-neovim configuration {{{
" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
      \ 'cpp': ['/home/kwon-young/prog/llvm/build/bin/clangd'],
      \ }

"" Automatically start language servers.
"let g:LanguageClient_autoStart = 1

"nnoremap <silent> K :call
"LanguageClient_textDocument_hover()<CR>
"nnoremap <silent> gd :call
"LanguageClient_textDocument_definition()<CR>
"nnoremap <silent> <F2> :call
"LanguageClient_textDocument_rename()<CR>
" }}}
