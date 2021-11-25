local cmp = require('cmp')
local mapping = cmp.mapping
local snippy = require('snippy')
local api = vim.api

local default_sources = {
  snippets = { name = 'snippy', keyword_length = 2, max_item_count = 6 },
  treesitter = { name = 'treesitter', keyword_length = 2, max_item_count = 6 },
  lsp = { name = 'nvim_lsp', keyword_length = 2, max_item_count = 4 },
  lua = { name = 'nvim_lua', keyword_length = 2, max_item_count = 6 },
  buffer = { name = 'buffer', keyword_length = 3, max_item_count = 5, option = { get_bufnrs = api.nvim_list_bufs } },
  spell = { name = 'spell', keyword_length = 3, max_item_count = 5 },
  path = { name = 'path', max_item_count = 10 },
}

local sources_for = function(names)
  return vim.tbl_map(function(name)
    return default_sources[name]
  end, names)
end

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
    ['<cr>'] = cmp.mapping.confirm({ select = true }),
  },

  snippet = {
    expand = function(args)
      snippy.expand_snippet(args.body)
    end,
  },

  sources = sources_for({
    'snippets',
    'treesitter',
    'lsp',
    'lua',
    'buffer',
    'spell',
    'path',
  }),
})

vim.my.completion = {
  buffer = {
    sources = function(names)
      cmp.setup.buffer({
        sources = sources_for(names),
      })
    end,
  },
}
