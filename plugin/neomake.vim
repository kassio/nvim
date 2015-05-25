autocmd! BufWritePost,BufReadPost * Neomake

let g:neomake_error_sign = {
      \ 'text': 'E>',
      \ 'texthl': 'Error',
      \ }

let g:neomake_warning_sign = {
      \ 'text': 'W>',
      \ 'texthl': 'Warning',
      \ }

let g:neomake_ruby_enabled_makers = ['rubocop']

" javascript
let g:neomake_javascript_jshint_maker = {}
let g:neomake_javascript_jshint_maker.errorformat = '%A%f: line %l\, col %v\, %m \(%t%*\d\)'
if file_readable('.jshintrc')
  let g:neomake_javascript_jshint_maker.args = ['--verbose', '--config .jshintrc']
else
  let g:neomake_javascript_jshint_maker.args = ['--verbose', '--config ~/.jshintrc']
endif
let g:neomake_javascript_enabled_makers = ['jshint']

" scss
let g:neomake_scss_scsslint_maker = {
      \ 'exe': 'scss-lint',
      \ 'errorformat': '%f:%l [%t] %m',
      \ }
let g:neomake_scss_enabled_makers = ['scsslint']
