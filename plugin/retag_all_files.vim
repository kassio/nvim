aug retag_all_files
  au!
  au BufWritePost *
        \ if filereadable('tags') |
        \   call system('ctags -a ' . expand('%')) |
        \ endif
aug END
