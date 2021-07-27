require'lspinstall'.post_install_hook = function()
  if vim.api.nvim_win_get_number(0) ~= vim.api.nvim_win_get_number("$") then
    vim.api.nvim_win_close(0, true)
  end
end

require'lspinstall'.setup()

local M = {}

M.installAll = function()
  local lspinstall = require'lspinstall'
  local languages = {
    'bash',
    'css',
    'go',
    'html',
    'json',
    'lua',
    'ruby',
    'tailwindcss',
    'vim',
    'vue',
    'yaml',
  }

  for _, language in ipairs(languages) do
    lspinstall.install_server(language)
  end
end

return M
