function! grep#search(word)
  let @/ = text#escape_all(a:word)
  call feedkeys(":let v:hlsearch=1\<cr>", "n")
  silent exec 'grep "' . @/ . '"'
  copen
endfunction
