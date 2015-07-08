function! grep#search(word)
  let @/ = text#escape_all(a:word)
  silent exec 'grep "' . @/ . '"'
  call feedkeys('n', 'n')
  let v:hlsearch = 1
  copen
endfunction
