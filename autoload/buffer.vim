function! buffer#kill()
  if &ft =~? 'nerdtree'
    normal q
  else
    bwipeout!
  endif
endfunction
