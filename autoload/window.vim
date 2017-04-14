function! window#focus()
  if &buftype == "terminal" || index(["help", "nerdtree"], &filetype) >= 0
    setlocal cursorline norelativenumber nonumber
  else
    setlocal cursorline< relativenumber< cursorline<
  end
endfunction

function! window#unfocus()
  setlocal norelativenumber nocursorline
endfunction
