let NERDTreeWinPos = "right"
let NERDTreeMinimalUI = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeHighlightCursorline = 1
let NERDTreeStatusline="\ %-28{matchstr(getline('.'), '\\s\\zs\\w\\(.*\\)')}"

nmap <silent> <leader>p :call personal#nerdtree#mirror_toggle()<CR>
nnoremap <silent> <leader>fl :call personal#nerdtree#mirror_find()<CR>

aug nerdtree_view
  au!
  au BufLeave *NERD_tree* let s:NERDTreeLine=line('.')
  au BufReadPost *NERD_tree*
        \ if exists('s:NERDTreeLine') |
        \    setpos('.', [0, s:NERDTreeLine, 1, 0]) |
        \ endif
aug END
