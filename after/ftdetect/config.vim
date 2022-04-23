aug user:configfile
  au!
  au BufNewFile,BufRead *.config,gitconfig* call s:conffile()
aug END

function! s:conffile()
  set filetype=config syntax=dosini
endfunction
