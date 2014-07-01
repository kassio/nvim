let g:syntastic_check_on_open = 1
let g:syntastic_enable_balloons = 0
let g:syntastic_auto_jump = 0
let g:syntastic_error_symbol = 'e:'
let g:syntastic_warning_symbol = 'w:'
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [
      \ 'css',
      \ 'elixir',
      \ 'eruby',
      \ 'javascript',
      \ 'ruby',
      \ 'scss',
      \ 'sh',
      \ 'yaml',
      \ 'zsh'
      \ ] }

let g:syntastic_javascript_jshint_args = '--config ~/.jshintrc'

let g:syntastic_stl_format = ""
      \ . "%W{"
      \ . "[".g:syntastic_warning_symbol." %fw(%w)]"
      \ . "}"
      \ . "%E{"
      \ . "[".g:syntastic_error_symbol." %fe(%e)]"
      \ . "}"
