local utils = require('my.utils')

local range_cmd = function(line1, line2, command)
  utils.preserve(function()
    vim.cmd(string.format('silent %s,%s%s/e', line1, line2, command))
  end)
end

vim.my.completion.buffer.sources({
  'lsp',
  'snippets',
  'treesitter',
  'buffer',
  'spell',
  'path',
})

vim.my.ruby = {
  modernize_hash_symbol_key = function(l1, l2)
    range_cmd(l1, l2, [[s/:\(\w\+\)\s*=>\s*\ze/\1:\ ]])
  end,
  convert_hash_string_key_to_symbol = function(l1, l2)
    range_cmd(l1, l2, [[s/\(['"]\)\([^\1]\{-\}\)\1\s*\(=>\|:\)/\2:]])
  end,
  convert_hash_symbol_key_to_string = function(l1, l2)
    range_cmd(l1, l2, [[s/\(\w\+\)\%(:\|\s*=>\)/'\1' =>]])
  end,
  let_to_var = function(l1, l2)
    range_cmd(l1, l2, [[s/let\%(\w\+\)\?(:\(\w\+\))\s*{\s*\(.\{-\}\)\s*}/\1 = \2]])
  end,
  var_to_let = function(l1, l2)
    range_cmd(l1, l2, [[s/@\?\(\w\+\)\s*=\s*\(.*\)/let(:\1) { \2 }]])
  end,
}

for name, _ in pairs(vim.my.ruby) do
  local cmd_str = string.format(
    '-range Ruby%s lua vim.my.ruby.%s("<line1>", "<line2>")',
    utils.str.snakecase_to_mixedcase(name),
    name
  )

  utils.command(cmd_str)
end
