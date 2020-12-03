function! plugin#upgrade()
  PlugUpgrade
  PlugClean!
  PlugUpdate!

  TSInstall all
  TSUpdate
endfunction
