function! preserve#preserve(command)
  setlocal lazyredraw
  let last_search=@/

  let last_view = winsaveview()
  silent execute a:command
  call winrestview(last_view)

  let @/=last_search
  redraw
  setlocal nolazyredraw
endfunction
