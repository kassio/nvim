local actions = require'telescope.actions'
local sorters = require'telescope.sorters'
local previewers = require'telescope.previewers'
local builtin = require'telescope.builtin'

require('telescope').setup{
  defaults = {
    prompt_position = 'top',
    prompt_prefix = '>',
    sorting_strategy = 'ascending',
    file_sorter = sorters.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter = sorters.get_fzy_sorter,
    shorten_path = true,
    preview_cutoff = 120,
    file_previewer = previewers.vim_buffer_cat.new,
    winblend = 0,
    width = 0.8,
    mappings = {
      i = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-s>'] = actions.goto_file_selection_split,
        ['<CR>'] = actions.goto_file_selection_edit,
      },
      n = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-s>'] = actions.goto_file_selection_split,
        ['<CR>'] = actions.goto_file_selection_edit,
      }
    }
  }
}

return builtin
