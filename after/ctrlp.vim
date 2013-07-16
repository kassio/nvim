" CtrlP easy open files
let g:ctrlp_working_path_mode = 0
let g:ctrlp_switch_buffer = 'ETV'
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_custom_ignore = '\v[\/](.git|log|vendor/bundler/bin)$'
let g:ctrlp_abbrev = {
      \ 'abbrevs': [
      \ { 'pattern': '^j/', 'expanded': 'assets/javascripts/' },
      \ { 'pattern': '^style/', 'expanded': 'assets/stylesheets/' },
      \ { 'pattern': '\v(^|\/)c/', 'expanded': 'controllers/' },
      \ { 'pattern': '\v(^|\/)m/', 'expanded': 'models/' },
      \ { 'pattern': '\v(^|\/)v/', 'expanded': 'views/' },
      \ { 'pattern': '\v(^|\/)h/', 'expanded': 'helpers/' },
      \ { 'pattern': '^s/', 'expanded': 'spec/' }
      \ ]
      \ }

noremap <c-n> :CtrlPLine<CR>
