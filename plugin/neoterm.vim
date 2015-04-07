let g:neoterm_clear_cmd = "clear; printf '=%.0s' {1..80}; clear"
let g:neoterm_position = 'vertical'

nnoremap <silent> <f9> :call neoterm#repl#line()<cr>
vnoremap <silent> <f9> :call neoterm#repl#selection()<cr>

" run set test lib
nnoremap <silent> ,rt :call neoterm#test#run('all')<cr>
nnoremap <silent> ,rf :call neoterm#test#run('file')<cr>
nnoremap <silent> ,rn :call neoterm#test#run('current')<cr>
nnoremap <silent> ,rr :call neoterm#test#rerun()<cr>

" Useful maps
" closes the current terminal
nnoremap <silent> ,tc :bd! term://*<cr>
" clear terminal
nnoremap <silent> ,tl :exec "T " . g:neoterm_clear_cmd<cr>
