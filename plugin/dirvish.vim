scriptencoding utf-8

nnoremap <leader>p :Dirvish<cr>
nnoremap <leader>fl :execute "Dirvish ".expand('%:p')<cr>

call dirvish#add_icon_fn({p -> p[-1:] == '/' ? '📂' : '📄'})
