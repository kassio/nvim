let g:neoterm_position = 'horizontal'
let g:neoterm_automap_keys = '<leader>tm'
let g:neoterm_use_relative_path = 1
let g:neoterm_autoscroll = 1
let g:neoterm_always_open_to_exec = 0

nnoremap <leader>rf :TREPLSendFile<cr>
nnoremap <leader>rl :TREPLSendLine<cr>
vnoremap <leader>rs :TREPLSendSelection<cr>

nnoremap <leader>tR :call neoterm#exec({ 'cmd': ['!!', '', ''] })<cr>

nnoremap <silent> <leader>tt :<c-u>exec v:count.'Ttoggle'<cr>
nnoremap <silent> <leader>vt :<c-u>exec v:count.'vert Ttoggle'<cr>
nnoremap <silent> <leader>te :<c-u>exec v:count.'T exit'<cr>
nnoremap <silent> <leader>tl :<c-u>exec v:count.'Tclear'<cr>
nnoremap <silent> <leader>tk :<c-u>exec v:count.'Tkill'<cr>
