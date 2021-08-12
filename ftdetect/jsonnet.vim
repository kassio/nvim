aug user:jsonnet
  au!
  au BufRead,BufNewFile *.libsonnet call s:set_filetype()
  au BufRead,BufNewFile *.jsonnet call s:set_filetype()
aug END

function! s:set_filetype()
  set filetype=jsonnet syntax=jsonnet
endfunction
