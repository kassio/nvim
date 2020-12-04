function! plugin#upgrade()
  lua require'my/plugins'

  PackerCompile
  PackerSync

  if exists(':TSUpdate')
    TSUpdate
  end
endfunction
