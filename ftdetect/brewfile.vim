au BufNewFile,BufRead Brewfile,.Brewfile call s:brewfile()

function! s:brewfile()
  set filetype=brewfile syntax=brewfile
endfunction
