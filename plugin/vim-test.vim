let g:test#strategy = 'neoterm'
let g:test#go#gotest#executable = 'go test -v'

nnoremap <leader>ta :<c-u>call test#neoterm#scope("Suite")<cr>
nnoremap <leader>tf :<c-u>call test#neoterm#scope("File")<cr>
nnoremap <leader>tc :<c-u>call test#neoterm#scope("Nearest")<cr>
nnoremap <leader>tr :<c-u>call test#neoterm#scope("Last")<cr>
