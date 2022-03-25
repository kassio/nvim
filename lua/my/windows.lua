local M = {}

M.close_floating = function()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local ok, config = pcall(vim.api.nvim_win_get_config, win)

    if ok and config.relative ~= '' then
      vim.api.nvim_win_close(win, true)
    end
  end
end

return M
