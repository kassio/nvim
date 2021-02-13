aug user:javascript
  au!
  au BufRead,BufNewFile * call s:set_filetype()
aug END

function! s:set_filetype()
  if getline(1) =~? '\c^#!.*javascript' |
    let &filetype = 'javascript' |
  endif
endfunction
