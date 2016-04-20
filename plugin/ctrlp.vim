" CtrlP easy open files
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_max_files = 0
let g:ctrlp_open_new_file = "t"
let g:ctrlp_switch_buffer = "ET"
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/](\.(git|hg|svn))|(tmp|log|_build)$',
      \ 'file': '\vtags.*$'
      \ }
let g:ctrlp_abbrev = {
      \   "abbrevs": [
      \     { "pattern": "^a/", "expanded": "app/" },
      \     { "pattern": "^s/", "expanded": "spec/" },
      \     { "pattern": "^t/", "expanded": "test/" },
      \     { "pattern": "^c/", "expanded": "controllers/" },
      \     { "pattern": "^m/", "expanded": "models/" },
      \     { "pattern": "^v/", "expanded": "views/" },
      \     { "pattern": "^l/", "expanded": "lib/" }
      \   ]
      \ }

nnoremap <c-n> :CtrlPBufLine<CR>
nnoremap <c-k> :CtrlPBuffer<CR>
