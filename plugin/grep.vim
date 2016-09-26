" Grep commands
command! -complete=dir -nargs=+ Grep call grep#search(<q-args>)

" Grep mappings
vnoremap <silent> <leader>as :<c-u>call grep#autosearch(text#get_visual())<cr>
nnoremap <silent> <leader>as :call grep#autosearch(expand("<cword>"))<cr>
