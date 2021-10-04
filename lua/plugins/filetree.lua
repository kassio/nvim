local g = vim.g
local keymap = vim.my.utils.keymap

g.nvim_tree_git_hl = 1
g.nvim_tree_hide_dotfiles = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_highlight_opened_files = 3
g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  folder_arrows = 0,
  files = 1,
}

require('nvim-tree').setup({
  view = {
    width = 32,
    side = 'right',
  },
  lsp_diagnostics = true,
  update_focused_file = { enable = true },
  ignore_ft_on_setup = {
    '.git',
    'node_modules',
    'dump.rdb',
    '.byebug_history',
    '.vscode',
    '.idea',
  },
})

keymap('n', '<leader>p', ':NvimTreeToggle<CR>')
keymap('n', '<leader>fl', ':NvimTreeFindFile<CR>')
