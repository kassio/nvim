local g = vim.g
local utils = require'my/utils'

g.nvim_tree_side = 'right'
g.nvim_tree_width = 32
g.nvim_tree_git_hl = 1
g.nvim_tree_hide_dotfiles = 1
g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 0,
}

g.nvim_tree_icons = {
  default = ' ',
  symlink = '⇔',
  git = {
    unstaged = '*',
    staged = '+',
    unmerged = '?',
    renamed = '»',
    untracked = '%'
  },
  folder = {
    default = '▶',
    open = '▼'
  }
}

g.nvim_tree_bindings = {
  edit = { '<cr>', 'o' },
  edit_vsplit = 'S',
  edit_split = 's',
  edit_tab = 't',
  toggle_ignored = 'I',
  toggle_dotfiles = 'H',
  refresh = 'R',
  cd = 'C',
  create = 'a',
  remove = 'D',
  rename = 'M',
  copy = 'c',
  paste = 'p',
}

utils.augroup('user:file-tree', {
  { 'Filetype', 'NvimTree', 'set nonu nornu' }
})

utils.keymap('n', '<leader>p', ':NvimTreeToggle<CR>')
utils.keymap('n', '<leader>fl', ':NvimTreeFindFile<CR>')
