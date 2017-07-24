function! fold#comments() abort
  try
    let old_fdm=&foldmethod
    setlocal foldmethod=expr
    set foldexpr=getline(v:lnum)=~'^\\s*'.&commentstring[0]
    set foldenable
    %foldclose
    let &l:foldmethod=old_fdm
  catch /E490/
    " noop
  endtry
endfunction
