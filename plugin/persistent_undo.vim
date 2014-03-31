if exists('b:persistent_undo_setup_loaded')
  finish
endif
let b:persistent_undo_setup_loaded=1

set undofile undolevels=1000 undoreload=10000 undodir=~/.vim_data/undo

aug undo_dir
  au!
  au FileType gitcommit setlocal noundofile
  au VimEnter *
        \ if !isdirectory(&undodir) |
        \   call mkdir(expand(&undodir), "p", 0700) |
        \ endif
aug END
