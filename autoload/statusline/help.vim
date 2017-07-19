function! statusline#help#(_)
  return   ' %n '
        \ . ' %{expand("%:t:r")} '
        \ . '%='
        \ . ' %{&ft} %{&fenc!=""?&fenc:&enc} '
endfunction
