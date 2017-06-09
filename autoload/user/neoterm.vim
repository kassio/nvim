function! user#neoterm#clear()
  call neoterm#clear()
  call neoterm#normal('G')
endfunction

function! user#neoterm#hardclear()
  call user#neoterm#clear()
  call neoterm#vim_exec('setl scrollback=0')
  sleep 100m
  call neoterm#vim_exec('setl scrollback&')
endfunction

function! user#neoterm#vertical(lambda)
  let g:neoterm_position = "vertical"
  call a:lambda()
  let g:neoterm_position = "horizontal"
endfunction
