let test#runners = { 'Ruby': ['Testrbl'] }

if has('nvim')
  let test#strategy = 'neoterm'
else
  let test#strategy = 'basic'
end

nnoremap <silent> <leader>ta :call test#neoterm#scope("Suite")<cr>
nnoremap <silent> <leader>tf :call test#neoterm#scope("File")<cr>
nnoremap <silent> <leader>tc :call test#neoterm#scope("Nearest")<cr>
nnoremap <silent> <leader>tr :call test#neoterm#scope("Last")<cr>
