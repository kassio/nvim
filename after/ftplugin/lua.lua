local original = vim.lsp.buf.format

vim.lsp.buf.format = function(opts)
  original(vim.tbl_extend('keep', opts or {}, {
    name = 'null-ls',
  }))
end

vim.my.completion.buffer.sources({
  'lua',
  'lsp',
  'signature',
  'snippets',
  'treesitter',
  'buffer',
  'spell',
  'path',
})
