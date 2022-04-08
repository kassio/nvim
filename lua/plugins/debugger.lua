require('dap-go').setup()

local dap = require('dap')

local dap_cmd = function(name, fn)
  vim.api.nvim_add_user_command('Dap' .. name, function(cmd)
    fn()
  end, {})
end

dap_cmd('Continue', function()
  dap.continue()
end)
dap_cmd('StepOver', function()
  dap.step_over()
end)
dap_cmd('StepInto', function()
  dap.step_into()
end)
dap_cmd('StepOut', function()
  dap.step_out()
end)
dap_cmd('StepToggleBreakpoint', function()
  dap.toggle_breakpoint()
end)
dap_cmd('SetBreakpointCondition', function()
  dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end)
dap_cmd('SetBreakpointLog', function()
  dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
end)
dap_cmd('REPL', function()
  dap.repl.open()
end)
dap_cmd('RunLast', function()
  dap.run_last()
end)
