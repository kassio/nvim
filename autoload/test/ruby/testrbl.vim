" ATENTION: Will only match with testrbl if:
"   * g:test_ruby_runner == 'testrbl'
"   * g:test#runners['Ruby'] == ['Testrbl']
function! test#ruby#testrbl#use() abort
  let g:test_ruby_runner = 'testrbl'
  let l:runners = get(g:, 'test#runners', {})
  let l:runners['Ruby'] = get(l:runners, 'Ruby', []) + ['Testrbl']
  let g:test#runners = l:runners
endfunction

function! test#ruby#testrbl#test_file(file) abort
  if get(g:, 'test_ruby_runner', '') ==# 'testrbl'
    return a:file =~# '_test\.rb$'
  end
endfunction

function! test#ruby#testrbl#build_position(type, position) abort
  if a:type ==# 'nearest'
    return [a:position['file'].':'.a:position['line']]
  elseif a:type ==# 'file'
    return [a:position['file']]
  else
    return []
  end
endfunction

function! test#ruby#testrbl#build_args(args) abort
  return a:args
endfunction

function! test#ruby#testrbl#executable() abort
  return 'testrbl'
endfunction
