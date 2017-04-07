aug run_neomake
  au!
  au BufWritePost,BufReadPost * Neomake
aug END

let g:neomake_verbose = 0
let g:neomake_place_signs = 1

let g:neomake_error_sign = { 'text': 'x' }
let g:neomake_warning_sign = { 'text': '!' }
let g:neomake_message_sign = { 'text': '>' }
let g:neomake_info_sign = { 'text': 'i' }

let g:neomake_elixir_mix_maker = {
      \ 'exe' : 'mix',
      \ 'args': ['compile.elixir', '--warnings-as-errors'],
      \ 'errorformat':
      \ '** %s %f:%l: %m,' .
      \ '%f:%l: warning: %m'
      \ }

let g:neomake_elixir_enabled_makers = ['mix']
let g:neomake_ruby_enabled_makers = ['rubocop']
let g:neomake_javascript_enabled_makers = ['eslint']
