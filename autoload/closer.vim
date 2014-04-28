function! closer#open(sym)
  if has_key(g:closers, a:sym)
    call add(g:closer_stack, a:sym)
    return a:sym . g:closers[a:sym]
  endif
endfunction

function! closer#get_out()
  if len(g:closer_stack) > 0
    let l:sym = remove(g:closer_stack, -1)
    let pos = searchpos(g:closers[l:sym], 'c')
    let pos = [0, get(pos, 0), get(pos, 1), 0]
    call setpos('.', pos)
  endif

  return ''
endfunction
