function! user#neoterm#clear()
  call neoterm#clear()
  call neoterm#normal('G')
endfunction

function! user#neoterm#hardclear()
  call TClear()
  call neoterm#vim_exec('setl scrollback=0')
  sleep 100m
  call neoterm#vim_exec('setl scrollback&')
endfunction
