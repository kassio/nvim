let g:signs_to_ignore = ['ALEDummySign']

function! sign#next() abort
  let l:next = sign#get(1)
  let l:pos = getpos('.')
  let l:pos[1] = l:next.line

  call setpos('.', pos)
endfunction

function! sign#previous() abort
  let l:next = sign#get(0)
  let l:pos = getpos('.')
  let l:pos[1] = l:next.line

  call setpos('.', pos)
endfunction

function! sign#get(asc) abort
  let l:line = line('.')
  let l:signs = sign#all()
  let l:signs = a:asc ? l:signs : reverse(l:signs)
  let l:fallback = get(l:signs, 0, { 'line': l:line })
  let s:comp = a:asc ? { a, b -> a > b } : { a, b -> a < b }

  for l:sign in l:signs
    if s:comp(l:sign.line, l:line)
      let l:next = l:sign
      break
    end
  endfor

  return get(l:, 'next', l:fallback)
endfunction

function! sign#all() abort
  let l:signs = execute(printf('sign place buffer=%s', bufnr('%')))

  let l:values = map(split(l:signs, '\n'), function('sign#format'))
  let l:values = filter(copy(l:values), { _, value -> type(value) == type({}) && index(g:signs_to_ignore, value.name) < 0 })
  let l:values = sort(copy(l:values), { a, b -> a.line == b.line ? 0 : a.line > b.line ? 1 : -1 })

  return l:values
endfunction

function! sign#format(index, line) abort
  let l:values = matchlist(a:line, 'line=\(\d\+\)\s*id=\(\d\+\)\s*name=\(\w\+\)')
  if !empty(l:values)
    return { 'line': str2nr(l:values[1]), 'id': str2nr(l:values[2]), 'name': l:values[3] }
  end
endfunction
