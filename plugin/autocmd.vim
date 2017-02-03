aug user_autocmds
  au!
  au BufReadPost *
        \ if !exists('b:open_at_first_line') &&
        \    line("'\"") > 0 &&
        \    line("'\"") <= line("$") |
        \   execute 'normal! g`"' |
        \ endif

  au BufEnter,BufWritePost * call git#check_user()

  au BufNewFile,BufRead *.json setf javascript
  au FileType html,javascript,css,eruby,eelixir,sass,scss,yaml setlocal iskeyword+=-
  au BufReadPost,BufNewFile *_feature.rb set syntax=rspec

  au FileType gitcommit let b:open_at_first_line = 1
  au FileType gitcommit setlocal textwidth=72
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

  " persistent undo
  au FileType gitcommit setlocal noundofile

  " statusline
  au VimEnter,WinEnter,BufWinEnter,FileType,BufUnload,VimResized *
        \ call statusline#update()

  au BufWritePre * call buffer#trim()

  au BufReadPost fugitive://* set bufhidden=delete

  au WinLeave * setlocal nocursorline norelativenumber
  au WinEnter * setlocal cursorline relativenumber
aug END
