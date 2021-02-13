local cmd = vim.cmd
local create_augroup = function(name, autocmds)
  cmd('augroup ' .. name)
  cmd('autocmd!')
  for _, autocmd in ipairs(autocmds) do
    cmd('autocmd ' .. table.concat(autocmd, ' '))
  end
  cmd('augroup END')
end

create_augroup('user:autocmd', {
  { 'BufReadPost', '*', 'call my#bufreadpost()' },

  { 'FileType', 'tex,txt,mail,text,markdown', 'setlocal textwidth=80 noautoindent nocindent' },
  { 'FileType', 'sh,html,javascript,css,eruby,eelixir,sass,scss,yaml', [[setlocal iskeyword+=-]] },
  { 'FileType', 'ruby,eruby,elixir,eelixir', [[setlocal iskeyword+=\?,\!,@-@]] },
  { 'CmdWinEnter', '*', 'setlocal norelativenumber' },

  { 'BufReadPost', 'fugitive://*', 'setlocal bufhidden=delete' },

  { 'BufReadPost,BufNewFile', '*gitconfig', 'setfiletype gitconfig' },
  { 'BufNewFile,BufRead', '.babelrc,.jshintrc,.eslintrc', 'setfiletype json' },
  { 'BufNewFile,BufReadPost', 'Procfile*,Gemfile*', 'setfiletype ruby' },
  { 'BufReadPost,BufNewFile', '*_feature.rb', 'set syntax=rspec' },

  { 'FileType', 'ruby,eruby,elixir,eelixir', 'call user#surround#erb()' },
  { 'FileType', 'ruby,eruby,elixir,eelixir', 'call user#surround#ruby_string_interpolation()' },
  { 'FileType', 'javascript,json', 'call user#surround#javascript_string_interpolation()' },

  { 'VimEnter,WinEnter,BufWinEnter,FileType,BufUnload,VimResized', '*', 'call statusline#update()' },

  { 'WinEnter', '*', 'call window#focus()' },
  { 'WinLeave', '*', 'call window#unfocus()' },
  { 'FocusLost', '*', 'call window#unfocus("norelativenumber")' },
  { 'FocusGained', '*', 'call window#focus("norelativenumber")' },

  { 'WinLeave,FocusLost', '*', 'silent! call buffer#autosave()' },

  { 'BufReadPost,BufNewFile,FileWritePost', '*', 'call buffer#reset_synmaxcol()' },

  { 'BufWritePre,FileWritePre', '*', 'call buffer#trim()' },

  { 'BufRead,BufNewFile', '*/playbooks/**/*.yml', 'set filetype=yaml.ansible' },

  { 'TermOpen', '*', 'setlocal nonumber norelativenumber nocursorline bufhidden=hide' }
})
