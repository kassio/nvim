nnoremap f<c-p> <cmd>lua vim.my.fuzzyfinder.find_files()<cr>
nnoremap f<c-o> <cmd>lua vim.my.fuzzyfinder.oldfiles()<cr>
nnoremap f<c-h> <cmd>lua vim.my.fuzzyfinder.highlights()<cr>

nnoremap f<c-s> <cmd>lua vim.my.fuzzyfinder.lsp_document_symbols()<cr>
nnoremap f<c-g> <cmd>lua vim.my.fuzzyfinder.lsp_workspace_symbols()<cr>

nnoremap f<c-n> <cmd>lua vim.my.fuzzyfinder.current_buffer_fuzzy_find()<cr>
nnoremap f<c-k> <cmd>lua vim.my.fuzzyfinder.buffers()<cr>
nnoremap f<c-y> <cmd>lua vim.my.fuzzyfinder.live_grep()<cr>

nnoremap <leader>as <cmd>lua vim.my.fuzzyfinder.grep_string()<cr>
vnoremap <leader>as :<c-u>call FuzzyFinderSelectedText()<cr>

function! FuzzyFinderSelectedText()
  let search = text#escape_all(text#get_visual())
  call v:lua.vim.my.fuzzyfinder.grep_string({
        \  'search': search,
        \  'prompt_title': 'Selected Text: "'.search.'"'
        \})
endfunction
