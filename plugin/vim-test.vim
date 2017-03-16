if has('nvim')
  let test#strategy = 'neoterm'
else
  let test#strategy = 'basic'
end

nnoremap <silent> <leader>ta :call neoterm#normal('G') \| call neoterm#clear() \| TestSuite<cr>
nnoremap <silent> <leader>tf :call neoterm#normal('G') \| call neoterm#clear() \| TestFile<cr>
nnoremap <silent> <leader>tc :call neoterm#normal('G') \| call neoterm#clear() \| TestNearest<cr>
nnoremap <silent> <leader>tr :call neoterm#normal('G') \| call neoterm#clear() \| TestLast<cr>

let test#runners = { 'Ruby': ['Testrbl', 'Minitest', 'Rspec'] }

for runner in test#runners['Ruby']
  exec printf("command! Use%sFile let b:neoterm_test_lib='%s'", runner, tolower(runner))
  exec printf("command! Use%s let g:neoterm_test_lib='%s'", runner, tolower(runner))
endfor
