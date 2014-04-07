if exists('b:nerdree_setup_loaded')
  finish
endif
let b:nerdree_setup_loaded=1

let NERDTreeWinPos="right"
let NERDTreeHighlightCursorline=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeStatusline="%{matchstr(getline('.'), '\\s\\zs\\w\\(.*\\)')}"

" If possible open a NERDTreeMirror
function! OpenNERDTreeMirror()
  try
    NERDTreeMirror | NERDTreeToggle
  catch
    NERDTree
  endtry
endfunction

nmap <silent> <leader>p :NERDTreeMirror \| NERDTreeToggle<CR>
nnoremap <silent> <leader>fl :NERDTreeFind<CR>
command! E exec ":NERDTree ".expand('%:p')

aug nerdtree_view
  au!
  au BufLeave *NERD_tree* let b:NERDTreeView=winsaveview()
  au BufEnter *NERD_tree*
        \ if exists('b:NERDTreeView') |
        \   call winrestview(b:NERDTreeView) |
        \   unlet b:NERDTreeView |
        \ endif
aug END
