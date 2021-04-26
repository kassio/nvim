let s:block_open = '\(^\s*\<class\>\|^\s*\<module\>\|^\s*def\>\|\<do\>\|\<if\>\)'

function! textobj#ruby#block_a()
  call search(s:block_open, 'bc')
  let start_pos = getpos('.')

  normal %
  let end_pos = getpos('.')

  return ['V', start_pos, end_pos]
endfunction

function! textobj#ruby#block_i()
  let pos = textobj#ruby#block_a()

  return [
        \ 'V',
        \ s:update_line_in(pos[1], 'inc'),
        \ s:update_line_in(pos[2], 'dec')
        \ ]
endfunction

function! s:update_line_in(pos, op)
  let l:line = a:pos[1]
  let a:pos[1] = a:op ==# 'inc' ? l:line + 1 : l:line - 1

  return a:pos
endfunction
