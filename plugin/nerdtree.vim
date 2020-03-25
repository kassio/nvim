let g:NERDTreeWinPos = 'right'
let g:NERDTreeMinimalUI = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeHighlightCursorline = 1
let g:NERDTreeCascadeOpenSingleChildDir = 0
let g:NERDTreeCascadeSingleChildDir = 0
let g:NERDTreeIgnore = ['\<tags\>', '\<tags\.gems\>', 'node_modules']
let g:NERDTreeStatusline="\ %-28{matchstr(getline('.'), '\\(\\s\\)\\?\\zs\\(\\/\\)\\?\\w\\(.*\\)')}"

nmap <silent> <leader>p :call user#nerdtree#mirror_toggle()<CR>
nnoremap <silent> <leader>fl :call user#nerdtree#mirror_find()<CR>

aug user:autocmd:nerdtree
  au!
  au CursorMoved *NERD_tree*
        \ let s:NERDTreeCurrentLine=line('.')
  au BufEnter *NERD_tree*
        \ if exists('s:NERDTreeCurrentLine') && s:NERDTreeCurrentLine > 0 |
        \   call setpos('.', [0, s:NERDTreeCurrentLine, 1, 0]) |
        \ end
  au BufDelete,BufWipeout *NERD_tree*
        \ if exists('g:nerdtree_current_buffer') |
        \   unlet g:nerdtree_current_buffer |
        \ end
  au Filetype nerdtree setlocal nolist

  au FocusGained * NERDTreeRefreshRoot
aug END
