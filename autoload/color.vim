function! color#current()
  let current_names = map(s:currentStack(), 's:colorNamesFor(v:val)')

  return join(current_names, ', ')
endfunction

function! s:colorNamesFor(val)
  return uniq([synIDattr(a:val, "name"), synIDattr(synIDtrans(a:val), "name")])
endfunction

function! s:currentStack()
  return synstack(line("."), col("."))
endfunction
