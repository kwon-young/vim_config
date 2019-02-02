setlocal foldmethod=marker

" Handle github url for vim-plug pluggin
function! PluginURL()
  let s:uri = expand("<cfile>")
  let s:uri = "https://github.com/" . s:uri
  echom "opening " . s:uri
  if s:uri != ""
    silent exec "!xdg-open " . s:uri . ""
  endif
endfunction

nnoremap <CR> :call PluginURL()<CR>
