--[[
Traverse the AST from the node under the cursor up to the current tree root.
For each 'module' or 'class' node, get the constants text for the node.
--]]
local ts_utils = R('nvim-treesitter.ts_utils')

local node_identifier = function(current_node)
  for _, node in ipairs(ts_utils.get_named_children(current_node)) do
    if node:type() == 'identifier' then
      return vim.treesitter.get_node_text(node, 0)
    end
  end
end

local h = {}

h.namespace_constants = function(node, constants)
  constants = constants or {}

  for i = node:named_child_count() - 1, 0, -1 do
    local child = node:named_child(i)

    if child:type() == 'constant' then
      table.insert(constants, vim.treesitter.get_node_text(child, 0))
    elseif child:type() == 'scope_resolution' then
      h.namespace_constants(child, constants)
    end
  end

  return constants
end

h.namespace_list = function(current_node, list)
  list = list or {}

  if current_node then
    if vim.tbl_contains({ 'module', 'class' }, current_node:type()) then
      table.insert(list, h.namespace_constants(current_node))
      list = vim.tbl_flatten(list)
    end

    return h.namespace_list(current_node:parent(), list)
  else
    return list
  end
end

h.least_namespace = function(current_node)
  if current_node == nil then
    return ""
  elseif vim.tbl_contains({ 'module', 'class' }, current_node:type()) then
    return table.concat(h.namespace_constants(current_node), '::')
  elseif current_node:type() == 'singleton_method' then
    return '.'..node_identifier(current_node)
  elseif current_node:type() == 'method' then
    return '#'..node_identifier(current_node)
  else
    return h.least_namespace(current_node:parent())
  end
end

local M = {}

M.namespace = function()
  local node = ts_utils.get_node_at_cursor(0)
  local constants = h.namespace_list(node)
  local namespace = {}

  -- The tree is traversed from bottom-up, that's why
  -- the list is reversed to build the namespace
  for i = #constants, 0, -1 do
    table.insert(namespace, constants[i])
  end

  return table.concat(namespace, '::')
end


M.least_namespace = function()
  return h.least_namespace(ts_utils.get_node_at_cursor(0))
end

return M
