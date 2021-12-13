local nls = require('null-ls')
local helper = require('null-ls.helpers')
local builtin = require('null-ls.builtins')

local conditional_rubocop = helper.conditional(function(utils)
  local rubocop = builtin.diagnostics.rubocop

  if utils.root_has_file('Gemfile') then
    return rubocop.with({
      command = 'bundle',
      args = { 'exec', 'rubocop', '-f', 'json', '$FILENAME' },
    })
  else
    return rubocop
  end
end)

local sources = {
  -- code actions
  builtin.code_actions.gitsigns,

  -- completions
  builtin.completion.spell,

  -- diagnostics
  builtin.diagnostics.markdownlint,
  builtin.diagnostics.shellcheck,
  conditional_rubocop,

  --formatting
  builtin.formatting.stylua,
}

return {
  setup = function(lspconfig, opts)
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

    lspconfig['null-ls'].setup(opts)
  end,
}
