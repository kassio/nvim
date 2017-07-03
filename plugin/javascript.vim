au BufRead,BufNewFile .babelrc,.jshintrc,.eslintrc setfiletype javascript
au BufRead,BufNewFile *
      \ if getline(1) =~ '\c^#!.*javascript' |
      \   setfiletype javascript |
      \ endif
