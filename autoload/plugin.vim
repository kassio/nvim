function! plugin#upgrade()
  PlugUpgrade
  PlugClean!
  PlugUpdate!

  vnew
  CocUpdateSync
  sleep 200m
  redraw!
endfunction
