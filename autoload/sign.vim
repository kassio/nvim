let g:signs_to_ignore = ['ALEDummySign']

function! sign#goto(dir) abort
  let l:next = a:dir == 'previous' ? sign#get(0) : sign#get(1)
  let l:pos = getpos('.')
  let l:pos[1] = l:next.line

  call setpos('.', pos)
endfunction

function! sign#get(asc) abort
  let l:line = line('.')
  let s:comp = a:asc ? { a, b -> a > b } : { a, b -> a < b }
  let l:signs = a:asc ? sign#all() : reverse(sign#all())
  let l:fallback = get(l:signs, 0, { 'line': l:line })

  for l:sign in l:signs
    if s:comp(l:sign.line, l:line)
      let l:next = l:sign
      break
    end
  endfor

  if exists('l:next')
    echo ""
    return l:next
  else
    let l:msg = a:asc ?
          \ 'Search hit BOTTOM, continuing at TOP' :
          \ 'Search hit TOP, continuing at BOTTOM'
    call util#echohl('WarningMsg', l:msg)
    return l:fallback
  end
endfunction

function! sign#all() abort
  let l:signs = execute(printf('sign place buffer=%s', bufnr('%')))
  let l:values = map(split(l:signs, '\n'), function('sign#format'))
  let l:values = filter(copy(l:values), function('sign#filter'))
  let l:values = sort(copy(l:values), function('sign#sort'))

  return l:values
endfunction

function! sign#format(index, line) abort
  let l:values = matchlist(a:line, 'line=\(\d\+\)\s*id=\(\d\+\)\s*name=\(\w\+\)')
  if !empty(l:values)
    return { 'line': str2nr(l:values[1]), 'id': str2nr(l:values[2]), 'name': l:values[3] }
  end
endfunction

function! sign#filter(index, value) abort
  return type(a:value) == type({}) && index(g:signs_to_ignore, a:value.name) < 0
endfunction

function! sign#sort(comp1, comp2) abort
  return a:comp1.line == a:comp2.line ? 0 : a:comp1.line > a:comp2.line ? 1 : -1
endfunction
