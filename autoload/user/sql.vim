function! user#sql#break(line1, line2) abort
  let l:regexp = 's/\v(SELECT|FROM|WHERE|AND|OR|INNER|UNION|\(|\))/\r&/ge'
  let l:cmd = printf('silent %d,%d%s', a:line1, a:line2, l:regexp)

  " Break on key words
  call preserve#preserve(l:cmd)
  " Remove every empty line
  call preserve#preserve(printf('global;^\_s*$;d'))
endfunction
