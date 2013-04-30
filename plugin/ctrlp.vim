" CtrlP easy open files
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_switch_buffer = 'E'
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_custom_ignore = '\v[\/](.git|log|bbin)$'
let g:ctrlp_abbrev = {
      \ 'abbrevs': [
      \ { 'pattern': '\v(^|\/)a/', 'expanded': 'assets' },
      \ { 'pattern': '\v(^|\/)c/', 'expanded': 'controllers/' },
      \ { 'pattern': '\v(^|\/)m/', 'expanded': 'models/' },
      \ { 'pattern': '\v(^|\/)v/', 'expanded': 'views/' },
      \ { 'pattern': '\v(^|\/)h/', 'expanded': 'helpers/' },
      \ { 'pattern': '^s/', 'expanded': 'spec/' }
      \ ]
      \ }

map <c-n> :CtrlPLine<CR>
