aug user:ruby
  au!
  au BufNewFile,BufRead .simplecov call s:rubyfile()
aug END

function! s:rubyfile()
  set filetype=ruby
endfunction
