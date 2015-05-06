function! statusline#neomake(scope)
  let signs = neomake#statusline#LoclistCounts()

  if has_key(signs, a:scope)
    return printf("[%s:%s]", a:scope, signs[a:scope])
  else
    return ""
  end
endfunction
