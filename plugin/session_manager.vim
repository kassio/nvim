let g:session_dir=expand('~/.vim_data/sessions')

aug session_dir
  au!
  au VimEnter *
        \ if !isdirectory(g:session_dir) |
        \   call mkdir(expand(g:session_dir), "p", 0700) |
        \ endif
aug END

nmap <leader>ss <Plug>SaveSession
nmap <leader>sl <Plug>LoadSession
nmap <leader>sd <Plug>DeleteSession
