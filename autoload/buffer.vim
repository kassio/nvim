function! buffer#kill()
  if &ft =~? 'nerdtree' || &bt =~? 'terminal'
    close
  else
    bwipeout!
  endif
endfunction

function! buffer#killall()
  let all_buffers = copy(range(1, bufnr('$')))
  let buffers = filter(all_buffers, 's:shouldKill(v:val)')

  exec 'bw! '. join(buffers, ' ')
endfunction

function! s:shouldKill(bufid)
  let bufname = bufname(a:bufid)
  return
        \ bufname !~ 'NERD_tree' &&
        \ bufname !~ 'terminal' &&
        \ bufname !~ 'ControlP'
endfunction

function! buffer#trim()
  let l:hls = &hls
  setlocal nohls
  call preserve#preserve('silent %s/\v\s+$//e')
  call preserve#preserve('silent %s/\v($\n\s*)+%$//e')
  let &hls = l:hls
endfunction
