vmap * :<C-u>call <SID>visual_text#get()<CR>//<CR>
vmap # :<C-u>call <SID>visual_text#get()<CR>??<CR>

" recursively vimgrep for word under cursor or selection if you hit leader-star
nmap <leader>* :execute 'noautocmd vimgrep /\V' . substitute(escape(expand("<cword>"), '\'), '\n', '\\n', 'g') . '/ **'<CR>
vmap <leader>* :<C-u>call <SID>visual_text#get()<CR>:execute 'noautocmd vimgrep /' . @/ . '/ **'<CR>
