" NERDTree
let g:NERDTreeWinPos="right"
let NERDTreeHighlightCursorline=1

function! MyNERDTreeOpen()
exec "NERDTreeToggle \| :silent NERDTreeMirror"

if (match(bufname(''), '^NERD_tree.*') == 0) && (len(getline(0,'$')) <= 1)
  exec "NERDTree"
endif
endfunction

nmap <silent> <Leader>p :call MyNERDTreeOpen()<cr>
nnoremap <silent> <Leader>fl :call FindInNERDTree()<cr>
command! E exec ":NERDTree ".expand('%:p')
