local keymap = vim.keymap.set
local dap = require('dap')
local widgets = require('dap.ui.widgets')
local dapui = require('dapui')

require('dap-go').setup()
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

local dap_cmd = function(name, fn)
  vim.api.nvim_create_user_command('Dap' .. name, fn, {})
end

local conditional_breakpoint = function()
  dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end

local log_breakpoint = function()
  dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
end

dap_cmd('ToggleUI', dapui.toggle)
dap_cmd('REPL', dap.repl.open)
dap_cmd('RunLast', dap.run_last)
dap_cmd('Continue', dap.continue)
dap_cmd('StepOver', dap.step_over)
dap_cmd('StepInto', dap.step_into)
dap_cmd('StepOut', dap.step_out)
dap_cmd('ToggleBreakpoint', dap.toggle_breakpoint)
dap_cmd('SetBreakpointCondition', conditional_breakpoint)
dap_cmd('SetBreakpointLog', log_breakpoint)
dap_cmd('Hover', widgets.hover)

keymap('n', '<F5>', '<cmd>DapContinue<cr>')
keymap('n', '<F6>', '<cmd>DapStepOver<cr>')
keymap('n', '<F7>', '<cmd>DapStepInto<cr>')
keymap('n', '<F8>', '<cmd>DapStepOut<cr>')
keymap('n', '<leader>dt', '<cmd>DapToggleUI<cr>')
keymap('n', '<leader>dr', '<cmd>DapREPL<cr>')
keymap('n', '<leader>dl', '<cmd>DapRunLast<cr>')
keymap('n', '<leader>db', '<cmd>DapToggleBreakpoint<cr>')
keymap('n', '<leader>dB', '<cmd>DapSetBreakpointCondition<cr>')
keymap('n', '<leader>dp', '<cmd>DapSetBreakpointLog<cr>')
keymap('n', '<leader>dk', '<cmd>DapHover<cr>')
