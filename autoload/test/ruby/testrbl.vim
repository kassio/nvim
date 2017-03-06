" Returns true if the given file belongs to your test runner
function! test#ruby#testrbl#test_file(file)
  if get(g:, 'test_ruby_runner', '') == 'testrbl'
    return a:file =~# '_test\.rb$'
  end
endfunction

" Returns test runner's arguments which will run the current file and/or line
function! test#ruby#testrbl#build_position(type, position)
  if a:type == 'nearest'
    return [a:position['file'].':'.a:position['line']]
  elseif a:type == 'file'
    return [a:position['file']]
  else
    return []
  end
endfunction

" Returns processed args (if you need to do any processing)
function! test#ruby#testrbl#build_args(args)
  return a:args
endfunction

" Returns the executable of your test runner
function! test#ruby#testrbl#executable()
  return 'testrbl'
endfunction
