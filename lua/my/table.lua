function table.removekey(table, key)
  local element = table[key]
  table[key] = nil
  return element
end
