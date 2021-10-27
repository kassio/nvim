local utils = require('my.utils')

local range_cmd = function(line1, line2, command)
  utils.preserve(function()
    vim.cmd(string.format('silent %s,%s%s', line1, line2, command))
  end)
end

vim.my.completion.buffer.completion_sources({
  'luasnip',
  'treesitter',
  'nvim_lsp',
  'path',
  'buffer',
  'spell',
})

vim.my.ruby = {
  modernizy_hash_symbol_keys = function(line1, line2)
    range_cmd(line1, line2, [[s/:\(\w\+\)\s*=>\s*\ze/\1:\ ]])
  end,
  let_to_var = function(line1, line2)
    range_cmd(line1, line2, [[s/let\%(\w\+\)\?(:\(\w\+\))\s*{\s*\(.\{-\}\)\s*}/\1 = \2]])
  end,
  var_to_let = function(line1, line2)
    range_cmd(line1, line2, [[s/@\?\(\w\+\)\s*=\s*\(.*\)/let(:\1) { \2 }]])
  end,
}

utils.command('-range RubyModernizeHashSymbolKeys lua vim.my.ruby.modernizy_hash_symbol_keys("<line1>", "<line2>")')
utils.command('-range RubyLetToVar lua vim.my.ruby.let_to_var("<line1>", "<line2>")')
utils.command('-range RubyVarToLet lua vim.my.ruby.var_to_let("<line1>", "<line2>")')
