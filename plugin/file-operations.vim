function! s:chmod(mod)
  call system(printf('chmod %s %s', a:mod, expand('%s:p')))
endfunction
command! -nargs=1 Chmod call s:chmod(<q-args>)
