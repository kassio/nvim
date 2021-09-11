aug user:ruby
  au!
  au BufNewFile,BufRead .simplecov,Dangerfile call s:rubyfile()
aug END

function! s:rubyfile()
  set filetype=ruby
endfunction
