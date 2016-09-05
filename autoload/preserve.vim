function! preserve#preserve(command)
  setlocal lazyredraw

  let last_view = winsaveview()
  keeppatterns execute a:command
  call winrestview(last_view)

  redraw
  setlocal nolazyredraw
endfunction
