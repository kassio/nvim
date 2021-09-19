local luasnip = R('luasnip')
local cmp = R('cmp')

local feedkeys = function(key, mode)
  mode = mode or ''
  vim.fn.feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode)
end

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<c-p>'] = cmp.mapping.select_prev_item(),
    ['<c-n>'] = cmp.mapping.select_next_item(),
    ['<c-d>'] = cmp.mapping.scroll_docs(-4),
    ['<c-f>'] = cmp.mapping.scroll_docs(4),
    ['<c-space>'] = cmp.mapping.complete(),
    ['<c-e>'] = cmp.mapping.close(),
    ['<cr>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<tab>'] = function(fallback)
      if luasnip.expand_or_jumpable() then
        feedkeys('<Plug>luasnip-expand-or-jump')
      elseif vim.fn.pumvisible() == 1 then
        feedkeys('<C-n>')
      else
        fallback()
      end
    end,
    ['<s-tab>'] = function(fallback)
      if luasnip.jumpable(-1) then
        feedkeys('<Plug>luasnip-jump-prev')
      elseif vim.fn.pumvisible() == 1 then
        feedkeys('<C-p>')
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
        spell = '[Spell]'
      })[entry.source.name]

      return vim_item
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'nvim_lua' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'spell' },
  }
}
