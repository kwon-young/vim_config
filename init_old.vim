"Personal Settings.

"personal map command {{{
" Personnal F1-12 mapping {{{
" nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
"nnoremap <F5> :NeomakeSh make<CR>
"nnoremap <F4> :NeomakeSh cd build && cmake ..<CR>
augroup f5
    autocmd!
    autocmd FileType tex nnoremap <F5> :Neomake! make<CR>
    autocmd FileType cpp nnoremap <F5> :Neomake!<CR>
augroup END
" }}}
" LanguageTool {{{
nnoremap <leader>l :LanguageToolCheck<CR>
vnoremap <leader>l :LanguageToolCheck<CR>
" }}}

" Neoterm mapping {{{
let g:projectname = 'MyProject'
nnoremap <leader>tt :Ttoggle<CR>
nnoremap <leader>tr :execute join(["T ./", g:projectname], "")<CR>
nnoremap <leader>tc :Tclose<CR>
" }}}
" Gundo mappings {{{
nnoremap <leader>ut :GundoToggle<CR>
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

" vim-plug configuration {{{
if has('nvim')
  call plug#begin('~/.vim/plugged')
else
  call plug#begin()
endif

" file system
Plug 'mtth/scratch.vim'

" git
Plug 'Xuyuanp/nerdtree-git-plugin'

" text editing
Plug 'thinca/vim-visualstar'
Plug 'sjl/gundo.vim'

" terminal
Plug 'kassio/neoterm'

" vim improvement
Plug 'osyo-manga/vim-over'

" language
" generic
Plug 'scrooloose/nerdcommenter'
Plug 'benekastah/neomake'
Plug 'vim-scripts/LanguageTool'
Plug 'kwon-young/vim-wordreference'
Plug 'metakirby5/codi.vim'

Plug 'Shougo/deoplete.nvim', { 'for': 'vim', 'do': ':UpdateRemotePlugins' }
"Plug 'Shougo/neosnippet.vim'
"Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neoinclude.vim', { 'for': 'vim'}
"Plug 'zchee/deoplete-jedi'
"Plug 'zchee/deoplete-clang'
"Plug 'SevereOverfl0w/deoplete-github'

" vim
Plug 'Shougo/neco-vim', { 'for': 'vim'}

" Lua
"Plug 'xolox/vim-lua-ftplugin'
" dependency of vim-lua-ftplugin
Plug 'xolox/vim-misc'

" cpp
Plug 'critiqjo/lldb.nvim'
"Plug 'gilligan/vim-lldb'
Plug 'octol/vim-cpp-enhanced-highlight'
if !has('nvim')
  Plug 'jeaye/color_coded'
else
  Plug 'bbchung/Clamp'
  Plug 'arakashic/chromatica.nvim'
endif

" python
Plug 'jmcantrell/vim-virtualenv'
Plug 'bfredl/nvim-ipy', { 'for': ['python'] }
"Plug 'klen/python-mode'
Plug 'hdima/python-syntax'
Plug 'tmhedberg/SimpylFold'
Plug 'JarrodCTaylor/vim-python-test-runner'

" markdown
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'rhysd/nyaovim-popup-tooltip'
Plug 'rhysd/nyaovim-markdown-preview'

" latex
Plug 'lervag/vimtex'

" neovim terminal
Plug 'kassio/neoterm'
call plug#end()
" }}}

"Set Color Scheme and Font Options {{{
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"silent! colorscheme kalisi
"silent! colorscheme OceanicNext
"silent! colorscheme solarized
" Unified color scheme (default: dark)
" Light color scheme
"silent! colorscheme seoul256-light
" Switch
set t_Co=256

" in case t_Co alone doesn't work, add this as well:
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"

"" }}}


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


"let g:ulti_expand_or_jump_res = 0 "default value, just set once
"function! Ulti_ExpandOrJump_and_getRes()
 "call UltiSnips#ExpandSnippetOrJump()
 "return g:ulti_expand_or_jump_res
"endfunction

"inoremap <c-r> <C-R>=(Ulti_ExpandOrJump_and_getRes() > 0)?"":IMAP_Jumpfunc('', 0)<CR>
" }}}

" virtualenv config {{{
let g:virtualenv_directory = '~/.virtualenvs'
" }}}

" vim-lua-ftplugin configuration {{{
" This sets the default value for all buffers.
let g:lua_interpreter_path = '/udd/kchoi/torch/install/bin/qlua'
let g:lua_internal = 0
let g:lua_complete_omni = 0
" }}}

" CtrlSpace Configuration {{{
let g:CtrlSpaceSetDefaultMapping = 1
let g:CtrlSpaceDefaultMappingKey = "<C-Space>"
" }}}

" python-mode configuration {{{

" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 1

" Python indentation
let g:pymode_indent = 1
" }}}

" Python syntax configuration {{{
let python_highlight_all = 1
" }}}

" Neoterm configuration {{{
"let g:neoterm_automap_keys = ',tt'
"set statusline+=%#NeotermTestRunning#%{neoterm#test#status('running')}%*
"set statusline+=%#NeotermTestSuccess#%{neoterm#test#status('success')}%*
"set statusline+=%#NeotermTestFailed#%{neoterm#test#status('failed')}%*
let g:neoterm_keep_term_open = 0
function! GetRepl()
  if &filetype == 'lua'
    return 'th'
  elseif &filetype == 'python'
    return 'python'
  endif
endfunction

function! RunFileInTerm()
  execute ':w'
  execute ':T ' . GetRepl() . ' %'
endfunction

function! RunReplInTerm()
  execute ":T " . GetRepl()
endfunction

function! GoToTerm()
  execute bufwinnr(bufname("neoterm")) . "wincmd w"
endfunction
function! InsertInTerm()
  execute ":Topen"
  call GoToTerm()
  execute "normal! a"
endfunction
function! InsertInRepl()
  execute ":Topen"
  execute ":T " . GetRepl()
  call GoToTerm()
  execute "normal! a"
endfunction

nnoremap <leader>tf :call RunFileInTerm()<CR>
nnoremap <leader>tc :Tclose<CR>
nnoremap <leader>to :Topen<CR>
nnoremap <leader>tr :call InsertInRepl()<CR>
nnoremap <leader>ti :call InsertInTerm()<CR>
" }}}

let g:clamp_autostart = 1
let g:clamp_libclang_file = '/usr/lib/libclang.so'
let g:clamp_compile_args = ['-DMyProjectLib_EXPORTS', '-DQT_CORE_LIB', '-DQT_GUI_LIB', '-DQT_NO_DEBUG', '-DQT_WIDGETS_LIB', '-I/home/kwon-young/prog/qt5-tutorial', '-I/tmp/tmpOlCxI1', '-isystem', '/usr/include/qt', '-isystem', '/usr/include/qt/QtCore', '-isystem', '/usr/include/qt/QtGui', '-isystem', '/usr/include/qt/QtWidgets', '-isystem', '/usr/lib/qt/mkspecs/linux-g++']
" }}}

" vim-pandoc {{{
let g:pandoc#modules#disabled = ["chdir"]
" }}}

" LanguageTool {{{
let g:languagetool_jar='/home/kwon-young/soft/languagetool/languagetool-standalone/target/LanguageTool-3.4-SNAPSHOT/LanguageTool-3.4-SNAPSHOT/languagetool-commandline.jar'
" }}}

" neovim terminal emulator colorscheme {{{
let g:terminal_color_0 = "#4E4E4E"
let g:terminal_color_1 = "#d68787"
let g:terminal_color_2 = "#5f865f"
let g:terminal_color_3 = "#d8af5f"
let g:terminal_color_4 = "#85acd4"
let g:terminal_color_5 = "#D7AFAF"
let g:terminal_color_6 = "#87AFAF"
let g:terminal_color_7 = "#D0D0D0"
let g:terminal_color_8 = "#626262"
let g:terminal_color_9 = "#D75F87"
let g:terminal_color_10 = "#87AF87"
let g:terminal_color_11 = "#FFD787"
let g:terminal_color_12 = "#ACD4FA"
let g:terminal_color_13 = "#FFAFAF"
let g:terminal_color_14 = "#87D7D7"
let g:terminal_color_15 = "#E4E4E4"
let g:terminal_color_background="#171717"
let g:terminal_color_foreground="#D0D0D0"
" }}}

" nvim-ipy configuration {{{
let g:nvim_ipy_perform_mappings = 0
" }}}

" Gundo configuration {{{
nnoremap <F2> :GundoToggle<CR>
" }}}

" Neomake {{{
let g:neomake_python_nosetests_maker = {
    \ 'errorformat': '%-G%.%#lib/python%.%#/site-package%.%#,%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m',
    \ }
let g:neomake_python_python_maker = {
    \ 'errorformat': '*',
    \ }

let g:neomake_python_enabled_makers = [
      \ 'nosetests', 
      \ 'python'
      \ ]

let g:neomake_tex_pdflatex_maker = {
      \ 'errorformat': '%f:%l:\ %m',
      \ 'args': ['-file-line-error', '-interaction=nonstopmode'],
      \ }
let g:neomake_tex_make_maker = {
      \ 'errorformat': '%f:%l:\ %m,%f:%l-%\\d%\\+:\ %m',
      \ 'args': ['all'],
      \ }
let g:neomake_tex_enabled_makers = ['pdflatex', 'make']
" }}}

" Chromatica configuration {{{
let g:chromatica#libclang_path = '/usr/lib/x86_64-linux-gnu/libclang-3.8.so.1'
" }}}

" cscope configuration {{{
set csprg=/usr/bin/gtags-cscope
" }}}

" deoplete configuration {{{
let g:deoplete#enable_at_startup = 1
" }}}

" deoplete-clang configuration {{{
let g:deoplete#sources#clang#libclang_path="/usr/lib/x86_64-linux-gnu/libclang-3.8.so.1"
let g:deoplete#sources#clang#clang_header="/usr/lib/llvm-3.8/lib/clang/3.8.0/include"
" }}}

" neosnippet configuration {{{
" Plugin key-mappings.
"imap <C-k> <Plug>(neosnippet_expand_or_jump)
"smap <C-k> <Plug>(neosnippet_expand_or_jump)
"xmap <C-k> <Plug>(neosnippet_expand_target)
" }}}

" fzf configuration {{{
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
" }}}
