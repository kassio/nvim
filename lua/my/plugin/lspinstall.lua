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
