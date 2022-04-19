aug user:brewfile
  au!
  au BufNewFile,BufRead *Brewfile call s:brewfile()
aug END

function! s:brewfile()
  set filetype=brewfile syntax=brewfile
endfunction
