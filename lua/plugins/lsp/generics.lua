local nls = require('null-ls')
local builtin = require('null-ls.builtins')
local conditionals = require('null-ls.utils').make_conditional_utils()

local conditional_rubocop = function()
  local rubocop = builtin.diagnostics.rubocop

  if conditionals.root_has_file('Gemfile') then
    return rubocop.with({
      command = 'bundle',
      args = vim.list_extend({ 'exec', 'rubocop' }, rubocop._opts.args),
    })
  else
    return rubocop
  end
end

local sources = {
  -- code actions
  builtin.code_actions.gitsigns,

  -- diagnostics
  builtin.diagnostics.markdownlint,
  builtin.diagnostics.shellcheck,
  conditional_rubocop,

  --formatting
  builtin.formatting.stylua,
}

return {
  setup = function()
    nls.setup({
      diagnostics_format = '[#{c}] #{m} (#{s})',
      sources = sources,
      default_timeout = 20000,
      debug = true,
      log = {
        enable = true,
        level = 'trace',
        use_console = 'sync',
      },
    })
  end,
}
