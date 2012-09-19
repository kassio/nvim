" NERDTree
let g:NERDTreeWinPos="right"
let NERDTreeHighlightCursorline=1
nmap <silent> <Leader>p :execute "NERDTreeToggle \| :silent NERDTreeMirror"<CR>
nmap <silent> <Leader>P :NERDTree<CR>
nnoremap <silent> <Leader>fl :call FindInNERDTree()<CR>
