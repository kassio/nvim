local ruby_cmd = function(name, replacer)
  vim.api.nvim_create_user_command('Ruby' .. name, function(cmd)
    vim.my.utils.preserve(function()
      vim.cmd(string.format('silent %s,%s%s/e', cmd.line1, cmd.line2, replacer))
    end)
  end, { range = true })
end

ruby_cmd('ModernizeHashSymbolKey', [[s/:\(\w\+\)\s*=>\s*\ze/\1:\ ]])
ruby_cmd('ConvertHashStringKeyToSymbol', [[s/\(['"]\)\([^\1]\{-\}\)\1\s*\(=>\|:\)/\2:]])
ruby_cmd('ConvertHashSymbolKeyToString', [[s/\(\w\+\)\%(:\|\s*=>\)/'\1' =>]])
ruby_cmd('LetToVar', [[s/let\%(\w\+\)\?(:\(\w\+\))\s*{\s*\(.\{-\}\)\s*}/\1 = \2]])
ruby_cmd('VarToLet', [[s/@\?\(\w\+\)\s*=\s*\(.*\)/let(:\1) { \2 }]])
