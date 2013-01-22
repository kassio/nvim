" Syntastic
let g:syntastic_auto_loc_list=0 "don't pop up the Errors list automatically
let g:syntastic_check_on_open=1
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [
      \ 'ruby',
      \ 'eruby',
      \ 'c',
      \ 'cpp',
      \ 'cucumber',
      \ 'scss',
      \ 'css',
      \ 'elixir',
      \ 'javascript',
      \ 'json',
      \ 'sh',
      \ 'tex',
      \ 'html',
      \ 'xml',
      \ 'yaml',
      \ 'puppet'
      \ ] }
