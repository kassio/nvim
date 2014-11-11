set undofile undolevels=1000 undoreload=10000 undodir=~/.nvim_data/undo

aug undo_dir
  au!
  au FileType gitcommit setlocal noundofile
  au VimEnter *
        \ if !isdirectory(&undodir) |
        \   call mkdir(expand(&undodir), "p", 0700) |
        \ endif
aug END
