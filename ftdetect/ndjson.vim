aug user:repos
  au!
  au BufNewFile,BufRead *.ndjson call s:set_filetype()
aug END

function! s:set_filetype()
  set filetype=ndjson syntax=json
endfunction
