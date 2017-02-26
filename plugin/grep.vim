" Grep commands
command! -complete=dir -nargs=+ Grep call grep#quoted(<q-args>)

" Grep mappings
vnoremap <leader>as :<c-u>call grep#quoted(text#get_visual())<cr>
nnoremap <leader>as :call grep#quoted(expand("<cword>"))<cr>
