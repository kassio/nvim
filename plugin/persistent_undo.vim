set undofile undoreload=10000
let &undodir=g:data_dir."/undo"

aug undo_dir
  au!
  au FileType gitcommit setlocal noundofile
  au VimEnter *
        \ if !isdirectory(&undodir) |
        \   call mkdir(expand(&undodir), "p", 0700) |
        \ endif
aug END
