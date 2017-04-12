function! window#focus()
  if &buftype == "terminal" || &filetype == "help"
    setlocal cursorline norelativenumber nonumber
  else
    setlocal cursorline< relativenumber< cursorline<
  end
endfunction

function! window#unfocus()
  setlocal norelativenumber nocursorline
endfunction
