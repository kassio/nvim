if has('nvim')
  let test#strategy = 'neoterm'
else
  let test#strategy = 'basic'
end

nnoremap <silent> <leader>ta :call <sid>test("Suite")<cr>
nnoremap <silent> <leader>tf :call <sid>test("File")<cr>
nnoremap <silent> <leader>tc :call <sid>test("Nearest")<cr>
nnoremap <silent> <leader>tr :call <sid>test("Last")<cr>

function! s:test(scope)
  try
    P call neoterm#normal('G')
    P call neoterm#clear()
  catch /^Vim\%((\a\+)\)\=:E488/ " Trailing characters
    " noop
  finally
    exec "Test".a:scope
  endtry
endfunction
