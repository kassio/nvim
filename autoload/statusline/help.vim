function! statusline#help#(_) abort
  return   ' %n '
        \ . ' %{expand("%:t:r")} '
        \ . '%='
        \ . ' %{&ft} %{&fenc!=""?&fenc:&enc} '
endfunction
