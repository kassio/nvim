let s:end = '^\s*\<end\>\s*$'
let s:function_start = '^\s*\<defp\?\>.*$'
let s:module_start = '^\s*\<defmodule\>.*$'
call textobj#user#plugin('elixir', {
      \   'block': {
      \     'pattern': ['\<fn\>', '\<end\>'],
      \     'select-i': 'if',
      \     'select-a': 'af'
      \   },
      \   'function-i': {
      \     'pattern': [s:function_start.'\n', s:end],
      \     'select-i': 'im',
      \   },
      \   'function-a': {
      \     'pattern': [s:function_start, s:end],
      \     'select-a': 'am',
      \   },
      \   'module-i': {
      \     'pattern': [s:module_start.'\n', s:end],
      \     'select-i': 'iM',
      \   },
      \   'module-a': {
      \     'pattern': [s:module_start, s:end],
      \     'select-a': 'aM',
      \   },
      \ })
