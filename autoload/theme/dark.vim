function! theme#dark#load()
  colorscheme onehalfdark
  set background=dark

  lua require('my/theme').load('onedark')
  call theme#defaults#load()
endfunction
