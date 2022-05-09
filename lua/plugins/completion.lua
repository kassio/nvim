local cmp = require('cmp')
local mapping = cmp.mapping
local snippy = require('snippy')

snippy.setup({
  mappings = {
    is = {
      ['<tab>'] = 'expand_or_advance',
      ['<s-tab>'] = 'previous',
    },
    nx = {
      ['<tab>'] = 'cut_text',
    },
  },
})

cmp.setup({
  formatting = {
    format = function(entry, vim_item)
      local icon = require('lspkind').presets.default[vim_item.kind]
      vim_item.kind = string.format('%s %s', icon, vim_item.kind)

      vim_item.menu = (vim.my.theme.icons)[entry.source.name]

      return vim_item
    end,
  },

  mapping = {
    ['<c-n>'] = mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<c-p>'] = mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<down>'] = mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<up>'] = mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ['<c-d>'] = mapping.scroll_docs(-4),
    ['<c-f>'] = mapping.scroll_docs(4),
    ['<c-space>'] = mapping.complete(),
    ['<c-y>'] = mapping.confirm(),
    ['<c-e>'] = mapping.abort(),
    ['<cr>'] = cmp.mapping.confirm({ select = false }),
  },

  snippet = {
    expand = function(args)
      snippy.expand_snippet(args.body)
    end,
  },

  sources = cmp.config.sources({
    { name = 'snippy' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
  }, {
    { name = 'nvim_lua' },
  }, {
    { name = 'treesitter' },
    { name = 'buffer' },
    { name = 'spell' },
  }, {
    { name = 'path' },
  }),

  window = {
    documentation = {
      border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
    },
  },
})
