function! statusline#neomake()
  let signs = neomake#statusline#LoclistCounts()
  if signs != {}
    return printf("[E:%s|W:%s]", signs['E'], signs['W'])
  else
    return ""
  end
endfunction
