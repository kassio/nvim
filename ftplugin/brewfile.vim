function! s:sort()
  sort /^tap.*/ r
  sort /\v^(brew|cask|mas).*/ r
endfunction

command! Sort call s:sort()
