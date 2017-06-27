let s:ignored_filetypes = [
      \ "help",
      \ "nerdtree",
      \ "fugitiveblame",
      \ "man"
      \ ]
let s:ignored_buftypes = [
      \ "terminal"
      \ ]

function! window#focus(...)
  let properties = a:0 ? copy(a:000) : ["cursorline", "norelativenumber", "nonumber"]

  if s:is_ignored()
    exec printf("setlocal %s", join(properties, " "))
  else
    exec printf("setlocal %s", join(map(properties, {_, val -> val."<"}), " "))
  end
endfunction

function! s:is_ignored()
  return index(s:ignored_buftypes, &buftype) >= 0 ||
        \ index(s:ignored_filetypes, &filetype) >= 0
endfunction

function! window#unfocus(...)
  let properties = a:0 ? copy(a:000) : ["nocursorline", "norelativenumber"]

  exec "setlocal ".join(properties, " ")
endfunction
