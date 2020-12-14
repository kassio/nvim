nnoremap <c-p> :call v:lua.require('telescope.builtin').find_files()<cr>
nnoremap <leader><c-p> :call v:lua.require('telescope.builtin').oldfiles()<cr>
nnoremap <c-n> :call v:lua.require('telescope.builtin').current_buffer_fuzzy_find()<cr>
nnoremap <c-k> :call v:lua.require('telescope.builtin').buffers()<cr>
nnoremap <c-y> :call v:lua.require('telescope.builtin').live_grep()<cr>

nnoremap <leader>as :call v:lua.require('telescope.builtin').grep_string()<cr>
vnoremap <leader>as :<c-u>call
      \ v:lua.require('telescope.builtin').grep_string({
      \   'search': text#escape_all(text#get_visual())}
      \ )<cr>
