local ensure_path_size = function(path)
  if #path > 28 then
    return vim.fn.pathshorten(path)
  else
    return path
  end
end

local current_line = function()
  return ensure_path_size(vim.fn.fnamemodify(vim.fn.getcwd(), ':~'))
end

return {
  sections = { lualine_a = { current_line } },
  filetypes = { 'NvimTree' },
}
