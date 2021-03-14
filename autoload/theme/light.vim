function theme#light#load()
  colorscheme onehalflight
  set background=light

  lua require('my/theme').load('onelight')
  call theme#defaults#load()
endfunction
