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

let g:ale_linters = {'ruby': ['standardrb']}

let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'elixir': ['mix_format'],
      \ 'javascript': ['prettier-eslint'],
      \ 'json': ['prettier-eslint'],
      \ 'ruby': ['standardrb'],
      \ }

if getcwd() =~# expand('$HOME/src/rails')
  let g:ale_fixers['ruby'] = []
end

let g:ale_fix_on_save = 1

" Lint signs
nnoremap <leader>ln :ALENextWrap<cr>
nnoremap <leader>lp :ALEPreviousWrap<cr>
