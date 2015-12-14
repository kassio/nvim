" CtrlP easy open files
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_max_files = 0
let g:ctrlp_open_new_file = "t"
let g:ctrlp_switch_buffer = "ET"
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/](\.(git|hg|svn))|(tmp|log)$',
      \ 'file': '\vtags.*$'
      \ }
let g:ctrlp_cache_dir = expand(g:data_home."/ctrlp")
let g:ctrlp_match_window = "bottom,order:btt,min:1,max:20,results:20"
let g:ctrlp_match_func = { "match": "pymatcher#PyMatch" }
let g:ctrlp_abbrev = {
      \   "abbrevs": [
      \     { "pattern": "^a/", "expanded": "app/" },
      \     { "pattern": "^s/", "expanded": "spec/" },
      \     { "pattern": "^t/", "expanded": "test/" },
      \     { "pattern": "^c/", "expanded": "controllers/" },
      \     { "pattern": "^m/", "expanded": "models/" },
      \     { "pattern": "^v/", "expanded": "views/" }
      \   ]
      \ }


nnoremap <c-n> :CtrlPBufLine<CR>
nnoremap <c-k> :CtrlPBuffer<CR>

aug ctrlp_cache_dir
  au!
  au VimEnter *
        \ if !isdirectory(g:ctrlp_cache_dir) |
        \   call mkdir(g:ctrlp_cache_dir, "p", 0700) |
        \ endif
aug END
