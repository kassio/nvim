local lspconfig = require'lspconfig'

local function attacher(client)
  require'completion'.on_attach()
  print('LSP: ' .. client.name)
end

lspconfig.vimls.setup{ on_attach = attacher }
lspconfig.jsonls.setup{ on_attach = attacher }
lspconfig.cssls.setup{ on_attach = attacher }

lspconfig.solargraph.setup{
  settings = {
    solargraph = {
      completion = true,
      definitions = true,
      diagnostics = true,
      filetypes = {'ruby'},
      hover = true,
      references = true,
      rename = true,
      root_dir = {'.'},
      symbols = true,
      useBundler = false
    }
  },

  on_attach = attacher
}

lspconfig.sumneko_lua.setup{
  settings = {
    Lua = {
      diagnostics = {
        enable = true,
        globals = { "vim" },
      },
    }
  },

  on_attach = attacher
}

lspconfig.diagnosticls.setup{
  filetypes = {
    "markdown",
    "ruby",
    "sh",
    "vim",
    "yaml"
  },

  init_options = {
    linters = {
      rubocop = {
        command = "bundle",
        sourceName = "rubocop",
        debounce = 100,
        args = {
          "exec",
          "rubocop",
          "--format",
          "json",
          "--force-exclusion",
          "%filepath"
        },
        parseJson = {
          errorsRoot = "files[0].offenses",
          line = "location.line",
          column = "location.column",
          message = "[${cop_name}]\n${message}",
          security = "severity"
        },
        securities = {
          fatal = "error",
          warning = "warning"
        }
      }
    },
    filetypes = {
      markdown = "markdownlint",
      ruby = "rubocop",
      sh = "shellcheck",
      vim = "vint",
      yaml = "yamllint"
    }
  },

  on_attach = attacher
}
