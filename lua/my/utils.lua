local M = {}

local cmd = vim.cmd

M.augroup = function(name, autocmds)
  cmd('augroup ' .. name)
  cmd('autocmd!')
  for _, autocmd in ipairs(autocmds) do
    cmd('autocmd ' .. table.concat(autocmd, ' '))
  end
  cmd('augroup END')
end

M.command = function(args)
  cmd("command! "..args)
end

M.keymap = function(mode, lhs, rhs, opts)
  opts = opts or {}
  setmetatable(opts, { __index = {
    noremap = true,
    silent = true
  }})

  vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end


return M
