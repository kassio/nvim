function! fold#comments()
  let old_fdm=&foldmethod
  setlocal foldmethod=expr
  set foldexpr=getline(v:lnum)=~'^\\s*'.&commentstring[0]
  set foldenable
  %foldclose
  let &l:foldmethod=old_fdm
endfunction
