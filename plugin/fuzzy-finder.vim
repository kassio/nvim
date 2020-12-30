nnoremap f<c-p> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap f<c-o> <cmd>lua require('telescope.builtin').oldfiles()<cr>
nnoremap f<c-h> <cmd>lua require('telescope.builtin').highlights()<cr>

nnoremap f<c-n> <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>
nnoremap f<c-k> <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap f<c-y> <cmd>lua require('telescope.builtin').live_grep()<cr>

nnoremap <leader>as <cmd>lua require('telescope.builtin').grep_string()<cr>
vnoremap <leader>as :<c-u>call
      \ v:lua.require('telescope.builtin').grep_string({
      \   'search': text#escape_all(text#get_visual())}
      \ )<cr>
