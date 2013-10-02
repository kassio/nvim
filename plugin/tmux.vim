nmap <leader>tc :call SendKeysToTmux('C-c')<CR>
nmap <leader>tl :call SendKeysToTmux('C-c C-l')<CR>

nmap <leader>tp :call SendKeysToTmux('C-c C-l C-p Enter')<CR>

vmap <leader>ts <Plug>SendSelectionToTmux "rygv :call SendToTmux(@r)<CR>
nmap <leader>ts <Plug>NormalModeSendToTmux vip <Plug>SendSelectionToTmux
nmap <leader>tr <Plug>SetTmuxVars

nmap <leader>cc :call SendKeysToTmux('C-c C-l')<CR>
      \ :call SendToTmux("cucumber\n")<CR>

cabbrev T Tmux
