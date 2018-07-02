" reverse search with okular
" in okular custom editor setting
" nvr -c "drop %f | call cursor(%l, %c)"

" forward search with okular
function! SyncTexForward()
  if !exists('g:main_tex_file')
    let g:main_tex_file = input('main tex file: ', '', 'file')
    let g:main_tex_file = fnamemodify(g:main_tex_file, ':p:r')
  endif
  let execstr = "silent !okular --unique " . g:main_tex_file . ".pdf\\#src:".line(".")."%:p &"
  exec execstr
endfunction
nnoremap <Leader>jf :call SyncTexForward()<CR>
