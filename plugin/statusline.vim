if exists('b:statusline_setup_loaded')
  finish
endif
let b:statusline_setup_loaded=1

set laststatus=2

aug statusline_setup
  au!
   au! BufEnter,WinEnter,BufWritePost,CursorMoved,CursorMovedI *
         \ if &ft != "qf" && &ft != "nerdtree" |
         \ let &statusline="" |
         \ let &statusline.="%1*\ %n\ %*" |
         \ let &statusline.="%2*\ %t\ " |
         \ let &statusline.="%3*%m%*%*" |
         \ let &statusline.="%4*%=%*" |
         \ let &statusline.=SyntasticStatuslineFlag() |
         \ let &statusline.=tmux_runner#statusline#tmux(" [t: %s] ", "s", "F") |
         \ let &statusline.="%5*\ %r%y[%{&ff}][%{&fenc!=''?&fenc:&enc}][%c,%l/%L]\ %*" |
         \ endif
   au! BufLeave,WinLeave *
         \ if &ft != "qf" && &ft != "nerdtree" |
         \   let &l:statusline="[%n]\ %t%m%=%r%y[%{&ff}][%{&fenc!=''?&fenc:&enc}]" |
         \ endif
aug END
