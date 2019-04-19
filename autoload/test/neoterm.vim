function! test#neoterm#scope(scope) abort
  try
    P Tclear
    call s:neoterm_test_before_hook()
    exec 'Test'.a:scope
  catch /.*/
    " noop
  finally
    call s:neoterm_test_after_hook()
  endtry
endfunction

function! s:neoterm_test_before_hook() abort
  if exists('g:TestBeforeHook')
    echo 'Running the hook test'
    call g:TestBeforeHook()
  end
endfunction

function! s:neoterm_test_after_hook() abort
  if exists('g:TestAfterHook')
    echo 'Running the hook test'
    call g:TestAfterHook()
  end
endfunction
