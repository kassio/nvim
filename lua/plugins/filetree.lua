local g = vim.g
local theme = vim.my.theme
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
  disable_netrw = true,
  hijack_netrw = true,
  diagnostics = {
    enable = true,
    icons = {
      hint = theme.signs.hint,
      info = theme.signs.info,
      warning = theme.signs.warn,
      error = theme.signs.error,
    },
  },
  filters = {
    dotfiles = true,
  },
  git = {
    enable = true,
    ignore = true,
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
    auto_resize = false,
    number = false,
    relativenumber = false,
    signcolumn = 'yes',
  },
})

keymap('n', '<leader>p', ':NvimTreeToggle<CR>')
keymap('n', '<leader>fl', ':NvimTreeFindFile<CR>')
