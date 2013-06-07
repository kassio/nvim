let g:loaded_syntastic_eruby_ruby_checker=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=1

let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='X'
let g:syntastic_style_error_symbol='sX'
let g:syntastic_warning_symbol='!'
let g:syntastic_style_warning_symbol='s!'

let g:syntastic_echo_current_error=1
let g:syntastic_auto_loc_list=2
let g:syntastic_check_on_open=1

let g:syntastic_quiet_warnings=1

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
