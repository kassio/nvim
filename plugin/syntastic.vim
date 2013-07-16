" Syntastic
let g:syntastic_error_symbol='X'
let g:syntastic_warning_symbol='!'
let g:syntastic_echo_current_error=1
let g:syntastic_auto_loc_list=0 "don't pop up the Errors list automatically
let g:syntastic_check_on_open=1
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [
      \ 'c',
      \ 'cpp',
      \ 'css',
      \ 'cucumber',
      \ 'elixir',
      \ 'eruby',
      \ 'html',
      \ 'javascript',
      \ 'json',
      \ 'puppet',
      \ 'ruby',
      \ 'scss',
      \ 'sh',
      \ 'tex',
      \ 'xml',
      \ 'yaml'
      \ ],
      \ 'passive_filetypes': [] }
