function! plugin#upgrade()
  lua require'plugins'

  PackerCompile
  PackerSync

  if exists(':TSInstall')
    TSInstall all
    TSUpdate
  end
endfunction
