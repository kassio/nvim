let g:neoterm_position = 'horizontal'
let g:neoterm_size = 10
let g:neoterm_run_tests_bg = 1
let g:neoterm_raise_when_tests_fail = 1

let g:neoterm_test_status_format = '·%s ·'

let g:neoterm_test_status = {
      \ 'running': '🏃 🏃 🏃',
      \ 'success': '💚 💚 💚',
      \ 'failed': '😡 😡 😡'
      \ }

aug neoterm_fix_win
  au!
  au BufEnter term://*:NEOTERM
        \ setlocal nonumber norelativenumber winfixheight winfixwidth

  au BufUnload,BufDelete,BufWipeout term://*:NEOTERM
        \ resize
  au BufUnload,BufDelete,BufWipeout term://*:NEOTERM
        \ setlocal nonumber< norelativenumber< winfixheight< winfixwidth<
aug END

nnoremap <silent> <f10> :TREPLSendFile<cr>
nnoremap <silent> <f9> :TREPLSend<cr>
vnoremap <silent> <f9> :TREPLSend<cr>

" run set test lib
nnoremap <silent> ,rt :call neoterm#test#run('all')<cr>
nnoremap <silent> ,rf :call neoterm#test#run('file')<cr>
nnoremap <silent> ,rn :call neoterm#test#run('current')<cr>
nnoremap <silent> ,rr :call neoterm#test#rerun()<cr>

" Useful maps
" hide all terminals
nnoremap <silent> ,th :Tclose<cr>
" open current terminal
nnoremap <silent> ,to :Topen<cr>
" clear terminal
nnoremap <silent> ,tl :call neoterm#clear()<cr>
" kills the current job (send a <c-c>)
nnoremap <silent> ,tc :call neoterm#kill()<cr>

" Rails commands
command! -nargs=+ Tr :T rails <args>
command! -nargs=+ Trake :T rake <args>

" Git commands
command! -nargs=* Tg :T git <args>
