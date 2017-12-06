aug user:autocmd
  au!
  au BufReadPost * call buffer#restore_cursor_position()

  au FileType tex,txt,mail,text,markdown setlocal textwidth=80 noautoindent nocindent
  au FileType sh,html,javascript,css,eruby,eelixir,sass,scss,yaml setlocal iskeyword+=-
  au FileType ruby,eruby,elixir,eelixir setlocal iskeyword+=\?,\!,@-@
  au CmdWinEnter * setlocal norelativenumber

  au BufReadPost fugitive://* setlocal bufhidden=delete

  au BufNewFile,BufRead .babelrc,.jshintrc,.eslintrc setfiletype json
  au BufNewFile,BufReadPost Procfile*,Gemfile* setfiletype ruby
  au BufReadPost,BufNewFile *_feature.rb set syntax=rspec

  au FileType ruby,eruby,elixir,eelixir call user#surround#erb()
  au FileType ruby,eruby,elixir,eelixir call user#surround#ruby_string_interpolation()
  au FileType javascript,json call user#surround#javascript_string_interpolation()

  au VimEnter,WinEnter,BufWinEnter,FileType,BufUnload,VimResized * call statusline#update()

  au User ALELint SignifyRefresh | call statusline#update()
  au User FzfStatusLine call statusline#fzf#()

  au FileWritePre,BufWritePre * call buffer#trim()

  au FocusGained,BufEnter,FileChangedShellPost * silent! SignifyRefresh

  au BufRead,BufNewFile *
        \ if getline(1) =~? '\c^#!.*javascript' |
        \   let &filetype = 'javascript' |
        \ endif

  if has('nvim')
    au TermOpen * setlocal nonumber norelativenumber nocursorline bufhidden=hide
  else
    au BufWinEnter * if &buftype == 'terminal' | setlocal nonumber norelativenumber nocursorline bufhidden=hide | endif
  end
aug END
