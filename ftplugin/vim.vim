let s:function_start = '^\s*\<function\>.*$'
let s:function_end = '^\s*\<endf\(unction\)\?\>'
call textobj#user#plugin('vim', {
      \   'function-i': {
      \     'pattern': [s:function_start.'\n', s:function_end],
      \     'select-i': ['im', 'if'],
      \   },
      \   'function-a': {
      \     'pattern': [s:function_start, s:function_end],
      \     'select-a': ['am', 'af'],
      \   },
      \ })
