if exists('b:javascript_setup_loaded')
  finish
endif
let b:javascript_setup_loaded=1

aug json_as_js
  au!
  au BufNewFile,BufRead *.json setf javascript
aug END

let g:SimpleJsIndenter_BriefMode=1
