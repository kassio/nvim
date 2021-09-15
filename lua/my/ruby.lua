local utils = R('my.utils')
local ts_utils = R('nvim-treesitter.ts_utils')

local is_namespace = function(node)
  return vim.tbl_contains({'module', 'class'}, node:type())
end

function find_root_for(node, root)
  if node then
    if is_namespace(node) then
      root = node
    end

    return find_root_for(node:parent(), root)
  else
    return root
  end
end

function find_namespace_constants(node, constants)
  constants = constants or {}

  if is_namespace(node) then
    for i = 0, node:named_child_count() - 1, 1 do
      local child = node:named_child(i)

      if child:type() == 'constant' then
        table.insert(constants, vim.treesitter.get_node_text(child, 0))
      end

      find_namespace_constants(child, constants)
    end
  end

  return constants
end

local M = {}

M.namespace = function()
  local node = ts_utils.get_node_at_cursor(0)
  local root_node = find_root_for(node)
  local constants = find_namespace_constants(root_node)

  return table.concat(constants, '::')
end

M.copy_namespace = function(external_clipboard)
  utils.to_clipboard(M.current_namespace(), external_clipboard)
end

return M
