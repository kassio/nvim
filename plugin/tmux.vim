nmap <leader>tc :call SendKeysToTmux('C-c')<CR>
nmap <leader>tl :normal ,tc<CR>
      \ :call SendKeysToTmux('C-l')<CR>

nmap <leader>tp :normal ,tc,tl<CR>
      \ :call SendKeysToTmux('C-p')<CR>
      \ :call SendKeysToTmux('Enter')<CR>

vmap <leader>ts <Plug>SendSelectionToTmux "rygv :call SendToTmux(@r)<CR>
nmap <leader>ts <Plug>NormalModeSendToTmux vip <Plug>SendSelectionToTmux
nmap <leader>tr <Plug>SetTmuxVars

nmap <leader>cc :normal ,tc,tl<CR>
      \ :call SendToTmux("cucumber\n")<CR>

cabbrev T Tmux
