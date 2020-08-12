function! plugin#upgrade(quit)
  PlugUpgrade
  PlugClean!
  PlugUpdate!

  vnew
  CocUpdateSync
  sleep 200m
  redraw!

  if a:quit && confirm('Close?')
    confirm qall
  end
endfunction
