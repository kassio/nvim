let &grepformat='%f:%l:%c:%m,%f:%l:%m'
let &grepprg="ag -U --silent --follow --column --smart-case"

vnoremap <leader>as :<c-u>let @/ = text#escape_all(text#get_visual()) \|
      \ let v:hlsearch = 1 \|
      \ exec 'silent! grep "' . @/ . '"' \|
      \ copen<cr>
nnoremap <leader>as :let @/ = expand('<cword>') \|
      \ let v:hlsearch = 1 \|
      \ exec 'silent! grep ' . expand('<cword>') \|
      \ copen<cr>
