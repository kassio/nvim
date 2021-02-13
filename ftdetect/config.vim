aug user:configfile
  au!
  au BufNewFile,BufRead *.conf call s:conffile()
aug END

function! s:conffile()
  set filetype=config syntax=dosini
endfunction
