aug user:autocmd
  au!
  au BufReadPost *
        \ if !exists('b:open_at_first_line') &&
        \    line("'\"") > 0 &&
        \    line("'\"") <= line("$") |
        \   execute 'normal! g`"' |
        \ end

  au BufNewFile,BufRead *.json setf javascript
  au FileType html,javascript,css,eruby,eelixir,sass,scss,yaml setlocal iskeyword+=-
  au BufReadPost,BufNewFile *_feature.rb set syntax=rspec

  au FileType tex,txt,mail,text,markdown setlocal textwidth=80 noautoindent nocindent

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
  au VimEnter,WinEnter,BufWinEnter,FileType,BufUnload,VimResized * call statusline#update()
  au User FzfStatusLine call statusline#fzf()

  au BufWritePre * call buffer#trim()

  au BufReadPost fugitive://* set bufhidden=delete

  au BufWritePost,BufReadPost * Neomake

  au FocusGained,BufEnter * silent! checktime

  au WinLeave * call window#unfocus()
  au WinEnter * call window#focus()
aug END
