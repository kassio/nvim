function! text#get_visual()
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]

  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][:col2 - 1]
  let lines[0] = lines[0][col1 - 1:]

  return join(lines, "\\n")
endfunction

function! text#highlight_visual()
  call text#highlight(text#get_visual())
endfunction

function! text#highlight(text)
  let @/ = escape(a:text, " *^$./\[]")
  call feedkeys(":let v:hlsearch=1\<cr>", "n")
  call feedkeys(":call preserve#preserve('%s///gne')\<cr>", "n")
endfunction

function! text#highlight_sensitive_visual()
  call text#highlight_sensitive(text#get_visual())
endfunction

function! text#highlight_sensitive(text)
  let @/ = '\C' . escape(a:text, ' *^$./\[]')
  call feedkeys(":let v:hlsearch=1\<cr>", "n")
endfunction

function! text#escape_all(text)
  return substitute(escape(a:text, '#*^$.?/\|{[()]}'), '\n', '\\n', 'g')
endfunction
