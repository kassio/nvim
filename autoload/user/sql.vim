function! user#sql#break(line1, line2) abort
  let l:regexp = 's/\v(FROM|WHERE|INNER|ON|AND|ORDER)/\r\1/ge'
  let l:cmd = printf('silent %d,%d%s', a:line1, a:line2, l:regexp)
  call preserve#preserve(l:cmd)
endfunction
