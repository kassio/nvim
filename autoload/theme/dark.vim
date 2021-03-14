function! theme#dark#load()
  colorscheme onehalfdark
  set background=dark
  lua require'lualine'.options.theme = 'onedark'

  lua require('my/theme').load('onedark')
  call theme#defaults#load()
endfunction
