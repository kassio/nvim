function! preserve#preserve(command)
  setlocal lazyredraw

  let l:bufnr = bufnr('%')
  let l:last_view = winsaveview()
  keeppatterns execute a:command
  exec printf('buffer %s', l:bufnr)
  call winrestview(l:last_view)

  redraw
  setlocal nolazyredraw
endfunction
