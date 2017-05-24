au BufRead,BufNewFile *
      \ if getline(1) =~ '\c^#!.*javascript' |
      \   let &filetype = 'javascript' |
      \ endif
