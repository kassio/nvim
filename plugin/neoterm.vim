let g:neoterm_clear_cmd = "clear; printf '=%.0s' {1..80}; clear"
let g:neoterm_position = 'vertical'
let g:neoterm_last_test_command = ''

nnoremap <silent> <f9> :REPLSendLine<cr>
vnoremap <silent> <f9> :REPLSendSelection<cr>

" run set test lib
nnoremap <silent> ,rt :call neoterm#test_runner('all')<cr>
nnoremap <silent> ,rf :call neoterm#test_runner('file')<cr>
nnoremap <silent> ,rn :call neoterm#test_runner('current')<cr>
nnoremap <silent> ,rr :call neoterm#test_rerun()<cr>

" Useful maps
" closes the current terminal
nnoremap <silent> ,tc :bd! term://*<cr>
" clear terminal
nnoremap <silent> ,tl :exec "T " . g:neoterm_clear_cmd<cr>
