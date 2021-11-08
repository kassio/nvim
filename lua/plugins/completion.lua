local cmp = R('cmp')
local mapping = cmp.mapping
local snippy = R('snippy')
local api = vim.api

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
  completion = {
    completeopt = 'menuone',
  },

  documentation = {
    border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
  },

  formatting = {
    format = function(entry, vim_item)
      local icon = require('lspkind').presets.default[vim_item.kind]
      vim_item.kind = string.format('%s %s', icon, vim_item.kind)

      vim_item.menu = ({
        buffer = '',
        snippy = '',
        nvim_lsp = '',
        nvim_lua = '',
        path = 'פּ',
        spell = '暈',
        treesitter = '',
      })[entry.source.name]

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
    ['<c-e>'] = mapping.close(),
    ['<cr>'] = mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
  },

  snippet = {
    expand = function(args)
      snippy.expand_snippet(args.body)
    end,
  },

  sources = {
    { name = 'snippy', keyword_length = 2, max_item_count = 6 },
    { name = 'treesitter', keyword_length = 2, max_item_count = 6 },
    { name = 'nvim_lsp', keyword_length = 2, max_item_count = 4 },
    { name = 'nvim_lua', keyword_length = 2, max_item_count = 6 },
    { name = 'buffer', keyword_length = 3, max_item_count = 5, opts = { get_bufnrs = api.nvim_list_bufs } },
    { name = 'spell', keyword_length = 3, max_item_count = 5 },
    { name = 'path', max_item_count = 10 },
  },
})
