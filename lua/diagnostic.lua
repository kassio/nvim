local utils = vim.my.utils
local command = vim.api.nvim_create_user_command
local icons = vim.my.theme.icons

local severityHighlight = function(value)
  return 'Diagnostic' .. vim.diagnostic.severity[value]
end

local source_map = {
  ['lua|Lua Syntax Check.'] = icons.nvim_lua,
  ['ruby|rubocop'] = utils.fileicon('ruby'),
  ['go|compiler'] = utils.fileicon('go'),
}

setmetatable(source_map, {
  __index = function(_, key)
    return key
  end,
})

vim.my.diagnostic = {
  show = function()
    vim.diagnostic.open_float()
  end,
  hide = function()
    vim.diagnostic.hide(nil, 0)
  end,
  show_buffer = function()
    vim.diagnostic.open_float({
      scope = 'buffer',
      pos = { 0, 0 },
      header = 'File errors:',
      format = function(d)
        local source_key = string.format('%s|%s', vim.my.buffers.filetype(), d.source)
        return string.format('%s %s', source_map[source_key], d.message)
      end,
      prefix = function(d)
        local prefix = string.format('|%d:%d| ', d.lnum + 1, d.col + 1)
        return prefix, severityHighlight(d.severity)
      end,
    })
  end,
  disable_buffer = function()
    vim.diagnostic.disable(0)
  end,
  enable_buffer = function()
    vim.diagnostic.enable(0)
  end,
}

vim.keymap.set('n', 'glee', vim.diagnostic.open_float)
vim.keymap.set('n', 'glea', vim.my.diagnostic.show_buffer)

command('DiagnosticShow', vim.my.diagnostic.show, {})
command('DiagnosticHide', vim.my.diagnostic.hide, {})
command('DiagnosticDisable', vim.my.diagnostic.disable_buffer, {})
command('DiagnosticEnable', vim.my.diagnostic.enable_buffer, {})
