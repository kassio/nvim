let &grepformat='%f:%l:%c:%m,%f:%l:%m'
let &grepprg="ag -U --silent --follow --column --smart-case"

vnoremap <silent> <leader>as :<c-u>call grep#search(text#get_visual(), 1)<cr>
nnoremap <silent> <leader>as :call grep#search(expand("<cword>"), 1)<cr>

command! -nargs=+ Grep call grep#search(<q-args>, 0)
