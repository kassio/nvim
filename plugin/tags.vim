nnoremap <silent>g] :execute 'tselect ' . expand('<cword>')<CR>
nnoremap <silent><C-]> :execute 'tjump ' . expand('<cword>')<CR>
nnoremap <silent><C-w>g] :execute 'stselect ' . expand('<cword>')<CR>
nnoremap <silent><C-w><C-]> :execute 'stjump ' . expand('<cword>')<CR>

nnoremap <silent>g\ :call gem_tags#exec('tselect')<CR>
nnoremap <silent><C-\> :call gem_tags#exec('tjump')<CR>
nnoremap <silent><C-w>g\ :call gem_tags#exec('stselect')<CR>
nnoremap <silent><C-w><C-\> :call gem_tags#exec('stjump')<CR>
