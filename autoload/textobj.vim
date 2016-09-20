function! textobj#entire_file()
  normal! gg
  let head_pos = getpos('.')
  normal! G$
  let tail_pos = getpos('.')
  return ['V', head_pos, tail_pos]
endfunction

function! textobj#current_line_a()
  normal! 0
  let head_pos = getpos('.')
  normal! $
  let tail_pos = getpos('.')
  return ['v', head_pos, tail_pos]
endfunction

function! textobj#current_line_i()
  normal! ^
  let head_pos = getpos('.')
  normal! g_
  let tail_pos = getpos('.')
  return ['v', head_pos, tail_pos]
endfunction
