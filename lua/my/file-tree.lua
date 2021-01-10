vim.g.nvim_tree_side = 'right'
vim.g.nvim_tree_hide_dotfiles = 1
vim.g.nvim_tree_width = 32
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 0,
}

vim.g.nvim_tree_icons = {
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
    default = '▸',
    open = '▾'
  }
}

vim.g.nvim_tree_bindings = {
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
