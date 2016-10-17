call textobj#user#plugin('elixir', {
      \   'block': {
      \     'pattern': ['\<fn\>', '\<end\>'],
      \     'select-i': 'if',
      \     'select-a': 'af'
      \   },
      \   'function-i': {
      \     'pattern': ['^\s*\<defp\?\>.*$\n', '^\s*\<end\>\s*$'],
      \     'select-i': 'im',
      \   },
      \   'function-a': {
      \     'pattern': ['^\s*\<defp\?\>.*$', '^\s*\<end\>\s*$'],
      \     'select-a': 'am',
      \   },
      \   'module-i': {
      \     'pattern': ['^\s*\<defmodule\>.*$\n', '^\s*\<end\>\s*$'],
      \     'select-i': 'iM',
      \   },
      \   'module-a': {
      \     'pattern': ['^\s*\<defmodule\>.*$', '^\s*\<end\>\s*$'],
      \     'select-a': 'aM',
      \   },
      \ }
