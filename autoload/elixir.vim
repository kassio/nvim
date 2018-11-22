function! elixir#format()
  write
  " call preserve#preserve('normal gg=G')
  if executable('mix')
    call system('mix format ' . expand('%'))
  end
  checktime
endfunction
