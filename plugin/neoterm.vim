let g:neoterm_default_mod = 'botright'
let g:neoterm_automap_keys = '<leader>tm'
let g:neoterm_use_relative_path = 1
let g:neoterm_autoscroll = 1
let g:neoterm_always_open_to_exec = 0

xmap <leader>ts <plug>(neoterm-repl-send)
nmap <leader>ts <plug>(neoterm-repl-send)
nmap <leader>tsl <plug>(neoterm-repl-send-line)

nnoremap <silent> <leader>tR :<c-u>exec printf("%sTexec !! \<lt>cr>", v:count)<cr>
nnoremap <silent> <leader>tt :<c-u>exec printf('%sTtoggle', v:count)<cr>
nnoremap <silent> <leader>vt :<c-u>exec printf('botright vertical %s Ttoggle', v:count)<cr>
nnoremap <silent> <leader>te :<c-u>exec printf('%sT exit', v:count)<cr>
nnoremap <silent> <leader>tl :<c-u>exec printf('%sTclear', v:count)<cr>
nnoremap <silent> <leader>tL :<c-u>exec printf('%sTclear!', v:count)<cr>
nnoremap <silent> <leader>tk :<c-u>exec printf('%sTkill', v:count)<cr>

cabbrev tt Ttoggle
cabbrev htt botright Ttoggle
cabbrev vtt botright vertical Ttoggle
cabbrev vt botright vertical T
