function theme#light#load()
  colorscheme onehalflight
  set background=light

  hi! StatusLine   guifg=#EEEEEE guibg=#383a42
  hi! StatusLineNC guifg=#CCCCCC guibg=#555555

  call theme#defaults#load()
endfunction
