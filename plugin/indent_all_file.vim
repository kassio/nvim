command! IndentAllFile :call Preserve('normal gg=G')
noremap <leader>ff :IndentAllFile<CR>
noremap <leader>fp :call Preserve('normal =ap')<CR>
