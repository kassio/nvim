function! window#focus()
  if empty(&buftype)
    if &buftype == "terminal"
      setlocal cursorline
    else
      setlocal relativenumber cursorline
    end
  end
endfunction

function! window#unfocus()
  if empty(&buftype) || &buftype == "terminal"
    setlocal norelativenumber nocursorline
  end
endfunction
