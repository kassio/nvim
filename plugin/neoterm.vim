let g:neoterm_test_status_format = ' %s '
let g:neoterm_size = 15
let g:neoterm_automap_keys = "\<leader>tt"

aug neoterm_fix_win
  au!
  au BufEnter term://*:NEOTERM
        \ setlocal nonumber norelativenumber winfixheight winfixwidth

  au BufUnload,BufDelete,BufWipeout term://*:NEOTERM
        \ resize
  au BufUnload,BufDelete,BufWipeout term://*:NEOTERM
        \ setlocal nonumber< norelativenumber< winfixheight< winfixwidth<
aug END

nnoremap <silent> <leader>rf :TREPLSendFile<cr>
nnoremap <silent> <leader>rs :TREPLSend<cr>
vnoremap <silent> <leader>rs :TREPLSend<cr>

" run set test lib
nnoremap <silent>  <f8> :call neoterm#test#run('all')<cr>
nnoremap <silent>  <f9> :call neoterm#test#run('file')<cr>
nnoremap <silent> <f10> :call neoterm#test#run('current')<cr>
nnoremap <silent> <f11> :call neoterm#test#rerun()<cr>

" Useful maps
" hide all terminals
nnoremap <silent> <leader>tc :Tclose<cr>
" open current terminal
nnoremap <silent> <leader>to :Topen<cr>
" clear terminal
nnoremap <silent> <leader>tl :call neoterm#clear()<cr>
" kills the current job (send a <c-c>)
nnoremap <silent> <leader>tk :call neoterm#kill()<cr>

" Rails commands
command! -nargs=+ Tr :T rails <args>
command! -nargs=+ Trake :T rake <args>

" Git commands
command! -nargs=* Tg :T git <args>
