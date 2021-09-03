local lspinstall = R('lspinstall')
local M = {}

lspinstall.post_install_hook = function(jid)
  local channel_info = vim.api.nvim_get_chan_info(jid)
  local winid = vim.fn.bufwinid(channel_info.buffer)

  pcall(vim.api.nvim_win_close, winid, true)
end

lspinstall.setup()

M.installAll = function()
  local languages = {
    'bash',
    'css',
    'diagnosticls',
    'go',
    'graphql',
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

M.installed_servers = lspinstall.installed_servers

return M
