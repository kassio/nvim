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
  au FileType html,javascript,css,eruby,sass,scss,yaml setlocal iskeyword+=-
  au BufReadPost,BufNewFile *_feature.rb set syntax=rspec

  au FileType gitcommit let b:open_at_first_line = 1
  au FileType gitcommit setlocal textwidth=72
  au FileType tex,txt,mail,text,markdown setlocal textwidth=80 noautoindent nocindent

  au FocusGained,BufEnter * SignifyRefresh
  au FocusGained,BufEnter * checktime

  " persistent undo
  au FileType gitcommit setlocal noundofile
  au VimEnter *
        \ if !isdirectory(&undodir) |
        \   call mkdir(expand(&undodir), "p", 0700) |
        \ endif

  " statusline
  au VimEnter,WinEnter,BufWinEnter,FileType,BufUnload,VimResized *
        \ call statusline#update()

  au BufWritePre * call buffer#trim()

  au BufReadPost fugitive://* set bufhidden=delete
aug END
