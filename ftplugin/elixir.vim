call textobj#user#plugin('elixirblock', {
      \   '-': {
      \     'select-a-function': 'textobj#elixir#block_a',
      \     'select-a': 'ab',
      \     'select-i-function': 'textobj#elixir#block_i',
      \     'select-i': 'ib'
      \   }
      \ })

call textobj#user#plugin('elixirfunction', {
      \   '-': {
      \     'select-a-function': 'textobj#elixir#function_a',
      \     'select-a': 'af',
      \     'select-i-function': 'textobj#elixir#function_i',
      \     'select-i': 'if',
      \   },
      \ })

call textobj#user#plugin('elixirmodule', {
      \   '-': {
      \     'select-a-function': 'textobj#elixir#function_a',
      \     'select-a': 'am',
      \     'select-i-function': 'textobj#elixir#function_i',
      \     'select-i': 'im',
      \   },
      \ })
