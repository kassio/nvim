if exists('b:syntastic_setup_loaded')
  finish
endif
let b:syntastic_setup_loaded=1

let g:syntastic_check_on_open = 1
let g:syntastic_enable_balloons = 0
let g:syntastic_auto_jump = 0
let g:syntastic_error_symbol = 'e:'
let g:syntastic_warning_symbol = 'w:'
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [
      \ 'ruby',
      \ 'elixir',
      \ 'js',
      \ 'css',
      \ 'vim' ] }

hi! link SyntasticWarningSign Search
hi! link SyntasticErrorSign ErrorMsg
let g:syntastic_stl_format = ""
      \ . "%W{"
      \ . "%#WarningAlert#"
      \ . "\ [".g:syntastic_warning_symbol." %fw(%w)]"
      \ . "}"
      \ . "%B{\ }"
      \ . "%E{"
      \ . "%#ErrorAlert#"
      \ . "\ [".g:syntastic_error_symbol." %fe(%e)]"
      \ . "}\ "
      \ . "%*"
