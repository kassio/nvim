local devicons = require'nvim-web-devicons'
local api = vim.api
local fn = vim.fn
local M = {}

local cmd = vim.cmd

M.augroup = function(name, autocmds)
  cmd('augroup ' .. name)
  cmd('autocmd!')
  for _, autocmd in ipairs(autocmds) do
    cmd('autocmd ' .. table.concat(autocmd, ' '))
  end
  cmd('augroup END')
end

M.command = function(args)
  cmd("command! "..args)
end

M.keymap = function(mode, lhs, rhs, opts)
  opts = opts or {}
  setmetatable(opts, { __index = {
    noremap = true,
    silent = true
  }})

  api.nvim_set_keymap(mode, lhs, rhs, opts)
end

M.lua_keymap = function(mode, lhs, rhs, opts)
  M.keymap('n', lhs, '<cmd>lua '..rhs..'<cr>')
end

M.buf_keymap = function(buf, mode, lhs, rhs, opts)
  opts = opts or {}
  setmetatable(opts, { __index = {
    noremap = true,
    silent = true
  }})

  api.nvim_buf_set_keymap(buf, mode, lhs, rhs, opts)
end

M.lua_buf_keymap = function(buf, mode, lhs, rhs, opts)
  M.buf_keymap(buf, mode, lhs, '<cmd>lua '..rhs..'<cr>')
end

M.fileicon = function(filetype, filename)
  local filetype_extensions = {
    ruby = 'rb',
    sh = 'sh',
    bash = 'bash',
    zsh = 'zsh'
  }

  local extension =  filetype_extensions[filetype] or fn.fnamemodify(filename, ':e')

  return devicons.get_icon(filename, extension, { default = true })
end

M.upgrade = function()
  require('my/plugin/lspinstall').installAll()

  local timer = vim.loop.new_timer()
  local timeout = 60 -- max time to wait an open window
  local counter = 0

  timer:start(2000, 1000, vim.schedule_wrap(function()
    local list = api.nvim_tabpage_list_wins(0)

    if #list <= 1 then
      timer:close()
      require('my/plugin').sync()
    elseif counter < timeout then
      counter = counter + 1

      for _, wid in ipairs(list) do
        if api.nvim_win_is_valid(wid) then
          local buffer = api.nvim_win_get_buf(wid)
          local ok, jid = pcall(api.nvim_buf_get_var, buffer, 'terminal_job_id')

          if ok and
            api.nvim_win_get_number(wid) ~= api.nvim_win_get_number("$") and
            vim.fn.jobwait({jid}, 0)[1] == -3
          then
            counter = 0
            api.nvim_win_close(0, true)
          end
        end
      end
    else
      for _, wid in ipairs(list) do
        if api.nvim_win_is_valid(wid) then
          api.nvim_win_close(0, true)
        end
      end
    end
  end))
end

return M
