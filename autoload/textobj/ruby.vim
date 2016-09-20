let s:block_start = '\<do\>'
let s:block_end = '\<en\zsd\>'
function! textobj#ruby#block_a()
  call searchpair(s:block_start, '', s:block_end)
  let end_pos = getpos('.')
  normal %
  let start_pos = getpos('.')

  return ['v', start_pos, end_pos]
endfunction

function! textobj#ruby#block_i()
  call searchpair(s:block_start, '', s:block_end)
  let [bufnum, lnum, col, off] = getpos('.')
  let end_pos = [bufnum, lnum-1, col, off]
  normal %
  let [bufnum, lnum, col, off] = getpos('.')
  let start_pos = [bufnum, lnum+1, col, off]

  return ['V', start_pos, end_pos]
endfunction
