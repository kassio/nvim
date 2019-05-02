aug repos
  au BufNewFile,BufRead Reposfile,Reposfile.* call s:reposfile()
aug END

function! s:reposfile()
  set filetype=reposfile syntax=reposfile
endfunction
