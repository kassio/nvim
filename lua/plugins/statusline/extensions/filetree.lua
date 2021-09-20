local file_tree = R('nvim-tree.lib')

local ensure_path_size = function(path)
  if #path > 28 then
    return vim.fn.pathshorten(path)
  else
    return path
  end
end

local current_line = function()
  local default_path = vim.fn.getcwd()
  local node = file_tree.get_node_at_cursor() or {}

  if node.absolute_path then
    return ensure_path_size(vim.fn.fnamemodify(node.absolute_path, ':.'))
  else
    return ensure_path_size(vim.fn.fnamemodify(default_path, ':~'))
  end
end

return {
  sections = { lualine_a = { current_line } },
  filetypes = { 'NvimTree' },
}
