function! preserve#preserve(command) abort
  try
    setlocal lazyredraw

    let l:bufnr = bufnr('%')
    let l:last_view = winsaveview()
    keeppatterns execute a:command
    exec printf('buffer %s', l:bufnr)
    call winrestview(l:last_view)

  finally
    redraw
    setlocal nolazyredraw
  endtry
endfunction
