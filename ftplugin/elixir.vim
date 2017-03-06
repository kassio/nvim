let s:end = '\<end\>'
let s:block_start = '\<\(do\>\|\<fn\>\)'
call textobj#user#plugin('elixir', {
      \   'function-i': {
      \     'pattern': [s:block_start.'.*$\n', s:end],
      \     'select-i': 'iK'
      \   },
      \   'function-a': {
      \     'pattern': [s:block_start, s:end],
      \     'select-a': 'aK',
      \     'region-type': 'V'
      \   }
      \ })
