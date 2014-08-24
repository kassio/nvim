function! personal#unite#settings()
  inoremap <silent><buffer><C-j> <nop>
  inoremap <silent><buffer><C-k> <nop>

  nmap <silent><buffer> <ESC> <Plug>(unite_exit)
  imap <silent><buffer> <ESC> <Plug>(unite_exit)
endfunction
