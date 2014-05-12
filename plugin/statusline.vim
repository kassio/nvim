set laststatus=2

set statusline=%!statusline#build()

aug statusline_setup
  au!
  au! BufEnter,WinEnter *
        \ if &ft != "qf" && &ft != "nerdtree" |
        \   set statusline< |
        \ endif
  au! BufLeave,WinLeave *
        \ if &ft != "qf" && &ft != "nerdtree" |
        \   let &l:statusline="[%n]\ %t%m%=%r%y[%{&ff}][%{&fenc!=''?&fenc:&enc}]" |
        \ endif
aug END
