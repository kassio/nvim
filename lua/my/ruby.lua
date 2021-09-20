--[[
Traverse the AST from the node under the cursor up to the current tree root.
For each 'module' or 'class' node, get the constants text for the node.
--]]
local ts_utils = R('nvim-treesitter.ts_utils')

local is_namespace = function(node)
  return vim.tbl_contains({'module', 'class'}, node:type())
end

local function namespace_list(current_node, list)
  list = list or {}

  if current_node then
    if is_namespace(current_node) then
      table.insert(list, namespace_constants(current_node))
      list = vim.tbl_flatten(list)
    end

    return namespace_list(current_node:parent(), list)
  else
    return list
  end
end

local function namespace_constants(node, constants)
  constants = constants or {}

  for i = node:named_child_count() - 1, 0, -1 do
    local child = node:named_child(i)

    if child:type() == 'constant' then
      table.insert(constants, vim.treesitter.get_node_text(child, 0))
    elseif child:type() == 'scope_resolution' then
      namespace_constants(child, constants)
    end
  end

  return constants
end

local M = {}

M.namespace = function()
  local node = ts_utils.get_node_at_cursor(0)
  local constants = namespace_list(node)
  local namespace = {}

  -- The tree is traversed from bottom-up, that's why
  -- the list is reversed to build the namespace
  for i = #constants, 0, -1 do
    table.insert(namespace, constants[i])
  end

  return table.concat(namespace, '::')
end

return M
