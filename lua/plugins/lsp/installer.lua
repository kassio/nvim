local lspinstall = R('lspinstall')
local M = {}

lspinstall.post_install_hook = function(jid)
  local channel_info = vim.api.nvim_get_chan_info(jid)

  pcall(vim.api.nvim_buf_delete, channel_info.buffer, { force = true })
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
