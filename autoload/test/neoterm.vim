function! test#neoterm#scope(scope)
  try
    P call neoterm#normal('G')
    P call neoterm#clear()
  catch /^Vim\%((\a\+)\)\=:E488/ " Trailing characters
    " noop
  finally
    exec "Test".a:scope
  endtry
endfunction
