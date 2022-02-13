local current_line = function()
  return vim.fn.getline('.'):gsub('%.*│ ', '')
end

return {
  sections = { lualine_c = { current_line } },
  filetypes = { 'NvimTree' },
}
