nmap <leader>rp :normal ,tc,tl<CR>:call SendToTmux("rake spec:padrao:all\n")<CR>
nmap <leader>rc :normal ,tc,tl<CR>:call SendToTmux("rake spec:client:all\n")<CR>

nmap ,cp :normal ,tc,tl<CR>:call SendToTmux("cucumber -p padrao\n")<CR>
