function! color#current() abort
  return color#names(line('.'), col('.'))
endfunction

function! color#names(line, col)
  let l:stack = synstack(a:line, a:col)
  let l:current_names = map(l:stack, { _, val ->
        \ uniq([synIDattr(val, 'name'), synIDattr(synIDtrans(val), 'name')])
        \ })

  return s:flatten(l:current_names)
endfunction

function! s:flatten(list, ...)
  let l:result = a:0 > 0 ? a:1 : []
  for l:item in a:list
    if type(l:item) == type([])
      call s:flatten(l:item, l:result)
    else
      call add(l:result, l:item)
    end
  endfor

  return l:result
endfunction
