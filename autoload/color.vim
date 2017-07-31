function! color#current() abort abort
  let l:current_names = map(s:current_stack(), { _, val ->
        \ uniq([synIDattr(val, 'name'), synIDattr(synIDtrans(val), 'name')])
        \ })

  return join(l:current_names, ', ')
endfunction

function! s:current_stack() abort
  return synstack(line('.'), col('.'))
endfunction
