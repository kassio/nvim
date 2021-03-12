local utils = require'my/utils'
local api = vim.api

_G.my_tabline = function()
  local current = api.nvim_get_current_tabpage()

  local tabs = vim.tbl_map(function(tab)
    local tabnr = api.nvim_tabpage_get_number(tab)
    local winnr = api.nvim_tabpage_get_win(tab)
    local bufnr = api.nvim_win_get_buf(winnr)
    local fullname = api.nvim_buf_get_name(bufnr)
    local name = vim.fn.fnamemodify(fullname, ':t')
    if #name == 0 then
      name = '[No name]'
    end
    local icon = utils.fileicon(api.nvim_buf_get_option(bufnr, 'filetype'), name)
    local modified = api.nvim_buf_get_option(bufnr, 'modified') and '+' or ' '

    local text = string.format('%%%dT %d %s %s %s', tabnr, tabnr, icon, name, modified, debug)

    if tab == current then
      text = '%0.50(%#TabLineSel#'..text..'%*%)'
    end

    return text
  end, api.nvim_list_tabpages())

  return table.concat({
    '%#TabLine#',
    table.concat(tabs),
    '%#TabLineFill'
  })
end

vim.o.tabline = '%!v:lua.my_tabline()'
