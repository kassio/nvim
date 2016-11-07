" Grep commands
command! -complete=dir -nargs=+ Grep call grep#search(<q-args>)

" Grep mappings
vnoremap <silent> <leader>as :<c-u>call grep#autosearch(text#get_visual())<cr>
nnoremap <silent> <leader>as :call grep#autosearch(expand("<cword>"))<cr>

command! -bang -nargs=* Find call
      \ fzf#vim#grep(
      \ 'rg '.$RG_OPTIONS.' --column --line-number --no-heading --fixed-strings --ignore-case '.shellescape(<q-args>),
      \ 1,
      \ <bang>0
      \ )
