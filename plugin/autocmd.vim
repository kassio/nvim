aug user_autocmds
  au!
  au BufReadPost *
        \ if !exists('b:open_at_first_line') &&
        \    line("'\"") > 0 &&
        \    line("'\"") <= line("$") |
        \   execute 'normal! g`"' |
        \ end

  au BufEnter,BufWritePost * call git#check_user()

  au BufNewFile,BufRead *.json setf javascript
  au FileType html,javascript,css,eruby,eelixir,sass,scss,yaml setlocal iskeyword+=-
  au BufReadPost,BufNewFile *_feature.rb set syntax=rspec

  au FileType tex,txt,mail,text,markdown setlocal textwidth=80 noautoindent nocindent

  au FocusGained,BufEnter * checktime

  au FileType ruby,eruby,elixir,eelixir let [
        \ g:surround_{char2nr("#")},
        \ g:surround_{char2nr("-")},
        \ g:surround_{char2nr("=")}
        \ ] = [
        \ "#{\r}",
        \ "<% \r %>",
        \ "<%= \r %>"
        \ ]
  au FileType ruby,eruby,elixir,eelixir setlocal iskeyword+=\?,\!,@-@

  " statusline
  au VimEnter,WinEnter,BufWinEnter,FileType,BufUnload,VimResized *
        \ call statusline#update()
  " FZF statusline
  au User FzfStatusLine call statusline#fzf()

  au BufWritePre * call buffer#trim()

  au BufReadPost fugitive://* set bufhidden=delete

  au WinLeave * if empty(&buftype) || &buftype == "terminal" | setlocal norelativenumber nocursorline | end
  au WinEnter * if empty(&buftype) && &buftype == "terminal" | setlocal cursorline | end
  au WinEnter * if empty(&buftype) && &buftype != "terminal" | setlocal relativenumber cursorline | end
aug END
