let NERDTreeWinPos = "right"
let NERDTreeMinimalUI = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeHighlightCursorline = 1
let NERDTreeStatusline="\ %-28{matchstr(getline('.'), '\\s\\zs\\w\\(.*\\)')}"
let NERDTreeIgnore=['tags', 'tags\.gems', 'coverage']

nmap <silent> <c-q> :call personal#nerdtree#mirror_toggle()<CR>
nnoremap <silent> <m-q> :call personal#nerdtree#mirror_find()<CR>

aug nerdtree_view
  au!
  au CursorMoved *NERD_tree*
        \ let s:NERDTreeCurrentLine=line('.')
  au BufEnter *NERD_tree*
        \ if exists('s:NERDTreeCurrentLine') && s:NERDTreeCurrentLine > 0 |
        \   call setpos('.', [0, s:NERDTreeCurrentLine, 1, 0]) |
        \ endif
  au Filetype nerdtree setlocal nolist
aug END
