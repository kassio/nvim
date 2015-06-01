let g:neoterm_clear_cmd = "reset;echo -e \"\\033c\\e[3J\""
let g:neoterm_position = 'horizontal'

nnoremap <silent> <f10> :TREPLSendFile<cr>
nnoremap <silent> <f9> :TREPLSend<cr>
vnoremap <silent> <f9> :TREPLSend<cr>

" run set test lib
nnoremap <silent> ,rt :call neoterm#test#run('all')<cr>
nnoremap <silent> ,rf :call neoterm#test#run('file')<cr>
nnoremap <silent> ,rn :call neoterm#test#run('current')<cr>
nnoremap <silent> ,rr :call neoterm#test#rerun()<cr>

" Useful maps
" closes the all terminal buffers
nnoremap <silent> ,tc :call neoterm#close_all()<cr>
" clear terminal
nnoremap <silent> ,tl :call neoterm#clear()<cr>

command! TRoutes :T rake routes
command! -nargs=+ TRoute :T rake routes | grep <args>
command! TMigrate :T rake db:migrate
