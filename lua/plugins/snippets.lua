local keymap = function(mode, lhs, rhs)
  vim.my.utils.keymap(mode, lhs, rhs, { expr = true })
end

-- Expand
keymap('i', '<C-j>', [[vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>']])
keymap('s', '<C-j>', [[vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>']])

-- Expand or jump
keymap('i', '<C-l>', [[vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']])
keymap('s', '<C-l>', [[vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']])

-- Jump forward or backward
keymap('i', '<Tab>', [[vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>']])
keymap('s', '<Tab>', [[vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>']])
keymap('i', '<S-Tab>', [[vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>']])
keymap('s', '<S-Tab>', [[vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>']])
