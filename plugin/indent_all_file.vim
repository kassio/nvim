command! IndentAllFile :call Preserve('normal gg=G')
noremap ,ff :IndentAllFile<CR>
