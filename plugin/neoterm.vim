let g:neoterm_position = 'horizontal'
let g:neoterm_automap_keys = '<leader>tm'
let g:neoterm_use_relative_path = 1
let g:neoterm_autoscroll = 1
let g:neoterm_always_open_to_exec = 0

command! -complete=shellcmd VTnew
      \ silent call user#neoterm#vertical({-> execute('Tnew') })
command! -complete=shellcmd VTtoggle
      \ silent call user#neoterm#vertical({-> execute('Ttoggle ') })
command! -complete=shellcmd -nargs=+ VT
      \ silent call user#neoterm#vertical({-> execute('T '.<q-args>) })

nnoremap <leader>rf :TREPLSendFile<cr>
nnoremap <leader>rl :TREPLSendLine<cr>
vnoremap <leader>rs :TREPLSendSelection<cr>

nnoremap <leader>tR :call neoterm#exec(['!!', '', ''])<cr>

" Useful maps
nnoremap <leader>tt :Ttoggle<cr>:call neoterm#normal('G')<cr>
nnoremap <leader>vt :VTtoggle<cr>:call neoterm#normal('G')<cr>
" send the exist command to the current terminal
nnoremap <leader>te :T exit<cr>
" send the exist command to the current terminal
nnoremap <leader>tG :call neoterm#normal('G')<cr>
" clear terminal
nnoremap <leader>tl :Tclear<cr>
" nnoremap <leader>tL :Tclear!<cr> " TODO
" kills the current job (send a <c-c>)
nnoremap <leader>tk :Tkill<cr>
" kills and clears
nnoremap <leader>tK :Tkill \| sleep 10m \| Tclear<cr>
