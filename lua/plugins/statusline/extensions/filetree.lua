local current_line = function()
  return vim.fn.getline('.'):gsub('[^%a%d%p]', '')
end

return {
  sections = { lualine_a = { current_line } },
  filetypes = { 'NvimTree' },
}
