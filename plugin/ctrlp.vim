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
    \ { 'pattern': '^c/', 'expanded': 'app/controllers' },
    \ { 'pattern': '^m/', 'expanded': 'app/models' },
    \ { 'pattern': '^v/', 'expanded': 'app/views' },
    \ { 'pattern': '^h/', 'expanded': 'app/helpers' },
    \ { 'pattern': '^s/', 'expanded': 'spec/' }
    \ ]
  \ }

function! CtrlPPersonalOpenFunc(command_name)
if getfsize(expand('%')) == -1
  let g:ctrlp_prompt_mappings = {
        \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
        \ 'AcceptSelection("t")': ['<c-t>']
        \ }
else
  let g:ctrlp_prompt_mappings = {
        \ 'AcceptSelection("e")': ['<c-t>'],
        \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>']
        \ }
endif
exec a:command_name
endfunction

function! CtrlPDefaultOpenFunc(command_name)
let g:ctrlp_prompt_mappings = {
      \ 'AcceptSelection("t")': ['<c-t>'],
      \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>']
      \ }
exec a:command_name
endfunction

map <leader>t :call CtrlPPersonalOpenFunc('CtrlP')<CR>
map <leader>T :call CtrlPPersonalOpenFunc('CtrlPMRUFiles')<CR>
map <leader>r :call CtrlPPersonalOpenFunc('CtrlPBuffer')<CR>
map <leader>yy :call CtrlPDefaultOpenFunc('CtrlPLine')<CR>
map <leader>yd :call CtrlPDefaultOpenFunc('CtrlPLine')<CR><c-r>def<space>
