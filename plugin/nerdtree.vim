if exists('b:nerdree_setup_loaded')
  finish
endif
let b:nerdree_setup_loaded=1

let NERDTreeWinPos="right"
let NERDTreeHighlightCursorline=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1

" If possible open a NERDTreeMirror
function! OpenNERDTreeMirror()
  try
    :NERDTreeToggle | NERDTreeMirror
  catch /^Vim\%((\a\+)\)\=:E121/
    :NERDTree
  catch
    redraw
  endtry
endfunction

nmap <silent> <leader>p :call OpenNERDTreeMirror()<CR>
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
