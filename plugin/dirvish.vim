nnoremap <leader>p :Dirvish<cr>
nnoremap <leader>vp :vnew +Dirvish<cr>
nnoremap <leader>fl :execute "Dirvish ".expand('%:p')<cr>

call dirvish#add_icon_fn({ path -> user#dirvish#icon(path) })
