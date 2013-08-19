nmap ,tc :call Send_keys_to_Tmux('C-c')<CR>
nmap ,tl :call Send_keys_to_Tmux('C-l')<CR>

vmap ,ts <Plug>SendSelectionToTmux "ry :call Send_to_Tmux(@r)<CR>
nmap ,ts <Plug>NormalModeSendToTmux vip <Plug>SendSelectionToTmux
nmap ,tr <Plug>SetTmuxVars
