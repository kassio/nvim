function! test#neoterm#scope(scope) abort
  try
    P Tclear
    call s:neoterm_test_hook()
  catch /^Vim\%((\a\+)\)\=:E488/ " Trailing characters
    " noop
  finally
    exec 'Test'.a:scope
  endtry
endfunction

function! s:neoterm_test_hook() abort
  if exists('g:TestHook')
    echo 'Running the hook test'
    call g:TestHook()
  end
endfunction
