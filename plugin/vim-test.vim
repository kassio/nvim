if has('nvim')
  let test#strategy = 'neoterm'
else
  let test#strategy = 'basic'
end

nnoremap <silent> <leader>ta :TestSuite<cr>
nnoremap <silent> <leader>tf :TestFile<cr>
nnoremap <silent> <leader>tc :TestNearest<cr>
nnoremap <silent> <leader>tr :TestLast<cr>
