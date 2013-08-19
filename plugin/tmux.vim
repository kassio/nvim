nmap ,tc :call SendKeysToTmux('C-c')<CR>
nmap ,tl :call SendKeysToTmux('C-l')<CR>

nmap ,tp :call SendKeysToTmux('C-c')<CR>
      \ :call SendKeysToTmux('C-l')<CR>
      \ :call SendKeysToTmux('C-p')<CR>
      \ :call SendKeysToTmux('Enter')<CR>

vmap ,ts <Plug>SendSelectionToTmux "rygv :call Send_to_Tmux(@r)<CR>
nmap ,ts <Plug>NormalModeSendToTmux vip <Plug>SendSelectionToTmux
nmap ,tr <Plug>SetTmuxVars
