function! grep#quoted(term) abort
  exec printf('silent! grep! %s', a:term)

  if !empty(getqflist())
    call text#highlight(a:term)
    botright copen
  else
    echo printf('%s not found.', string(a:term))
  end
endfunction
