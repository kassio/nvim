require'my/utils'.augroup('user:autocmd', {
  { 'BufReadPost,BufNewFile', '*', 'call my#bufreadpost()' },
  { 'FileType', 'tex,txt,mail,text,markdown', 'setlocal textwidth=80 noautoindent nocindent' },
  { 'FileType', 'sh,html,javascript,css,eruby,eelixir,sass,scss,yaml', [[setlocal iskeyword+=-]] },
  { 'FileType', 'ruby,eruby,elixir,eelixir', [[setlocal iskeyword+=\?,\!,@-@]] },
  { 'CmdWinEnter', '*', 'setlocal norelativenumber' },

  { 'BufReadPost', 'fugitive://*', 'setlocal bufhidden=delete' },
  { 'BufReadPost', 'fugitive://*', 'normal gg' },
  { 'BufReadPost', 'fugitive://*', 'normal zH' },

  { 'BufReadPost,BufNewFile', '*gitconfig', 'setfiletype gitconfig' },
  { 'BufReadPost,BufNewFile', '*scm', 'setfiletype query' },
  { 'BufNewFile,BufRead', '.babelrc,.jshintrc,.eslintrc', 'setfiletype json' },
  { 'BufNewFile,BufReadPost', 'Procfile*,Gemfile*', 'setfiletype ruby' },
  { 'BufReadPost,BufNewFile', '*_feature.rb', 'set syntax=rspec' },

  { 'FileType', 'ruby,eruby,elixir,eelixir', 'call user#surround#erb()' },
  { 'FileType', 'ruby,eruby,elixir,eelixir', 'call user#surround#ruby_string_interpolation()' },
  { 'FileType', 'javascript,json', 'call user#surround#javascript_string_interpolation()' },

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
