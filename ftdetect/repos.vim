aug repos
  au BufNewFile,BufRead repos call s:reposfile()
aug END

function! s:reposfile()
  set filetype=repos syntax=repos
endfunction
