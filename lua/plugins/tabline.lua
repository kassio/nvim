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
    local icon = vim.my.buffers.fileicon()

    -- To ensure a tab label limit of 50chars
    -- Truncate the file name if it's too long
    -- Take in consideration icon, tab number and spacing
    if #name > 42 then
      name = string.sub(name, 1, 39) .. '...'
    end

    return string.format('%s %s', icon, name)
  end
end

local label_for = function(tabnr, name, current)
  local text = string.format('%%%dT %d %s', tabnr, tabnr, name)

  if current then
    -- Ensure current tab text has at least 13chars and at most 50chars
    text = '%13.50(%#TabLineSel#' .. text .. ' %*%) '
  else
    text = text .. ' '
  end

  return text
end

local get_labels = function(current)
  local tabs = api.nvim_list_tabpages()

  return vim.tbl_map(function(tab)
    local tabnr = api.nvim_tabpage_get_number(tab)
    local name = get_name(tab)

    return label_for(tabnr, name, tab == current)
  end, tabs)
end

local get_limit = function(labels, columns)
  local current = 0
  local limit = 0

  for i, label in ipairs(labels) do
    limit = i
    current = current + #label

    if current >= columns then
      break
    end
  end

  return limit
end

vim.my.tabline = function()
  local current = api.nvim_get_current_tabpage()
  local current_nr = api.nvim_tabpage_get_number(current)
  local labels = get_labels(current)
  local labels_text = table.concat(labels)

  -- Tab labels is not using the whole UI
  if #labels_text < vim.o.columns then
    return table.concat({ '%#TabLine#', table.concat(labels), '%#TabLineFill' })
  elseif current_nr <= math.floor(#labels / 2) then
    -- When the number of tabs if longer than the UI, some tabs might
    -- get hidden. To ensure the current tab, and its surrounds is always
    -- visible, hide only tabs before the current or farther ahead of the
    -- current tab
    local limit = math.min(current_nr + get_limit(labels, vim.o.columns), #labels)

    return table.concat({
      '%#TabLine#',
      table.concat(labels, '', 1, limit),
      '%<(',
      table.concat(labels, '', limit, #labels),
      '%)',
      '%#TabLineFill',
    })
  else
    return table.concat({
      '%#TabLine#',
      '%<(',
      table.concat(labels, '', 1, current_nr - 1),
      '%)',
      table.concat(labels, '', current_nr, #labels),
      '%#TabLineFill',
    })
  end
end

vim.o.tabline = '%!v:lua.vim.my.tabline()'
