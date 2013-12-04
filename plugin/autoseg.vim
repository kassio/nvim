nmap <leader>rp :normal <leader>tc<leader>tl<CR>:call TmuxRunner.execute("rake spec:padrao:all\n")<CR>
nmap <leader>rc :normal <leader>tc<leader>tl<CR>:call TmuxRunner.execute("rake spec:client:all\n")<CR>

nmap <leader>cp :normal <leader>tc<leader>tl<CR>:call TmuxRunner.execute("cucumber -p padrao\n")<CR>
