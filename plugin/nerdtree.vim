let g:NERDTreeWinPos = 'right'
let g:NERDTreeMinimalUI = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeHighlightCursorline = 1
let g:NERDTreeCascadeOpenSingleChildDir = 0
let g:NERDTreeCascadeSingleChildDir = 0
let g:NERDTreeIgnore = ['\<tags\>', '\<tags\.gems\>', 'node_modules']
let g:NERDTreeStatusline="\ %-28{matchstr(getline('.'), '\\(\\s\\)\\?\\zs\\(\\/\\)\\?\\w\\(.*\\)')}"

nnoremap <silent> <leader>p :NERDTreeToggle<CR>
nnoremap <silent> <leader>fl :NERDTreeFind<CR>

aug user:autocmd:nerdtree
  au!
  au BufDelete,BufWipeout *NERD_tree*
        \ if exists('g:nerdtree_current_buffer') |
        \   unlet g:nerdtree_current_buffer |
        \ end
  au Filetype nerdtree setlocal nolist

  au FocusGained * NERDTreeRefreshRoot
aug END
