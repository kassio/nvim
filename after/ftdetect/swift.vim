aug user:swift
  au!
  au BufNewFile,BufRead *.swift,*.swiftinterface set filetype=swift
  au BufRead * call s:swift()
aug END

function! s:swift()
  if getline(1) =~ "^#!.*swift"
    set filetype=swift
  endif
endfunction
