aug user:repos
  au!
  au BufNewFile,BufRead Reposfile call s:reposfile()
aug END

function! s:reposfile()
  set filetype=reposfile syntax=reposfile
endfunction
