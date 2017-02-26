function! grep#quoted(term)
  exec "silent! grep! ".a:term

  if !empty(getqflist())
    call text#highlight(a:term)
    botright copen
  else
    echo string(a:term) . " not found."
  end
endfunction
