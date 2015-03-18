" CtrlP easy open files
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_max_files = 0
let g:ctrlp_open_new_file = 't'
let g:ctrlp_switch_buffer = 'ETV'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_cache_dir = expand('~/.vim_data/ctrlp')
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'
let g:ctrlp_abbrev = {
      \   'abbrevs': [
      \     { 'pattern': '\v(^|\/)a/', 'expanded': 'app/' },
      \     { 'pattern': '\v(^|\/)c/', 'expanded': 'controllers/' },
      \     { 'pattern': '\v(^|\/)m/', 'expanded': 'models/' },
      \     { 'pattern': '\v(^|\/)v/', 'expanded': 'views/' },
      \     { 'pattern': '^s/', 'expanded': 'spec/' },
      \     { 'pattern': '^t/', 'expanded': 'test/' }
      \   ]
      \ }

nnoremap <c-n> :CtrlPBufTag<CR>
nnoremap <c-k> :CtrlPBuffer<CR>

aug ctrlp_cache_dir
  au!
  au VimEnter *
        \ if !isdirectory(g:ctrlp_cache_dir) |
        \   call mkdir(g:ctrlp_cache_dir, "p", 0700) |
        \ endif
aug END
