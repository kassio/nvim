nnoremap f<c-p> <cmd>lua vim.fuzzy_finder.find_files()<cr>
nnoremap f<c-o> <cmd>lua vim.fuzzy_finder.oldfiles()<cr>
nnoremap f<c-h> <cmd>lua vim.fuzzy_finder.highlights()<cr>

nnoremap f<c-s> <cmd>lua vim.fuzzy_finder.lsp_document_symbols()<cr>
nnoremap f<c-g> <cmd>lua vim.fuzzy_finder.lsp_workspace_symbols()<cr>

nnoremap f<c-n> <cmd>lua vim.fuzzy_finder.current_buffer_fuzzy_find()<cr>
nnoremap f<c-k> <cmd>lua vim.fuzzy_finder.buffers()<cr>
nnoremap f<c-y> <cmd>lua vim.fuzzy_finder.live_grep()<cr>

nnoremap <leader>as <cmd>lua vim.fuzzy_finder.grep_string()<cr>
vnoremap <leader>as :<c-u>call FuzzyFinderSelectedText()<cr>

function! FuzzyFinderSelectedText()
  let search = text#escape_all(text#get_visual())
  call v:lua.vim.fuzzy_finder.grep_string({
        \  'search': search,
        \  'prompt_title': 'Selected Text: "'.search.'"'
        \})
endfunction
