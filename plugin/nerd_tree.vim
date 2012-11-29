" NERDTree
let g:NERDTreeWinPos="right"
let NERDTreeHighlightCursorline=1

function! MyNERDTreeOpen()
exec "NERDTreeToggle \| :silent NERDTreeMirror"
if (match(bufname(''), '^NERD_tree.*') == 0) && (getpos(".") == [0, 1, 1, 0])
  exec "NERDTree"
endif
endfunction

nmap <silent> <Leader>p :call MyNERDTreeOpen()<cr>
nnoremap <silent> <Leader>fl :call FindInNERDTree()<cr>
command! E exec ":NERDTree ".expand('%:p')
