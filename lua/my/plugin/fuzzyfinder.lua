local actions = require'telescope.actions'
local sorters = require'telescope.sorters'
local previewers = require'telescope.previewers'
local builtin = require'telescope.builtin'

require('telescope').setup{
  defaults = {
    file_ignore_patterns = {},
    file_previewer = previewers.vim_buffer_cat.new,
    file_sorter = sorters.get_fzy_file,
    generic_sorter = sorters.get_fzy_sorter,
    preview_cutoff = 120,
    prompt_position = 'top',
    prompt_prefix = '›',
    shorten_path = true,
    sorting_strategy = 'ascending',
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
        ['<CR>'] = actions.select_default,
        ['<esc>'] = actions.close
      }
    }
  }
}

local themeDefaults = {
  prompt_title = false,
  results_title = false,
  preview_title = false
}

local setTheme = function(opts)
  opts = opts or {}
  for k, v in pairs(themeDefaults) do
    opts[k] = opts[k] or v
  end

  return opts
end

vim.fuzzy_finder = {
  find_files = function(opts)
    builtin.find_files(setTheme(opts))
  end,
  grep_string = function(opts)
    builtin.grep_string(setTheme(opts))
  end,
  live_grep = function(opts)
    builtin.live_grep(setTheme(opts))
  end,
  buffers = function(opts)
    builtin.buffers(setTheme(opts))
  end,
  current_buffer_fuzzy_find = function(opts)
    builtin.current_buffer_fuzzy_find(setTheme(opts))
  end,
  highlights = function(opts)
    builtin.highlights(setTheme(opts))
  end,
  lsp_document_symbols = function(opts)
    builtin.lsp_document_symbols(setTheme(opts))
  end,
  lsp_workspace_symbols = function(opts)
    builtin.lsp_workspace_symbols(setTheme(opts))
  end,
  oldfiles = function(opts)
    builtin.oldfiles(setTheme(opts))
  end
}
