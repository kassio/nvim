local actions = require'telescope.actions'
local sorters = require'telescope.sorters'
local previewers = require'telescope.previewers'
local builtin = require'telescope.builtin'

require('telescope').setup{
  defaults = {
    file_ignore_patterns = {},
    file_previewer = previewers.vim_buffer_cat.new,
    file_sorter = sorters.get_fuzzy_file,
    generic_sorter = sorters.get_fzy_sorter,
    preview_cutoff = 120,
    prompt_position = 'top',
    prompt_prefix = '›',
    results_width = 0.5,
    shorten_path = true,
    sorting_strategy = 'ascending',
    width = 0.8,
    winblend = 0,
    borderchars = {
      prompt = { '─', '│', '─', '│', '┌', '┬', '┤', '├' },
      results = { ' ', '│', '─', '│', '│', '│', '┴', '└' },
      preview = { '─', '│', '─', ' ', '─', '┐', '┘', '─' }
    },
    mappings = {
      i = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-s>'] = actions.goto_file_selection_split,
        ['<CR>'] = actions.goto_file_selection_edit,
        ['<esc>'] = actions.close
      }
    }
  }
}

local themeCustomization = {
  prompt_title = false,
  results_title = false,
  preview_title = false
}

return {
  find_files = function()
    builtin.find_files(themeCustomization)
  end,
  grep_string = function()
    builtin.grep_string(themeCustomization)
  end,
  buffers = function()
    builtin.buffers(themeCustomization)
  end,
  current_buffer_fuzzy_find = function()
    builtin.current_buffer_fuzzy_find(themeCustomization)
  end,
  highlights = function()
    builtin.highlights(themeCustomization)
  end,
  live_grep = function()
    builtin.live_grep(themeCustomization)
  end,
  lsp_document_symbols = function()
    builtin.lsp_document_symbols(themeCustomization)
  end,
  lsp_workspace_symbols = function()
    builtin.lsp_workspace_symbols(themeCustomization)
  end,
  oldfiles = function()
    builtin.oldfiles(themeCustomization)
  end
}
