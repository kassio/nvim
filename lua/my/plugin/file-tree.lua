local g = vim.g
local utils = require'my/utils'

g.nvim_tree_side = 'right'
g.nvim_tree_width = 32
g.nvim_tree_git_hl = 1
g.nvim_tree_hide_dotfiles = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1,
}

g.nvim_tree_icons = {
  default = '',
  symlink = '',
  git = {
    unstaged = "*",
    staged = "✓",
    unmerged = "",
    renamed = "➜",
    untracked = "%"
  },
  folder = {
    default = '▶',
    open = '▼',
    empty = '▷',
    empty_open = '▽',
    symlink = ""
  }
}

g.nvim_tree_ignore = {
  '.git',
  'node_modules',
  'dump.rdb',
  '.byebug_history',
  '.vscode',
  '.idea'
}

utils.augroup('user:file-tree', {
  { 'WinEnter', 'NvimTree', 'set nonu nornu' },
  { 'WinEnter', 'NvimTree', 'normal! zH' }
})

utils.keymap('n', '<leader>p', ':NvimTreeToggle<CR>')
utils.keymap('n', '<leader>fl', ':NvimTreeFindFile<CR>')
