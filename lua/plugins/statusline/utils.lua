local fn = vim.fn
local filetree = require('nvim-tree.lib')
local M = {}

M.filetree_current_file = function()
  return './' .. fn.fnamemodify(filetree.get_node_at_cursor().absolute_path, ':.')
end

M.neoterm_id = function()
  return 'neoterm-' .. vim.b.neoterm_id
end

M.spacer = {
  function()
    return ' '
  end,
  padding = 0,
}


end

M.mode = function()
  local mode_map = {
    ['n'] = 'N',
    ['no'] = 'O',
    ['nov'] = 'O',
    ['noV'] = 'O',
    ['no'] = 'O',
    ['niI'] = 'N',
    ['niR'] = 'N',
    ['niV'] = 'N',
    ['v'] = 'V',
    ['V'] = 'V',
    [''] = 'V',
    ['s'] = 'S',
    ['S'] = 'S',
    [''] = 'S',
    ['i'] = 'I',
    ['ic'] = 'I',
    ['ix'] = 'I',
    ['R'] = 'R',
    ['Rc'] = 'R',
    ['Rv'] = 'R',
    ['Rx'] = 'R',
    ['c'] = 'C',
    ['cv'] = 'E',
    ['ce'] = 'E',
    ['r'] = 'R',
    ['rm'] = 'M',
    ['r?'] = '?',
    ['!'] = '!',
    ['t'] = 'T',
  }
  local function get_mode()
    local mode_code = vim.api.nvim_get_mode().mode
    if mode_map[mode_code] == nil then
      return mode_code
    end
    return mode_map[mode_code]
  end

  return {
    get_mode,
  }
end

return M
