" ATENTION: Will only match with testrbl if:
"   * g:test_ruby_runner == 'testrbl'
"   * g:test#runners['Ruby'] == ['Testrbl']
function! test#ruby#testrbl#use()
  let g:test_ruby_runner = 'testrbl'
  let g:test#runners['Ruby'] = ['Testrbl']
endfunction

function! test#ruby#testrbl#test_file(file)
  if get(g:, 'test_ruby_runner', '') ==# 'testrbl'
    return a:file =~# '_test\.rb$'
  end
endfunction

function! test#ruby#testrbl#build_position(type, position)
  if a:type ==# 'nearest'
    return [a:position['file'].':'.a:position['line']]
  elseif a:type ==# 'file'
    return [a:position['file']]
  else
    return []
  end
endfunction

function! test#ruby#testrbl#build_args(args)
  return a:args
endfunction

function! test#ruby#testrbl#executable()
  return 'testrbl'
endfunction
