function! color#current() abort
  return color#names(line('.'), col('.'))
endfunction

function! color#names(line, col)
  let l:stack = synstack(a:line, a:col)
  let l:current_names = map(l:stack, { _, val ->
        \ uniq([synIDattr(val, 'name'), synIDattr(synIDtrans(val), 'name')])
        \ })

  return util#flatten(l:current_names)
endfunction
