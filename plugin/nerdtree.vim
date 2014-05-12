let NERDTreeWinPos = "right"
let NERDTreeMinimalUI = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeHighlightCursorline = 1
let NERDTreeStatusline="%-28{matchstr(getline('.'), '\\s\\zs\\w\\(.*\\)')}"

nmap <silent> <leader>p :call my_nerdtree#mirror_or_create()<CR>
nnoremap <silent> <leader>fl :call my_nerdtree#mirror_find()<CR>

aug nerdtree_view
  au!
  au BufLeave *NERD_tree* let s:NERDTreeView=winsaveview()
  au BufEnter *NERD_tree*
        \ if exists('b:NERDTreeView') |
        \   call winrestview(b:NERDTreeView) |
        \   unlet b:NERDTreeView |
        \ endif
aug END
