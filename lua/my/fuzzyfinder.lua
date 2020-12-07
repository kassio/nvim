local actions = require('telescope.actions')

require('telescope').setup{
  defaults = {
    prompt_position = "top",
    prompt_prefix = ">",
    file_sorter =  require'telescope.sorters'.get_fuzzy_file ,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_fzy_sorter,
    shorten_path = true,
    winblend = 0,
    width = 0.8,
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
