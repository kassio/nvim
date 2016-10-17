call textobj#user#plugin('vim', {
      \   'function-i': {
      \     'pattern': ['^\s*\<function\>.*$\n', '^\s*\<endf\(unction\)\?\>'],
      \     'select-i': ['im', 'if'],
      \   },
      \   'function-a': {
      \     'pattern': ['^\s*\<function\>.*$', '^\s*\<endf\(unction\)\?\>'],
      \     'select-a': ['am', 'af'],
      \   },
      \ })
