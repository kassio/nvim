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

luasnip.config.setup({ store_selection_keys = '<tab>' })

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<c-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ['<c-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
    ['<c-space>'] = cmp.mapping.complete(),
    ['<c-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<tab>'] = function(fallback)
      if luasnip.expand_or_jumpable() then
        feedkeys('<Plug>luasnip-expand-or-jump')
      elseif fn.pumvisible() == 1 then
        cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        })
      else
        fallback()
      end
    end,
    ['<s-tab>'] = function(fallback)
      if luasnip.jumpable(-1) then
        feedkeys('<Plug>luasnip-jump-prev')
      else
        fallback()
      end
    end,
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
