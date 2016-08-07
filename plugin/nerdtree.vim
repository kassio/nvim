let NERDTreeWinPos = "right"
let NERDTreeMinimalUI = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeHighlightCursorline = 1
let NERDTreeIgnore = ['tags', 'tags\.gems']
let NERDTreeCascadeOpenSingleChildDir = 0
let NERDTreeStatusline="\ %-28{matchstr(getline('.'), '\\(\\s\\)\\?\\zs\\(\\/\\)\\?\\w\\(.*\\)')}"

nmap <silent> <leader>p :call personal#nerdtree#mirror_toggle()<CR>
nnoremap <silent> <leader>fl :call personal#nerdtree#mirror_find()<CR>

if filereadable('web/web.ex')
  call add(NERDTreeIgnore, '_build')
end

aug nerdtree_view
  au!
  au CursorMoved *NERD_tree*
        \ let s:NERDTreeCurrentLine=line('.')
  au BufEnter *NERD_tree*
        \ if exists('s:NERDTreeCurrentLine') && s:NERDTreeCurrentLine > 0 |
        \   call setpos('.', [0, s:NERDTreeCurrentLine, 1, 0]) |
        \ endif
  au BufDelete,BufWipeout *NERD_tree*
        \ if exists('g:nerdtree_current_buffer') |
        \   unlet g:nerdtree_current_buffer |
        \ endif
  au Filetype nerdtree setlocal nolist
aug END
