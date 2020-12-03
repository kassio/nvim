nnoremap <c-p> <cmd>lua require'telescope.builtin'.find_files()<cr>
nnoremap <leader><c-p> <cmd>lua require'telescope.builtin'.oldfiles()<cr>
nnoremap <c-n> <cmd>lua require'telescope.builtin'.buffers()<cr>
nnoremap <c-y> <cmd>lua require'telescope.builtin'.live_grep()<cr>

nnoremap <leader>as <cmd>lua require'telescope.builtin'.grep_string()<cr>
vnoremap <leader>as :<c-u>exec 'Telescope grep_string --search='.text#get_visual()<cr>
