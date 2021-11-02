local fn = vim.fn
local luasnip = R('luasnip')
local cmp = R('cmp')

local termcoded = function(key)
  return vim.api.nvim_replace_termcodes(key, true, true, true)
end

local feedkeys = function(key, mode)
  mode = mode or ''
  fn.feedkeys(termcoded(key), mode)
end

local M = {}

M.sources = {
  luasnip = { name = 'luasnip', keyword_length = 2, max_item_count = 3 },
  nvim_lua = { name = 'nvim_lua', keyword_length = 3, max_item_count = 3 },
  nvim_lsp = { name = 'nvim_lsp', keyword_length = 3, max_item_count = 3 },
  treesitter = { name = 'treesitter', keyword_length = 3, max_item_count = 3 },
  buffer = {
    name = 'buffer',
    keyword_length = 5,
    max_item_count = 3,
    opts = { get_bufnrs = vim.api.nvim_list_bufs },
  },
  spell = { name = 'spell', keyword_length = 3, max_item_count = 3 },
  path = { name = 'path', keyword_length = 4, max_item_count = 5 },
}

M.buffer = {
  completion_sources = function(names)
    cmp.setup.buffer({
      sources = vim.tbl_map(function(name)
        return M.sources[name]
      end, names),
    })
  end,
}

vim.my.completion = M

cmp.setup({
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
  documentation = {
    border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
  },
  formatting = {
    format = function(entry, vim_item)
      local icon = require('lspkind').presets.default[vim_item.kind]
      vim_item.kind = string.format('%s %s', icon, vim_item.kind)

      vim_item.menu = ({
        buffer = '﬘',
        luasnip = '',
        nvim_lsp = 'ﲳ',
        nvim_lua = '',
        path = 'ﱮ',
        spell = '暈',
        treesitter = '',
      })[entry.source.name]

      return vim_item
    end,
  },
  mapping = {
    ['<c-space>'] = cmp.mapping.complete(),
    ['<c-y>'] = cmp.mapping.confirm({ select = true }),
    ['<c-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<c-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ['<c-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<tab>'] = function(fallback)
      if cmp.visible() then
        feedkeys('<plug>luasnip-jump-next')
      else
        fallback()
      end
    end,
    ['<s-tab>'] = function(fallback)
      if cmp.visible() then
        feedkeys('<plug>luasnip-jump-prev')
      else
        fallback()
      end
    end,
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  sources = {
    vim.my.completion.sources.luasnip,
    vim.my.completion.sources.nvim_lua,
    vim.my.completion.sources.nvim_lsp,
    vim.my.completion.sources.buffer,
    vim.my.completion.sources.spell,
    vim.my.completion.sources.path,
  },
})

require('luasnip/loaders/from_vscode').lazy_load({
  paths = { fn.stdpath('config') .. '/snippets' },
})
