function! plugin#upgrade()
  PlugUpgrade
  PlugClean!
  PlugUpdate!

  vnew
  CocUpdateSync
endfunction
