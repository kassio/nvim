function! preserve#preserve(command)
  setlocal lazyredraw
  let l:search=@/

  let last_view = winsaveview()
  silent execute a:command
  call winrestview(last_view)

  let @/=l:search
  redraw
  setlocal nolazyredraw
endfunction
