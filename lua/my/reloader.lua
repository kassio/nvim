local _reloadable_namespaces = nil
local reloadable_namespaces = function()
  if _reloadable_namespaces == nil then
    local result = vim.tbl_keys(_G.packer_plugins)
    table.insert(result, 'my')
    table.insert(result, 'plugins')
    _reloadable_namespaces = result
  end

  return _reloadable_namespaces
end

local ns = function(name)
  if string.match(name, '%.') then
    return vim.split(name, '%.')[1]
  else
    return name
  end
end

local can_reload = function(pack)
  for _, reloadable in ipairs(reloadable_namespaces()) do
    if ns(pack) == ns(reloadable) then
      return true
    end
  end

  return false
end

return {
  reload = function()
    local packs = vim.tbl_keys(package.loaded)
    table.sort(packs)
    for _, pack in ipairs(packs) do
      if can_reload(pack) then
        package.loaded[pack] = nil
      end
    end
    vim.cmd(string.format('luafile %s/init.lua', vim.fn.stdpath('config')))
  end,
}
