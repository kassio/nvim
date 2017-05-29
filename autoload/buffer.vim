function! buffer#restore_cursor_position()
  if !exists('b:open_at_first_line') &&
        \ line("'\"") > 0 &&
        \ line("'\"") <= line("$") |
    execute 'normal! g`"'
  end
endfunction

function! buffer#kill()
  if &ft =~? 'nerdtree' || &bt =~? 'terminal'
    close
  else
    bwipeout!
  end
endfunction

function! buffer#killall()
  let buffers = buffer#user_buffers()

  if !empty(buffers)
    exec 'bw! '. join(buffers, ' ')
  end
endfunction

function! buffer#wipeall()
  let buffers = buffer#user_buffers({ bufid ->
        \   !buflisted(bufid) ||
        \   !bufloaded(bufid) ||
        \   getbufvar(bufid, '&bt') != ''
        \ })

  if !empty(buffers)
    exec 'bw! '. join(buffers, ' ')
  end
endfunction

function! buffer#user_buffers(...)
  let ExtraFilters = a:0 ? a:1 : { bufid -> v:true }
  let buffers = range(1, bufnr('$'))

  return filter(copy(buffers), { _, bufid ->
        \   bufexists(bufid) &&
        \   bufname(bufid) !~ 'NERD_tree' &&
        \   bufname(bufid) !~ 'term:.*' &&
        \   ExtraFilters(bufid)
        \ })
endfunction

function! buffer#trim()
  let l:hls = &hls
  setlocal nohls
  call preserve#preserve('silent %s/\v\s+$//e')
  call preserve#preserve('silent %s/\v($\n\s*)+%$//e')
  let &hls = l:hls
endfunction
