nnoremap f<c-p> <cmd>lua my.fuzzy_finder.find_files()<cr>
nnoremap f<c-o> <cmd>lua my.fuzzy_finder.oldfiles()<cr>
nnoremap f<c-h> <cmd>lua my.fuzzy_finder.highlights()<cr>

nnoremap f<c-s> <cmd>lua my.fuzzy_finder.lsp_document_symbols()<cr>
nnoremap f<c-g> <cmd>lua my.fuzzy_finder.lsp_workspace_symbols()<cr>

nnoremap f<c-n> <cmd>lua my.fuzzy_finder.current_buffer_fuzzy_find()<cr>
nnoremap f<c-k> <cmd>lua my.fuzzy_finder.buffers()<cr>
nnoremap f<c-y> <cmd>lua my.fuzzy_finder.live_grep()<cr>

nnoremap <leader>as <cmd>lua my.fuzzy_finder.grep_string()<cr>
vnoremap <leader>as :<c-u>call v:lua.my.fuzzy_finder.grep_string({
      \   'search': text#escape_all(text#get_visual())}
      \ )<cr>
