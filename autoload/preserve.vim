function! preserve#preserve(command)
  setlocal lazyredraw

  let bufnr = bufnr("%")
  let last_view = winsaveview()
  keeppatterns execute a:command
  exec "buffer ".bufnr
  call winrestview(last_view)

  redraw
  setlocal nolazyredraw
endfunction

command! -nargs=+ P call preserve#preserve(<q-args>)
