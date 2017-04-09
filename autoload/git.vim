function! git#checkout(...)
  if a:0 && (a:1 == '%' || a:1 == '')
    exec '!git checkout ' . expand('%:p')
  else
    exec '!git checkout ' . a:1
  end
  edit
endfunction
