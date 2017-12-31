scriptencoding = 'utf8'

let g:sign_error = '×'
let g:sign_warning = '⚠'
let g:sign_info = 'ⅰ'

let g:ale_sign_column_always = 1
let g:ale_sign_error = g:sign_error
let g:ale_sign_style_error = 's'
let g:ale_sign_warning = g:sign_warning
let g:ale_sign_style_warning = 's'
let g:ale_sign_info = g:sign_info

let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier-eslint']

cnorea <silent> ln ALENextWrap
cnorea <silent> lp ALEPreviousWrap
