function! user#neoterm#clear() abort
  call neoterm#clear()
  call neoterm#normal('G')
endfunction

function! user#neoterm#hardclear() abort
  call user#neoterm#clear()
  call neoterm#vim_exec('setl scrollback=0')
  sleep 100m
  call neoterm#vim_exec('setl scrollback&')
endfunction

function! user#neoterm#vertical(lambda) abort
  let g:neoterm_position = 'vertical'
  call a:lambda()
  let g:neoterm_position = 'horizontal'
endfunction
