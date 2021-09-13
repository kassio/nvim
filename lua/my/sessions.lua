local M = {
  session_dir = string.format('%s/sessions', vim.fn.stdpath('data')),
  path_replacer = '_',
}

M.escaped_file_path = (function()
  return string.gsub(vim.fn.getcwd(), '[/%.]', M.path_replacer)
end)()

local prefix_from = function(session)
  session = vim.fn.split(session, '/')

  if #session > 0 then
    session = session[#session]

    return vim.fn.split(session, '+')[1]
  else
    return ''
  end
end

local session_for = function(prefix)
  return string.format(
    '%s/%s+%s',
    M.session_dir,
    prefix,
    M.escaped_file_path
  )
end

local session_list = function()
  return vim.fn.glob(session_for('*'), false, true)
end

local session_selector = function(list)
  local options = {}

  for i, path in ipairs(list) do
    local split = vim.fn.split(path, '/')
    local session = split[#split]
    local prefix = prefix_from(session)
    split = string.format('%s. %s', i, prefix)

    table.insert(options, 1, split)
  end

  table.sort(options)

  table.insert(options, 1, 'Available Sessions: ')

  return tonumber(vim.fn.inputlist(options))
end

local with_session = function(callback)
  local sessions = session_list()

  if #sessions > 0 then
    local index = session_selector(sessions)

    -- confirm returns 0 for <esc>
    -- and the chose choice indexed on 1
    if index > 0 then
      local file = sessions[index]

      if vim.fn.filereadable(file) then
        callback(file)

        return file
      end
    end
  end
end

local delete_session = function(session)
  vim.fn.delete(session, 'rf')
end

M.save = function(prefix)
  if not(prefix) then
    local question = 'Choose the session name'
    local default = prefix_from(vim.api.nvim_get_vvar('this_session'))

    if #default > 0 then
      question = string.format('%s (default %s)', question, default)
    end

    prefix = vim.fn.input(question..': ')
  end

  -- All sessions require a prefix
  if string.len(prefix or '') > 0 then
    vim.fn.mkdir(M.session_dir, 'p')

    local session = session_for(prefix)

    vim.api.nvim_set_vvar('this_session', session)

    vim.cmd(string.format('silent! mksession! %s | redraw!', session))
    vim.notify('Session created', vim.log.levels.INFO)
  else
    vim.notify('Session Error: prefix required', vim.log.levels.ERROR)
  end
end

M.load = function()
  local session = with_session(function(session)
    vim.cmd(string.format('silent! source %s | redraw!', session))
    vim.notify('Session loaded', vim.log.levels.INFO)
  end)

  if not(session) then
    vim.notify('No sessions available', vim.log.levels.INFO)
  end
end

M.destroy = function()
  return with_session(function(session)
    delete_session(session)
    print(" ")
    vim.notify('Session destroyed', vim.log.levels.INFO)
  end)
end

M.destroy_all = function()
  for _, session in ipairs(session_list()) do
    delete_session(session)
  end
end

return M
