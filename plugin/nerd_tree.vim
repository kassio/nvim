" NERDTree
let g:NERDTreeWinPos="right"
let NERDTreeHighlightCursorline=1
nmap <silent> <Leader>p :execute "NERDTreeToggle \| :silent NERDTreeMirror"<CR>
nnoremap <silent> ,fl :call FindInNERDTree()<CR>
