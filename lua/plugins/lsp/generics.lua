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
  builtin.code_actions.refactoring,
  builtin.code_actions.shellcheck,

  -- diagnostics
  builtin.diagnostics.codespell,
  builtin.diagnostics.editorconfig_checker,
  builtin.diagnostics.golangci_lint,
  builtin.diagnostics.jsonlint,
  builtin.diagnostics.luacheck,
  builtin.diagnostics.markdownlint,
  builtin.diagnostics.misspell,
  builtin.diagnostics.shellcheck,
  builtin.diagnostics.staticcheck,
  builtin.diagnostics.tidy,
  builtin.diagnostics.trail_space,
  builtin.diagnostics.vint,
  builtin.diagnostics.zsh,
  conditional_rubocop,

  -- formatting
  builtin.formatting.clang_format,
  builtin.formatting.jq,
  builtin.formatting.shfmt,
  builtin.formatting.sqlformat,
  builtin.formatting.stylua,
  builtin.formatting.tidy,

  -- hover
  builtin.hover.dictionary,
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
