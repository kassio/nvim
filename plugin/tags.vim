nnoremap <silent>g] :execute 'tselect ' . expand('<cword>')<cr>
nnoremap <silent><C-]> :execute 'tjump ' . expand('<cword>')<cr>
nnoremap <silent><C-w>g] :execute 'stselect ' . expand('<cword>')<cr>
nnoremap <silent><C-w><C-]> :execute 'stjump ' . expand('<cword>')<cr>

nnoremap <silent>g\ :call gem_tags#exec('tselect')<cr>
nnoremap <silent><C-\> :call gem_tags#exec('tjump')<cr>
nnoremap <silent><C-w>g\ :call gem_tags#exec('stselect')<cr>
nnoremap <silent><C-w><C-\> :call gem_tags#exec('stjump')<cr>

imap <c-x><c-]> <c-r>=gem_tags#complete('default')<cr>
inoremap <c-x><c-\> :let &l:tags=&g:tags
inoremap <c-x><c-\> <c-r>=gem_tags#complete('gems')<cr><c-x><c-\>
