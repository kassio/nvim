function! preserve#preserve(command) abort
  let l:winid = win_getid()
  let l:bufnr = bufnr('%')
  let l:last_view = winsaveview()

  try
    keeppatterns execute a:command
  catch /.*/
    " noop
  finally
    exec printf('buffer %s', l:bufnr)
    call win_gotoid(l:winid)
    call winrestview(l:last_view)
    redraw
  endtry
endfunction
