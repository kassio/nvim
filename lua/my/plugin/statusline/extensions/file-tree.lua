local file_tree = require'nvim-tree.lib'

local current_line = function()
  local node = file_tree.get_node_at_cursor()
  local path = vim.fn.fnamemodify(node.absolute_path, ':.')

  if #path > 28 then
    return vim.fn.pathshorten(path)
  else
    return path
  end
end

return {
  sections = { lualine_a = { current_line } },
  filetypes = { 'NvimTree' }
}
