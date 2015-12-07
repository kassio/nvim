aug run_neomake
  au!
  au BufEnter *
        \ if empty(getloclist(0)) |
        \   Neomake |
        \ end
  au BufWritePost,BufReadPost * Neomake
aug END

let g:neomake_error_sign = {
      \ 'text': 'E>',
      \ 'texthl': 'StatusError',
      \ }

let g:neomake_warning_sign = {
      \ 'text': 'W>',
      \ 'texthl': 'StatusWarning',
      \ }

let g:neomake_ruby_enabled_makers = ['rubocop']
let g:neomake_javascript_enabled_makers = ['eslint']
