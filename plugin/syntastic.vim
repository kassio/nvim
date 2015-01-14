let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_balloons = 0
let g:syntastic_auto_jump = 0
let g:syntastic_error_symbol = 'e:'
let g:syntastic_warning_symbol = 'w:'
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [
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

let g:syntastic_stl_format = ""
      \ . "%W{"
      \ . "[" . g:syntastic_warning_symbol . " %fw(%w)]"
      \ . "}"
      \ . "%E{"
      \ . "[" . g:syntastic_error_symbol . " %fe(%e)]"
      \ . "}"

if file_readable('.jshintrc')
  let g:syntastic_javascript_jshint_args = '--config .jshintrc'
else
  let g:syntastic_javascript_jshint_args = '--config ~/.jshintrc'
endif

let g:syntastic_scss_checkers = ['scss_lint']

function! s:syntasticPassive()
  let b:syntastic_mode = 'passive'
  if index(g:syntastic_mode_map.active_filetypes, &filetype) >= 0
    SyntasticToggleMode
  endif
endfunction
command! SyntasticPassive silent call <SID>syntasticPassive()

function! s:syntasticActive()
  let b:syntastic_mode = 'active'
  if index(g:syntastic_mode_map.active_filetypes, &filetype) >= 0
    SyntasticCheck
  endif
endfunction
command! SyntasticActive silent call <SID>syntasticActive()
