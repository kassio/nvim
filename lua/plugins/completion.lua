local cmp = R('cmp')
local types = R('cmp.types')
local mapping = cmp.mapping
local snippets = R('snippy')
local fn = vim.fn
local api = vim.api

local termcoded = function(key)
  return api.nvim_replace_termcodes(key, true, true, true)
end

local feedkeys = function(key, mode)
  mode = mode or ''

  return fn.feedkeys(termcoded(key), mode)
end

local check_back_space = function()
  local col = fn.col('.') - 1

  if col == 0 or fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end

snippets.setup({
  snippet_dirs = fn.stdpath('config') .. '/snippets',
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
    completeopt = 'menuone,noinsert,noselect',
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
        snippets = '',
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
    ['<c-space>'] = mapping(mapping.complete(), { 'i', 'c' }),
    ['<c-n>'] = mapping(mapping.select_next_item({ behavior = types.cmp.SelectBehavior.Select }), { 'i', 'c', 's' }),
    ['<c-p>'] = mapping(mapping.select_prev_item({ behavior = types.cmp.SelectBehavior.Select }), { 'i', 'c', 's' }),
    ['<c-y>'] = mapping.confirm({ select = true }),
    ['<cr>'] = mapping.confirm({ select = true }),
    ['<c-e>'] = mapping.abort(),
    ['<tab>'] = mapping(function()
      if snippets.can_expand_or_advance() then
        return feedkeys('<plug>(snippy-expand-or-next)')
      elseif check_back_space() then
        return feedkeys('<tab>')
      else
        cmp.complete()
      end
    end, { 'i', 'c', 's' }),
    ['<s-tab>'] = mapping(function()
      if snippets.can_jump(-1) then
        return feedkeys('<plug>(snippy-previous)')
      else
        return feedkeys('<s-tab>')
      end
    end, { 'i', 'c', 's' }),
  },
  snippet = {
    expand = function(args)
      snippets.expand_snippet(args.body)
    end,
  },
  sources = {
    { name = 'snippy', max_item_count = 5 },
    { name = 'treesitter', keyword_length = 2, max_item_count = 5 },
    { name = 'nvim_lsp', keyword_length = 2, max_item_count = 3 },
    { name = 'nvim_lua', keyword_length = 2, max_item_count = 3 },
    { name = 'buffer', keyword_length = 3, max_item_count = 3, opts = { get_bufnrs = api.nvim_list_bufs } },
    { name = 'spell', keyword_length = 3, max_item_count = 5 },
    { name = 'path', max_item_count = 10 },
  },
})
