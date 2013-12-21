command! -range=% IndentAllFile :call Preserve(<line1>.','.<line2>.'normal! ==')
noremap <leader>ff :IndentAllFile<CR>
noremap <leader>fp :call Preserve('normal =ap')<CR>
