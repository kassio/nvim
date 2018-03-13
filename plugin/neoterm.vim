let g:neoterm_position = 'horizontal'
let g:neoterm_automap_keys = '<leader>tm'
let g:neoterm_use_relative_path = 1
let g:neoterm_autoscroll = 1
let g:neoterm_always_open_to_exec = 0

nnoremap <leader>rf :TREPLSendFile<cr>
nnoremap <leader>rl :TREPLSendLine<cr>
vnoremap <leader>rs :TREPLSendSelection<cr>

nnoremap <leader>tR :call neoterm#exec({ 'cmd': ['!!', '', ''] })<cr>

" Useful maps
nnoremap <leader>tt :<c-u>exec v:count.'Ttoggle'<cr>
" Useful maps
nnoremap <leader>vt :<c-u>exec v:count.'vert Ttoggle'<cr>
" send the exist command to the current terminal
nnoremap <leader>te :<c-u>exec v:count.'T exit'<cr>
" clear terminal
nnoremap <leader>tl :<c-u>exec v:count.'Tclear'<cr>
" kills the current job (send a <c-c>)
nnoremap <leader>tk :<c-u>exec v:count.'Tkill'<cr>
