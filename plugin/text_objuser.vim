if exists('b:textobj_user_setup_loaded')
  finish
endif

call textobj#user#plugin('entire', {
      \   '-': {
      \     'select-a-function': 'textobj#entire_file',
      \     'select-a': 'ae'
      \   },
      \ })

call textobj#user#plugin('line', {
      \   '-': {
      \     'select-a-function': 'textobj#current_line_a',
      \     'select-a': 'al',
      \     'select-i-function': 'textobj#current_line_i',
      \     'select-i': 'il',
      \   },
      \ })
