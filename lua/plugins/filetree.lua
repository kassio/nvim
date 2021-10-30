local g = vim.g
local keymap = vim.my.utils.keymap

g.nvim_tree_git_hl = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_highlight_opened_files = 3
g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  folder_arrows = 0,
  files = 1,
}

require('nvim-tree').setup({
  diagnostics = {
    enable = true,
    icons = {
      hint = vim.my.signs.hint,
      info = vim.my.signs.info,
      warning = vim.my.signs.warn,
      error = vim.my.signs.error,
    },
  },
  filters = {
    dotfiles = false
  },
  ignore_ft_on_setup = {
    '.git',
    'node_modules',
    'dump.rdb',
    '.byebug_history',
    '.vscode',
    '.idea',
  },
  update_focused_file = { enable = true },
  view = {
    width = 32,
    side = 'right',
  },
})

keymap('n', '<leader>p', ':NvimTreeToggle<CR>')
keymap('n', '<leader>fl', ':NvimTreeFindFile<CR>')
