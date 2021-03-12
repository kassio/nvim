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

    -- To ensure a tab label limit of 50chars
    -- Truncate the file name if it's too long
    -- Take in consideration icon, tab number and spacing
    if #name > 42 then
      name = string.sub(name, 1, 39)..'...'
    end

    return string.format('%s %s', icon, name)
  end
end

local get_labels = function(current)
  local tabs = api.nvim_list_tabpages()

  return vim.tbl_map(function(tab)
    local tabnr = api.nvim_tabpage_get_number(tab)
    local name = get_name(tab)

    local label = string.format('%%%dT %d %s ', tabnr, tabnr, name)

    if tab == current then
      -- Ensure current tab label has at least 13chars and at most 50chars
      label = '%13.50(%#TabLineSel#'..label..'%*%)'
    end

    return label
  end, tabs)
end

_G.my_tabline = function()
  local current = api.nvim_get_current_tabpage()
  local current_nr = api.nvim_tabpage_get_number(current)
  local labels = get_labels(current)
  local labels_text = table.concat(labels)

  -- Tab labels is not using the whole UI
  if #labels_text < vim.o.columns then
    return table.concat({
      '%#TabLine#',
      table.concat(labels),
      '%#TabLineFill'
    })

  -- When the number of tabs if longer than the UI, some tabs might get _hidden_.
  -- To ensure the current tab, and its surrounds is always visible,
  -- hide only tabs before the current or farther ahead of the current tab
  elseif current_nr <= math.floor(#labels/2) then
    local limit = current_nr + math.max(math.floor(#labels/2), 1)

    return table.concat({
      '%#TabLine#',
      table.concat(labels, '', 1, limit),
      '%<(',
      table.concat(labels, '', limit, #labels),
      '%)',
      '%#TabLineFill'
    })
  else
    return table.concat({
      '%#TabLine#',
      '%<(',
      table.concat(labels, '', 1, current_nr - 1),
      '%)',
      table.concat(labels, '', current_nr, #labels),
      '%#TabLineFill'
    })
  end
end

vim.o.tabline = '%!v:lua.my_tabline()'
