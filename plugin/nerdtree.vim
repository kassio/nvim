let NERDTreeWinPos = "right"
let NERDTreeMinimalUI = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeHighlightCursorline = 1
let NERDTreeCascadeOpenSingleChildDir = 0
let NERDTreeCascadeSingleChildDir = 0
let NERDTreeIgnore = ['\<tags\>', '\<tags\.gems\>']
let NERDTreeStatusline="\ %-28{matchstr(getline('.'), '\\(\\s\\)\\?\\zs\\(\\/\\)\\?\\w\\(.*\\)')}"
let NERDTreeDirArrowCollapsible = '-'
let NERDTreeDirArrowExpandable = '+'

nmap <silent> <leader>p :call user#nerdtree#mirror_toggle()<CR>
nnoremap <silent> <leader>fl :call user#nerdtree#mirror_find()<CR>

if filereadable('mix.exs')
  call add(NERDTreeIgnore, '_build')
end

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
aug END
