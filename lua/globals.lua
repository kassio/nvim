-- P = Print with inpect
P = function(anything)
  print(vim.inspect(anything))
  return anything
end

-- R = Reload
-- Reloads a package by name
-- If it fails to be loaded the error is printed
R = function(name)
  package.loaded[name] = nil
  local status, result = pcall(require, name)

  if status then
    return result -- package
  else
    print('Failed to load '..name)
    print(result) -- error message
  end
end
