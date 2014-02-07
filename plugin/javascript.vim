aug json_as_js
  au!
  au BufNewFile,BufRead *.json setf javascript
aug END

let b:javascript_fold=0
let g:javascript_enable_domhtmlcss=1
let g:javascript_indent_vars=1
