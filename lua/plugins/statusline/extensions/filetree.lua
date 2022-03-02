local fn = vim.fn

local current_line = function()
  return fn.substitute(fn.getline('.'), '^.*[│└] ', '', '')
end

return {
  sections = { lualine_c = { current_line } },
  filetypes = { 'NvimTree' },
}
