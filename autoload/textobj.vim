function! textobj#entire_file() abort
  normal! gg
  let l:head_pos = getpos('.')
  normal! G$
  let l:tail_pos = getpos('.')
  return ['V', l:head_pos, l:tail_pos]
endfunction

function! textobj#current_line_a() abort
  normal! 0
  let l:head_pos = getpos('.')
  normal! $
  let l:tail_pos = getpos('.')
  return ['v', l:head_pos, l:tail_pos]
endfunction

function! textobj#current_line_i() abort
  normal! ^
  let l:head_pos = getpos('.')
  normal! g_
  let l:tail_pos = getpos('.')
  return ['v', l:head_pos, l:tail_pos]
endfunction
