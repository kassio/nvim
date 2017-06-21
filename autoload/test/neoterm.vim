function! test#neoterm#scope(scope)
  try
    P call neoterm#normal('G')
    P call neoterm#clear()
    call s:neoterm_test_hook()
  catch /^Vim\%((\a\+)\)\=:E488/ " Trailing characters
    " noop
  finally
    exec 'Test'.a:scope
  endtry
endfunction

function! s:neoterm_test_hook()
  if exists('g:TestHook')
    echo 'Running the hook test'
    call g:TestHook()
  end
endfunction
