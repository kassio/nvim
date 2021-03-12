local utils = require'my/utils'
local api = vim.api

local get_bufnr = function(tab)
  local winnr = api.nvim_tabpage_get_win(tab)
  return api.nvim_win_get_buf(winnr)
end

local get_name = function(tab)
  local bufnr = get_bufnr(tab)
  local fullname = api.nvim_buf_get_name(bufnr)

  if #fullname == 0 then
    return '[No name]'
  else
    local name = vim.fn.fnamemodify(fullname, ':t')
    local icon = utils.fileicon(api.nvim_buf_get_option(bufnr, 'filetype'), name)

    -- Enforces the total size to be 50chars max
    if #name > 42 then
      name = string.sub(name, 1, 39)..'...'
    end

    return string.format('%s %s', icon, name)
  end
end

_G.my_tabline = function()
  local current = api.nvim_get_current_tabpage()
  local current_nr = api.nvim_tabpage_get_number(current)
  local tabs = api.nvim_list_tabpages()

  local labels = vim.tbl_map(function(tab)
    local tabnr = api.nvim_tabpage_get_number(tab)
    local name = get_name(tab)

    local label = string.format('%%%dT %d %s ', tabnr, tabnr, name)

    if tab == current then
      label = '%0.50(%#TabLineSel#'..label..'%*%)'
    end

    return label
  end, tabs)

  -- When the number of tabs if too long
  -- the some tabs might get _hidden_.
  -- To ensure the current tab, and its surrounds, is always visible,
  -- hide only tabs before the current or farther ahead of the current tab
  if current_nr <= math.floor(#tabs/2) then
    return table.concat({
      '%#TabLine#',
      table.concat(labels, '', 1, current_nr + 4),
      '%<(',
      table.concat(labels, '', current_nr + 5, #tabs),
      '%)',
      '%#TabLineFill'
    })
  else
    return table.concat({
      '%#TabLine#',
      '%<(',
      table.concat(labels, '', 1, current_nr - 1),
      '%)',
      table.concat(labels, '', current_nr, #tabs),
      '%#TabLineFill'
    })
  end
end

vim.o.tabline = '%!v:lua.my_tabline()'
