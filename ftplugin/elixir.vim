setl noautoindent

" Indent all file
nnoremap <leader>ff :call preserve#preserve('ALEFix')<cr>

nnoremap <leader>tf :<c-u>call test#elixir#run("File")<cr>
nnoremap <leader>tc :<c-u>call test#elixir#run("Nearest")<cr>
