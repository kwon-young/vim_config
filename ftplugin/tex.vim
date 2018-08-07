" reverse search with okular
" in okular custom editor setting
" 1st version
" nvr -c "drop %f | call cursor(%l, %c)"
" 2nd version: use fnameescape to deal with space in path
"              use execute to use drop and fnameescape together
" nvr -c "execute 'drop ' . fnameescape('%f') | call cursor(%l, %c)"

" forward search with okular
function! SyncTexForward()
  if !exists('g:main_pdf_file')
    let g:main_pdf_file = input('main pdf file: ', '', 'file')
    let g:main_pdf_file = fnamemodify(g:main_pdf_file, ':p')
    let g:main_pdf_file = fnameescape(g:main_pdf_file)
  endif
  let tex_file = fnameescape(expand("%:p"))
  let execstr = "silent !okular --unique " . g:main_pdf_file . "\\#src:" . line(".") . tex_file . " &"
  exec execstr
endfunction
nnoremap <Leader>jf :call SyncTexForward()<CR>
