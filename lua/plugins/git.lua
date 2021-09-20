local gitsigns = R('gitsigns')

local git = function(args, callback)
  vim.fn.jobstart('git ' .. args, {
    stdout_buffered = true,
    on_stdout = function(_, data)
      callback(data[1])
    end,
  })
end

local open_remote = function(ref, file, line)
  git('remote get-url origin', function(url)
    url = string.gsub(url, '^git@', 'https://')
    url = string.gsub(url, '%.git$', '')

    url = string.format('%s/blob/%s/%s#L%s', url, ref, file, line)

    vim.fn.jobstart({ 'open', url })
  end)
end

local open_main = function(file, line)
  git('branch-main', function(ref)
    open_remote(ref, file, line)
  end)
end

local open_ref = function(file, line)
  local pathspec = string.format('-L %s,%s:%s', line, line, file)
  local cmd = string.format('log --no-patch --pretty=format:"%%H" %s', pathspec)

  git(cmd, function(ref)
    if ref ~= '' then
      open_remote(ref, file, line)
    else
      open_main(file, line)
    end
  end)
end

gitsigns.setup{
  signs = {
    add = { hl = 'GitSignAdd', numhl = 'GitSignAddLineNr', text = '│' },
    change = { hl = 'GitSignChange', numhl = 'GitSignChangeLineNr', text = '│' },
    delete = { hl = 'GitSignDelete', numhl = 'GitSignDeleteLineNr', text = '│' },
    topdelete = { hl = 'GitSignDelete', numhl = 'GitSignDeleteLineNr', text = '‾' },
    changedelete = { hl = 'GitSignDelete', numhl = 'GitSignDeleteLineNr', text = '│' }
  },
  numhl = true
}

vim.my.git = {}
vim.my.git.remote = function(main)
  local file = vim.fn.expand('%:.')
  local line = vim.fn.line('.')

  if main then
    open_main(file, line)
  else
    open_ref(file, line)
  end
end

vim.my.utils.command('Gremote lua vim.my.git.remote()')
vim.my.utils.command('GremoteMain lua vim.my.git.remote(true)')
vim.my.utils.command('Grt G restore % | redraw!')

vim.my.utils.cabbrev('Gblame', 'G blame')
vim.my.utils.cabbrev('Gb', 'G blame')
vim.my.utils.cabbrev('Gdiff', 'Gdiffsplit')
vim.my.utils.cabbrev('Gd', 'Gdiffsplit')
