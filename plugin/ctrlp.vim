" CtrlP easy open files
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_max_height = 35
let g:ctrlp_switch_buffer = 'ETVH'
let g:ctrlp_open_new_file = 't'
let g:ctrlp_tabpage_position = 'ac'
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_abbrev = {
  \ 'gmode': 't',
  \ 'abbrevs': [
    \ { 'pattern': '^a/', 'expanded': 'app/' },
    \ { 'pattern': '^c/', 'expanded': 'app/controllers/' },
    \ { 'pattern': '^m/', 'expanded': 'app/models/' },
    \ { 'pattern': '^v/', 'expanded': 'app/views/' },
    \ { 'pattern': '^h/', 'expanded': 'app/helpers/' },
    \ { 'pattern': '^s/', 'expanded': 'spec/' }
    \ ]
  \ }

map <leader>t :CtrlP<CR>
map <leader>T :CtrlPMRUFiles<CR>
map <leader>r :CtrlPBuffer<CR>
map <leader>yy :CtrlPLine<CR>
map <leader>yd :CtrlPLine<CR><c-r>def<space>
