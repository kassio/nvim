require'lspinstall'.post_install_hook = function(jid)
  local channel_info = vim.api.nvim_get_chan_info(jid)
  local winid = vim.fn.bufwinid(channel_info.buffer)
  vim.api.nvim_win_close(winid, true)
end

require'lspinstall'.setup()

local M = {}

M.installAll = function()
  local lspinstall = require'lspinstall'
  local languages = {
    'bash',
    'css',
    'diagnosticls',
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
