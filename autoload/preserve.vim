function! preserve#preserve(command) abort
  setlocal lazyredraw
  let l:bufnr = bufnr('%')
  let l:last_view = winsaveview()

  try
    keeppatterns execute a:command
  catch /.*/
    " noop
  finally
    exec printf('buffer %s', l:bufnr)
    call winrestview(l:last_view)
    redraw
    setlocal nolazyredraw
  endtry
endfunction
