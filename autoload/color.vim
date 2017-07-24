function! color#current() abort
  let current_names = map(s:current_stack(), { _, val ->
        \ uniq([synIDattr(val, 'name'), synIDattr(synIDtrans(val), 'name')])
        \ })

  return join(current_names, ', ')
endfunction

function! s:current_stack()
  return synstack(line('.'), col('.'))
endfunction
