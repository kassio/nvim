if exists('b:statusline_setup_loaded')
  finish
endif

set laststatus=2
set statusline=%!statusline#default()

aug statusline_setup
  au!
  au! BufEnter,WinEnter *
        \ if &ft != "qf" |
        \   set statusline< |
        \ endif
  au! BufLeave,WinLeave *
        \ if &ft != "qf" |
        \   let &l:statusline="[%n]\ %t%m%=%r%y[%{&ff}][%{&fenc!=''?&fenc:&enc}]" |
        \ endif
aug END
