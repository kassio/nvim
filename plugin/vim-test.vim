if has('nvim')
  let test#strategy = 'neoterm'
else
  let test#strategy = 'basic'
end

nnoremap <silent> <leader>ta :call neoterm#normal('G') \| call neoterm#clear() \| TestSuite<cr>
nnoremap <silent> <leader>tf :call neoterm#normal('G') \| call neoterm#clear() \| TestFile<cr>
nnoremap <silent> <leader>tc :call neoterm#normal('G') \| call neoterm#clear() \| TestNearest<cr>
nnoremap <silent> <leader>tr :call neoterm#normal('G') \| call neoterm#clear() \| TestLast<cr>

let test#runners = { 'Ruby': ['Testrbl'] }
