function! user#coc#install()
  let l:cmdheight=&cmdheight
  let &cmdheight=99
  silent call coc#util#install()
  let &cmdheight=l:cmdheight
endfunction
