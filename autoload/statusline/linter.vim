function! statusline#linter#total(scope)
  if a:scope ==# 'W'
    return luaeval("vim.lsp.diagnostic.get_count(vim.fn.bufnr('%'), [[Error]])")
  else
    return luaeval("vim.lsp.diagnostic.get_count(vim.fn.bufnr('%'), [[Warning]])")
  end
endfunction
