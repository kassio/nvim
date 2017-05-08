aug user:autocmd
  au!
  au BufReadPost * call buffer#restore_cursor_position()

  au FileType tex,txt,mail,text,markdown setlocal textwidth=80 noautoindent nocindent

  au BufNewFile,BufRead *.json setf javascript

  au BufReadPost,BufNewFile *_feature.rb set syntax=rspec

  au FileType sh,html,javascript,css,eruby,eelixir,sass,scss,yaml setlocal iskeyword+=-
  au FileType ruby,eruby,elixir,eelixir setlocal iskeyword+=\?,\!,@-@

  au FileType ruby,eruby,elixir,eelixir call user#surround#erb()
  au FileType ruby,eruby,elixir,eelixir call user#surround#ruby_string_interpolation()

  au FileType javascript,json call user#surround#javascript_string_interpolation()

  " statusline
  au VimEnter,WinEnter,BufWinEnter,FileType,BufUnload,VimResized * call statusline#update()
  au User FzfStatusLine call statusline#fzf()

  au BufWritePre * call buffer#trim()

  au BufReadPost fugitive://* set bufhidden=delete

  au BufWritePost,BufReadPost * Neomake

  au FocusGained,BufEnter * silent! checktime

  au FocusLost * call window#unfocus(["norelativenumber"])
  au FocusGained * call window#focus(["norelativenumber"])
  au WinLeave * call window#unfocus()
  au WinEnter * call window#focus()
aug END
