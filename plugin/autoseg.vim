nmap <leader>rp :normal <leader>tc<leader>tl<CR>:call SendToTmux("rake spec:padrao:all\n")<CR>
nmap <leader>rc :normal <leader>tc<leader>tl<CR>:call SendToTmux("rake spec:client:all\n")<CR>

nmap <leader>cp :normal <leader>tc<leader>tl<CR>:call SendToTmux("cucumber -p padrao\n")<CR>
