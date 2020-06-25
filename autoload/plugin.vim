function! plugin#upgrade()
  PlugUpgrade
  PlugUpdate!
  PlugClean!

  CocUpdateSync
endfunction
