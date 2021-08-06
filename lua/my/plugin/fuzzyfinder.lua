local telescope = require'telescope'
local actions = require'telescope.actions'
local utils = require'telescope.actions.utils'
local action_state = require "telescope.actions.state"
local builtin = require'telescope.builtin'

telescope.load_extension'fzy_native'

local open_files = function(mode)
  return function(bufnr)
    local files = {}

    utils.map_selections(bufnr, function(entry)
      table.insert(files, entry.value)
    end)

    if vim.tbl_isempty(files) then
      entry = action_state.get_selected_entry()
      table.insert(files, entry.value)
    end

    for index, file in ipairs(files) do
      vim.cmd(string.format("%s %s", mode, file))
      vim.cmd('stopinsert')
    end
  end
end

telescope.setup{
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    }
  },
  defaults = {
    mappings = {
      i = {
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-u>'] = { "<c-u>", type = "command" },
        ["<C-v>"] = open_files('vnew'),
        ["<C-x>"] = open_files('new'),
        ["<C-t>"] = open_files('tabnew')
      }
    },
    layout_config = {
      prompt_position = 'top',
    },
    prompt_prefix = '› ',
    selection_caret = '› ',
    set_env = { ['COLORTERM'] = 'truecolor' },
    sorting_strategy = 'ascending',
    winblend = 0
  }
}

vim.my.fuzzyfinder = {
  find_files = function(opts)
    local opts = opts or {}
    builtin.find_files(vim.tbl_extend('keep', opts, {
      find_command = { 'files' }
    }))
  end,
  grep_string = builtin.grep_string,
  live_grep = builtin.live_grep,
  buffers = builtin.buffers,
  current_buffer_fuzzy_find = function(opts)
    builtin.current_buffer_fuzzy_find(require'telescope.themes'.get_dropdown())
  end,
  highlights = builtin.highlights,
  lsp_document_symbols = function(opts)
    builtin.lsp_document_symbols(require'telescope.themes'.get_dropdown())
  end,
  lsp_workspace_symbols = builtin.lsp_workspace_symbols,
  oldfiles = builtin.oldfiles,
  builtin = builtin.builtin
}
