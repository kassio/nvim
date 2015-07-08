let &grepformat='%f:%l:%c:%m,%f:%l:%m'
let &grepprg="ag -U --silent --follow --column --smart-case"

vnoremap <leader>as :<c-u>grep#search(text#get_visual())<cr>
nnoremap <leader>as :grep#search(expand('<cword>'))<cr>

command! -nargs=+ Grep call grep#search(<q-args>)
