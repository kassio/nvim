function! plugin#upgrade()
  PlugUpgrade
  PlugClean!
  PlugUpdate!
endfunction
