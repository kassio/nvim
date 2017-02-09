function! grep#grep(...)
  let args = copy(a:000)
  let folder = match(args[-1], '/\*$') >= 0 ? remove(args, -1) : ""
  let text = join(args, " ")
  let highlight = match(text, '["''].\{-}["'']') >= 0 ? text : string(text)
  let highlight = substitute(highlight, '\b', '')

  exec "silent! grep! ".text." ".folder." | let @/=".highlight

  if !empty(getqflist())
    botright copen
  else
    echo text . " not found."
  end
endfunction
