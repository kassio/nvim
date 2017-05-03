function! window#focus(...)
  let properties = get(a:, "1", ["cursorline", "norelativenumber", "nonumber"])

  if &buftype == "terminal" || index(["help", "nerdtree", "fugitiveblame"], &filetype) >= 0
    exec "setlocal ".join(properties, " ")
  else
    exec "setlocal ".join(map(properties, {_, val -> val."<"}), " ")
  end
endfunction

function! window#unfocus(...)
  let properties = get(a:, "1", ["nocursorline", "norelativenumber"])

  exec "setlocal ".join(properties, " ")
endfunction
