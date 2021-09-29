local utils = require('my.utils')
local M = {}

range_cmd = function(line1, line2, command)
  utils.preserve(function()
    vim.cmd(string.format('silent %s,%s%s', line1, line2, command))
  end)
end

M.modernizy_hash_symbol_keys = function(line1, line2)
  range_cmd(line1, line2, [[s/:\(\w\+\)\s*=>\ze/\1:\ ]])
end

vim.my.ruby = M

utils.command('-range RubyModernizeHashSymbolKeys lua vim.my.ruby.modernizy_hash_symbol_keys("<line1>", "<line2>")')
