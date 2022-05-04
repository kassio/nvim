local keymap = vim.keymap.set
local dap = require('dap')
local widgets = require('dap.ui.widgets')
local dapui = require('dapui')

require('nvim-dap-virtual-text').setup()

dapui.setup()
dap.listeners.after.event_initialized['dapui_config'] = function()
  dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
  dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
  dapui.close()
end

local dap_cmd = function(fn, action, map)
  local name = 'Dap' .. action
  vim.api.nvim_create_user_command(name, fn, {})

  if map ~= nil then
    keymap('n', map, '<cmd>' .. name .. '<cr>')
  end
end

dap_cmd(dap.step_back, 'StepBack', '<F4>')
dap_cmd(dap.continue, 'Continue', '<F5>')
dap_cmd(dap.step_over, 'StepOver', '<F6>')
dap_cmd(dap.step_into, 'StepInto', '<F7>')
dap_cmd(dap.step_out, 'StepOut', '<F8>')
dap_cmd(dap.close, 'Close', '<F9>')
dap_cmd(widgets.hover, 'Hover', '<leader>dk')
dap_cmd(dap.repl.open, 'REPL', '<leader>dr')
dap_cmd(dap.run_last, 'RunLast', '<leader>dl')
dap_cmd(dap.toggle_breakpoint, 'ToggleBreakpoint', '<leader>db')
dap_cmd(dapui.toggle, 'ToggleUI', '<leader>du')
dap_cmd(function()
  dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end, 'SetBreakpointCondition', '<leader>dB')
dap_cmd(function()
  dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
end, 'SetBreakpointLog', '<leader>dp')
