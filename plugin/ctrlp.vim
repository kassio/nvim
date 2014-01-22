" CtrlP easy open files
let g:ctrlp_working_path_mode = 0
let g:ctrlp_switch_buffer = 'ETV'
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_custom_ignore = '\v[\/](tags|gem.tags|.git|log|vendor/bundler/bin)$'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'
let g:ctrlp_abbrev = {
      \ 'abbrevs': [
      \ { 'pattern': '\v(^|\/)c/', 'expanded': 'controllers/' },
      \ { 'pattern': '\v(^|\/)m/', 'expanded': 'models/' },
      \ { 'pattern': '\v(^|\/)v/', 'expanded': 'views/' },
      \ { 'pattern': '^s/', 'expanded': 'spec/' }
      \ ]
      \ }

noremap <c-n> :CtrlPBufferLines<CR>
