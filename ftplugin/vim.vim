let s:function_start = '^\s*\(\<function\>\|\<if\>\).*$'
let s:function_end = '^\s*\<end\(function\|if\)\?\>'
call textobj#user#plugin('vim', {
      \   'function-i': {
      \     'pattern': [s:function_start.'\n', s:function_end],
      \     'select-i': 'iK'
      \   },
      \   'function-a': {
      \     'pattern': [s:function_start, s:function_end],
      \     'select-a': 'aK',
      \     'region-type': 'V'
      \   }
      \ })

setlocal iskeyword+=:
