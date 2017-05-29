function! color#current()
  let current_names = map(ScurrentStack(), { _, val ->
        \ uniq([synIDattr(val, "name"), synIDattr(synIDtrans(val), "name")])
        \ })

  return join(current_names, ', ')
endfunction

function! ScurrentStack()
  return synstack(line("."), col("."))
endfunction
