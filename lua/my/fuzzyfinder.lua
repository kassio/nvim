local actions = require('telescope.actions')

require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_position = "top",
    prompt_prefix = ">",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    file_sorter =  require'telescope.sorters'.get_fuzzy_file ,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_fzy_sorter,
    shorten_path = true,
    use_less = true,
    winblend = 0,
    width = 0.8,
    show_line = false,
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-s>"] = actions.goto_file_selection_split,
        ["<CR>"] = actions.goto_file_selection_edit,
      },
      n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-s>"] = actions.goto_file_selection_split,
        ["<CR>"] = actions.goto_file_selection_edit,
      }
    }
  }
}
