function! buffer#kill()
  if &ft =~? 'nerdtree'
    normal q
  else
    bwipeout!
  endif
endfunction

function! buffer#trim()
  let l:hls = &hls
  setlocal nohls
  call preserve#preserve('silent %s/\v\s+$//e')
  call preserve#preserve('silent %s/\v($\n\s*)+%$//e')
  let &hls = l:hls
endfunction
