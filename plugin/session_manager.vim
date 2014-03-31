if exists('b:session_setup_loaded')
  finish
endif
let b:session_setup_loaded=1

let g:session_dir=expand('~/.vim_data/sessions')

nmap <leader>ss <Plug>SaveSession
nmap <leader>sl <Plug>LoadSession
nmap <leader>sd <Plug>DeleteSession
