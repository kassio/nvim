local fn = vim.fn
local luasnip = R('luasnip')
local cmp = R('cmp')

luasnip.config.setup({
  store_selection_keys = '<tab>'
})

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<c-space>'] = cmp.mapping.complete(),
    ['<cr>'] = cmp.mapping.confirm({ select = true }),
  },
  formatting = {
    format = function(entry, vim_item)
      local icon = require('lspkind').presets.default[vim_item.kind]
      vim_item.kind = string.format('%s %s', icon, vim_item.kind)

      vim_item.menu = ({
        buffer = '[Buffer]',
        luasnip = '[Snip]',
        nvim_lsp = '[LSP]',
        nvim_lua = '[Lua]',
        spell = '[Spell]',
      })[entry.source.name]

      return vim_item
    end,
  },
  sources = {
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'spell' },
    { name = 'path' },
    { name = 'nvim_lua' },
    { name = 'nvim_lsp' },
  },
})

require('luasnip/loaders/from_vscode').lazy_load({
  paths = { fn.stdpath('config') .. '/snippets' },
})
