
" Seoul256 configuration {{{
let g:seoul256_srgb = 1
let g:seoul256_background = 236
silent! colorscheme seoul256
" brighten/dim background - a'la macOS dim screen function keys
" 233 (darkest) ~ 239 (lightest) 252 (darkest) ~ 256 (lightest)
function! Seoul256Brighten()
    if g:seoul256_background == 239
        let g:seoul256_background = 252
    elseif g:seoul256_background == 256
        let  g:seoul256_background = 256
    else
        let g:seoul256_background += 1
    endif
    colo seoul256
endfunction
"
function! Seoul256Dim()
    if g:seoul256_background == 252
        let g:seoul256_background = 239
    elseif g:seoul256_background == 233
        let g:seoul256_background = 233
    else
        let g:seoul256_background -= 1
    endif
    colo seoul256
endfunction
"
nnoremap <F1> :call Seoul256Dim()<CR>
nnoremap <F2> :call Seoul256Brighten()<CR>
" }}}
