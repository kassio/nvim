au BufRead,BufNewFile .babelrc,.jshintrc,.eslintrc setfiletype javascript
au BufRead,BufNewFile *
      \ if getline(1) =~? '\c^#!.*javascript' |
      \   let &filetype = 'javascript' |
      \ endif

let g:used_javascript_libs = 'react'
