local M = {}

M.spacer = {
  function()
    return ' '
  end,
  padding = 0,
}

M.filename = function(opts)
  opts = vim.tbl_extend('keep', opts or {}, {
    icon_color = true,
  })

  return {
    {
      'filetype',
      colored = opts.icon_color,
      icon_only = true,
      padding = 1,
    },
    {
      'filename',
      file_status = true,
      path = 1,
      shorting_target = 30,
      symbols = { modified = ' ', readonly = ' ', unnamed = ' [No Name] ' },
      padding = 0,
    },
    M.spacer,
  }
end

M.bufnr = function()
  return {
    function()
      return tostring(vim.api.nvim_get_current_buf())
    end,
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
