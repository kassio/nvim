function! plugin#upgrade()
  lua require'my/plugins'

  PackerCompile
  PackerSync

  TSUpdate
endfunction
